package DTNsShop.poly.controller;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import DTNsShop.poly.dao.AccountDAO;
import DTNsShop.poly.dao.CategoryDAO;
import DTNsShop.poly.dao.ColorsDAO;
import DTNsShop.poly.dao.FavoriteDAO;
import DTNsShop.poly.dao.OrderDAO;
import DTNsShop.poly.dao.OrderDetailsDAO;
import DTNsShop.poly.dao.ProductDAO;
import DTNsShop.poly.dao.ProductImageDAO;
import DTNsShop.poly.entity.Account;
import DTNsShop.poly.entity.Categories;
import DTNsShop.poly.entity.Colors;
import DTNsShop.poly.entity.Favorite;
import DTNsShop.poly.entity.Order;
import DTNsShop.poly.entity.OrderDetails;
import DTNsShop.poly.entity.Product;
import DTNsShop.poly.entity.ProductImages;
import DTNsShop.poly.entity.Report;
import DTNsShop.poly.entity.Report2;
import DTNsShop.poly.service.ParamService;
import DTNsShop.poly.service.SessionService;

@Controller
@RequestMapping("DTNsShop/admin")
public class AdminController {

	String urlPage = "admin/";

	@Autowired
	AccountDAO accountDAO;
	@Autowired
	ProductDAO productDAO;
	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	ColorsDAO colorDAO;
	@Autowired
	OrderDAO orderDAO;
	@Autowired
	OrderDetailsDAO orderDetailDAO;
	@Autowired
	FavoriteDAO favDAO;
	@Autowired
	ProductImageDAO imageDAO;

	@Autowired
	SessionService session;
	@Autowired
	ParamService param;

	// Admin Home page :))
	@RequestMapping()
	public String adminIndexPage(Model model) {

		model.addAttribute("account_count", accountDAO.getCount());
		model.addAttribute("product_count", productDAO.getCount());
		model.addAttribute("category_count", categoryDAO.getCount());
		model.addAttribute("order_count", orderDAO.getCount());

		return urlPage + "index";
	}

	/* Account */
	// Account Manager Form :V
	@RequestMapping("/account-manager.html")
	public String acountManagerPage() {
		session.remove("user_temp2");

		return urlPage + "account_manager";
	}

	@PostMapping("/account-manager.html/add")
	public String acountManagerAdd(Model m, Account ac, @RequestParam("username") String username,
			@RequestParam("fullname") String fullname, @RequestParam("phonenumber") String phonenumber,
			@RequestParam("email") String email, @RequestParam("password") String pass,
			@RequestParam("confirmPassword") String confirmPass, @RequestParam("admins") Boolean admins,
			@RequestParam("active") Boolean active, @RequestParam("attach") Optional<MultipartFile> photo) {
		int loi = 0;

		if (username.isEmpty()) {
			m.addAttribute("messageU", "*Username không được bỏ trống!");
			loi++;
		} else {
			if (!accountDAO.findById(username).isEmpty()) {
				m.addAttribute("messageU", "*Username đã tồn tại!");
				loi++;
			} else {
				m.addAttribute("messageU", null);
			}
		}
		if (fullname.isEmpty()) {
			m.addAttribute("messageF", "*Họ tên không được bỏ trống!");
			loi++;
		} else {
			m.addAttribute("messageF", null);
		}
		String dinhDangSdt = "^(0|\\+84)(\\s|\\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\\d)(\\s|\\.)?(\\d{3})(\\s|\\.)?(\\d{3})$";
		if (phonenumber.isEmpty()) {
			m.addAttribute("messagePN", "*Số điện thoại không được bỏ trống!");
			loi++;
		} else {
			if (!phonenumber.matches(dinhDangSdt)) {
				m.addAttribute("messagePN", "*Định dạng sdt không hợp lệ!");
				loi++;
			} else {
				m.addAttribute("messagePN", null);
			}
		}
		String dinhdangGmail = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@gmail+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
		String dinhdangFpt = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" + "fpt+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

		if (email.isEmpty()) {
			m.addAttribute("messageE", "*Email không được bỏ trống!");
			loi++;
		} else {
			if (!email.matches(dinhdangGmail) && !email.matches(dinhdangFpt)) {
				m.addAttribute("messageE", "*Định dạng email không hợp lệ!");
				loi++;
			} else {
				m.addAttribute("messageE", null);
			}
		}
		if (pass.isEmpty()) {
			m.addAttribute("messageP", "*Vui lòng nhập mật khẩu!");
			loi++;
		} else {
			if (pass.length() < 3) {
				m.addAttribute("messageP", "*Mật khẩu mới phải có ít nhất 3 ký tự!");
				loi++;
			} else {
				m.addAttribute("messageP", null);
			}
		}
		if (confirmPass.isEmpty()) {
			m.addAttribute("messageCP", "*Vui lòng nhập lại mật khẩu!");
			loi++;
		} else {
			if (!confirmPass.equals(pass)) {
				m.addAttribute("messageCP", "*Mật khẩu nhập lại không trùng khớp!");
				loi++;
			} else {
				m.addAttribute("messageCP", null);
			}
		}
		param.save(photo, "/uploads/user/", "photo_" + username);
		String img = "";
		if (photo.get().isEmpty()) {
			img = "default.jpg";
		} else {
			img = param.getFileName();
		}

		ac = new Account(username, pass, fullname, email, phonenumber, active, admins, img);

		session.set("user_temp2", ac);

		if (loi == 0) {

			accountDAO.save(ac);

			m.addAttribute("message", "Tạo tài khoản thành công !!!");
			session.remove("user_temp2");
		}

		return urlPage + "account_manager";
	}

	// Account Manager List :V
	int them = 0;
	int xoaac = 0;
	String idc = "";

	@RequestMapping({ "/account-list.html/sort", "/account-list.html" })
	public String acountManagerListPage(Model m, @RequestParam("field") Optional<String> field,
			@RequestParam("sort") Optional<Integer> criteria, @RequestParam("p") Optional<Integer> p,
			@RequestParam("keywords") Optional<String> kw) {
		String kwords = kw.orElse(session.get("keywords", ""));
		session.set("keywords", kwords);

		if (them != 0) {
			m.addAttribute("message", "Thêm tài khoản thành công!");
			them = 0;
		}
		if (xoaac != 0) {
			m.addAttribute("message", "Đã xóa tài khoản " + idc + "!");
			xoaac = 0;
		}

		int s = criteria.orElse(0);
		int paging = p.orElse(0);
		Sort sort;
		Pageable pageable;
		if (s == 0) {
			sort = Sort.by(Direction.ASC, field.orElse("username"));
			s = 1;
		} else {
			sort = Sort.by(Direction.DESC, field.orElse("username"));
			s = 0;
		}

		m.addAttribute("field2", field.orElse("username"));
		m.addAttribute("sort", s);
		m.addAttribute("number", paging);

		pageable = PageRequest.of(paging, 5, sort);

		Page<Account> list = accountDAO.findByKeywords("%" + kwords + "%", pageable);
		m.addAttribute("items", list);

		return urlPage + "account_list";
	}

	// Account add +++
	@PostMapping("/account-list.html/add")
	public String acountListPageAdd(Model m, Account ac, @RequestParam("username2") String username2,
			@RequestParam("fullname2") String fullname2, @RequestParam("phonenumber2") String phonenumber2,
			@RequestParam("email2") String email2, @RequestParam("password2") String pass,
			@RequestParam("confirmPassword2") String confirmPass2, @RequestParam("admins2") Boolean admins2,
			@RequestParam("active2") Boolean active2, @RequestParam("attach2") Optional<MultipartFile> photo2) {

		m.addAttribute("show", true);

		int loi = 0;

		if (username2.isEmpty()) {
			m.addAttribute("messageU", "*Username không được bỏ trống!");
			loi++;
		} else {
			if (!accountDAO.findById(username2).isEmpty()) {
				m.addAttribute("messageU", "*Username đã tồn tại!");
				loi++;
			} else {
				m.addAttribute("messageU", null);
			}
		}
		if (fullname2.isEmpty()) {
			m.addAttribute("messageF", "*Họ tên không được bỏ trống!");
			loi++;
		} else {
			m.addAttribute("messageF", null);
		}
		String dinhDangSdt = "^(0|\\+84)(\\s|\\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\\d)(\\s|\\.)?(\\d{3})(\\s|\\.)?(\\d{3})$";
		if (phonenumber2.isEmpty()) {
			m.addAttribute("messagePN", "*Số điện thoại không được bỏ trống!");
			loi++;
		} else {
			if (!phonenumber2.matches(dinhDangSdt)) {
				m.addAttribute("messagePN", "*Định dạng sdt không hợp lệ!");
				loi++;
			} else {
				m.addAttribute("messagePN", null);
			}
		}
		String dinhdangGmail = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@gmail+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
		String dinhdangFpt = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" + "fpt+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

		if (email2.isEmpty()) {
			m.addAttribute("messageE", "*Email không được bỏ trống!");
			loi++;
		} else {
			if (!email2.matches(dinhdangGmail) && !email2.matches(dinhdangFpt)) {
				m.addAttribute("messageE", "*Định dạng email không hợp lệ!");
				loi++;
			} else {
				m.addAttribute("messageE", null);
			}
		}
		if (pass.isEmpty()) {
			m.addAttribute("messageP", "*Vui lòng nhập mật khẩu!");
			loi++;
		} else {
			if (pass.length() < 3) {
				m.addAttribute("messageP", "*Mật khẩu mới phải có ít nhất 3 ký tự!");
				loi++;
			} else {
				m.addAttribute("messageP", null);
			}
		}
		if (confirmPass2.isEmpty()) {
			m.addAttribute("messageCP", "*Vui lòng nhập lại mật khẩu!");
			loi++;
		} else {
			if (!confirmPass2.equals(pass)) {
				m.addAttribute("messageCP", "*Mật khẩu nhập lại không trùng khớp!");
				loi++;
			} else {
				m.addAttribute("messageCP", null);
			}
		}
		param.save(photo2, "/uploads/user/", "photo_" + username2);
		String img = "";
		if (photo2.get().isEmpty()) {
			img = "default.jpg";
		} else {
			img = param.getFileName();
		}
		System.out.println(img);

		ac = new Account(username2, pass, fullname2, email2, phonenumber2, active2, admins2, img);

		session.set("user_temp2", ac);

		if (loi == 0) {
			// accountDAO.save(ac);
			session.remove("user_temp2");
			m.addAttribute("show", false);
			accountDAO.save(ac);
			them = 1;
			return "redirect:/DTNsShop/admin/account-list.html";
		}

		return "forward:/DTNsShop/admin/account-list.html";
	}

	// Account Update ++++++
	@PostMapping("/account-list.html/update/{id}")
	public String accountUpdate(Model m, Account ac, @PathVariable("id") String id,
			@RequestParam("fullname3") String fullname3, @RequestParam("phonenumber3") String phonenumber3,
			@RequestParam("email3") String email3, @RequestParam("admins3") Boolean admins3,
			@RequestParam("active3") Boolean active3, @RequestParam("attach3") Optional<MultipartFile> photo) {

		m.addAttribute("showEdit", true);
		m.addAttribute("items2", accountDAO.findById(id).get());

		int loi = 0;
		String img = "";

		if (fullname3.isEmpty()) {
			m.addAttribute("messageF2", "*Họ tên không được bỏ trống!");
			loi++;
		} else {
			m.addAttribute("messageF2", null);
		}
		String dinhDangSdt = "^(0|\\+84)(\\s|\\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\\d)(\\s|\\.)?(\\d{3})(\\s|\\.)?(\\d{3})$";
		if (phonenumber3.isEmpty()) {
			m.addAttribute("messagePN2", "*Số điện thoại không được bỏ trống!");
			loi++;
		} else {
			if (!phonenumber3.matches(dinhDangSdt)) {
				m.addAttribute("messagePN2", "*Định dạng sdt không hợp lệ!");
				loi++;
			} else {
				m.addAttribute("messagePN2", null);
			}
		}
		String dinhdangGmail = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@gmail+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
		String dinhdangFpt = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" + "fpt+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

		if (email3.isEmpty()) {
			m.addAttribute("messageE2", "*Email không được bỏ trống!");
			loi++;
		} else {
			if (!email3.matches(dinhdangGmail) && !email3.matches(dinhdangFpt)) {
				m.addAttribute("messageE2", "*Định dạng email không hợp lệ!");
				loi++;
			} else {
				m.addAttribute("messageE2", null);
			}
		}
		param.save(photo, "/uploads/user/", "photo_" + id);
		System.out.println(photo.get().getSize());

		ac = accountDAO.findById(id).get();
		ac.setFullname(fullname3);
		ac.setEmail(email3);
		ac.setPhonenumber(phonenumber3);
		ac.setActive(active3);
		ac.setAdmins(admins3);

		if (photo.get().getSize() > 0) {
			if (param.getFileName() != null) {
				img = param.getFileName();
				ac.setPhoto(img);
			} else {
				ac.setPhoto(ac.getPhoto());
			}
		}

		session.set("user_temp2", ac);

		if (loi == 0) {

			accountDAO.save(ac);

			m.addAttribute("message1", "Cập nhật tài khoản " + id + " thành công !!!");
			session.remove("user_temp2");
		}

		return "forward:/DTNsShop/admin/account-list.html";
	}

	@PostMapping("/account-list.html/delete/{id}")
	public String accountRemove(Model m, @PathVariable("id") String id) {

		accountDAO.deleteById(id);
		idc = id;
		xoaac = 1;

		return "redirect:/DTNsShop/admin/account-list.html";
	}

	// Cancel
	@RequestMapping("/account-list.html/cancel")
	public String acountListPageCancel(Model m) {
		m.addAttribute("show", false);
		m.addAttribute("showEdit", false);
		m.addAttribute("message", null);
		session.remove("user_temp2");

		return "redirect:/DTNsShop/admin/account-list.html";
	}
	/* Account */

	/* Product */
	// Products Manager Form Page (= o =)
	int themspp = 0;

	@RequestMapping("/product-manager.html")
	public String productManagerPage(Model m) {
		if (themspp != 0) {
			m.addAttribute("message", "*Thêm sản phẩm " + productDAO.findIdMax() + " thành công!");
			themspp = 0;
		}

		List<Categories> list2 = categoryDAO.findAll();

		m.addAttribute("category", list2);

		return urlPage + "product_manager";
	}

	@PostMapping("/product-manager.html/add")
	public String productManaAdd(Model m, Product product, @RequestParam("name2") String name2,
			@RequestParam("category2") String cate2, @RequestParam("amount2") String amount2,
			@RequestParam("price2") String price2, @RequestParam("available2") Boolean available2,
			@RequestParam("review2") String review2, @RequestParam("attach1") Optional<MultipartFile> photo2) {
		int loi = 0;
		double gia;

		if (price2.isEmpty()) {
			gia = 0;
		} else {
			gia = Double.valueOf(price2);
		}

		product = new Product(name2, "default.jpg", gia, new Date(), available2, amount2, review2);

		if (name2.isEmpty()) {
			m.addAttribute("messageN2", "*Tên sản phẩm không được bỏ trống!");
			loi++;
		} else {
			m.addAttribute("messageN2", null);
		}
		if (cate2.isEmpty()) {
			m.addAttribute("messageC2", "*Vui lòng chọn danh mục!");
			loi++;
		} else {
			m.addAttribute("messageC2", null);
			product.setCategory(categoryDAO.findById(cate2).get());
		}
		if (amount2.isEmpty()) {
			m.addAttribute("messageA2", "*Vui lòng nhập số lượng!");
			loi++;
		} else {
			if (Integer.parseInt(amount2) <= 0) {
				m.addAttribute("messageA2", "*Vui lòng nhập số lượng sản phẩm lớn hơn 0!");
				loi++;
			} else {
				m.addAttribute("messageA2", null);
			}
		}
		if (price2.isEmpty()) {
			m.addAttribute("messageP2", "*Vui lòng nhập đơn giá!");
			loi++;
		} else {
			if (Double.parseDouble(price2) <= 0) {
				m.addAttribute("messageP2", "*Đơn giá phải lớn hơn 0!");
				loi++;
			} else {
				m.addAttribute("messageP2", null);
			}
		}

		String img = "";
		if (photo2.get().isEmpty()) {
			img = "default.jpg";
		} else {
			param.save(photo2, "/uploads/product/", "productImg_" + (productDAO.findIdMax() + 1));
			img = param.getFileName();
		}
		product.setImages(img);
		session.set("product_temp", product);

		if (loi == 0) {
			productDAO.save(product);
			themspp = 2;
			session.remove("product_temp");
			return "redirect:/DTNsShop/admin/product-manager.html";
		}

		return "forward:/DTNsShop/admin/product-manager.html";
	}

	// >>Products Manager List Page (= o =)
	int xoasp = 0;
	Long idsp = null;

	@RequestMapping({ "/product-list.html", "/product-list.html/sort" })
	public String productManagerListPage(Model m, @RequestParam("field") Optional<String> field,
			@RequestParam("sort") Optional<Integer> criteria, @RequestParam("p") Optional<Integer> p,
			@RequestParam("keywords") Optional<String> kw) {

		String kwords = kw.orElse(session.get("keywords_product", ""));
		session.set("keywords_product", kwords);
		if (xoasp != 0) {
			if (idsp != null) {
				m.addAttribute("message1", "*Đã xóa sản phẩm " + idsp + " !");
			}
			xoasp = 0;
		}

		int s = criteria.orElse(0);
		int paging = p.orElse(0);
		Sort sort;
		Pageable pageable;
		if (s == 0) {
			sort = Sort.by(Direction.ASC, field.orElse("id"));
			s = 1;
		} else {
			sort = Sort.by(Direction.DESC, field.orElse("id"));
			s = 0;
		}

		pageable = PageRequest.of(paging, 5, sort);

		m.addAttribute("field2", field.orElse("id"));
		m.addAttribute("sort", s);
		m.addAttribute("number", paging);

		Page<Product> list = productDAO.findAllBynameLike("%" + kwords + "%", pageable);

		List<Categories> list2 = categoryDAO.findAll();

		m.addAttribute("category", list2);
		m.addAttribute("products", list);

		return urlPage + "product_list";
	}

	@RequestMapping("/product-list.html/add")
	public String productListAdd(Model m, Product product, @RequestParam("name2") String name2,
			@RequestParam("category1") String cate2, @RequestParam("amount2") String amount2,
			@RequestParam("price2") String price2, @RequestParam("available2") Boolean available2,
			@RequestParam("review2") String review2, @RequestParam("attach1") Optional<MultipartFile> photo2) {
		m.addAttribute("show", true);

		int loi = 0;
		double gia;

		if (price2.isEmpty()) {
			gia = 0;
		} else {
			gia = Double.valueOf(price2);
		}

		product = new Product(name2, "default.jpg", gia, new Date(), available2, amount2, review2);

		if (name2.isEmpty()) {
			m.addAttribute("messageN2", "*Tên sản phẩm không được bỏ trống!");
			loi++;
		} else {
			m.addAttribute("messageN2", null);
		}
		if (cate2.isEmpty()) {
			m.addAttribute("messageC2", "*Vui lòng chọn danh mục!");
			loi++;
		} else {
			m.addAttribute("messageC2", null);
			product.setCategory(categoryDAO.findById(cate2).get());
		}
		if (amount2.isEmpty()) {
			m.addAttribute("messageA2", "*Vui lòng nhập số lượng!");
			loi++;
		} else {
			if (Integer.parseInt(amount2) <= 0) {
				m.addAttribute("messageA2", "*Vui lòng nhập số lượng sản phẩm lớn hơn 0!");
				loi++;
			} else {
				m.addAttribute("messageA2", null);
			}
		}
		if (price2.isEmpty()) {
			m.addAttribute("messageP2", "*Vui lòng nhập đơn giá!");
			loi++;
		} else {
			if (Double.parseDouble(price2) <= 0) {
				m.addAttribute("messageP2", "*Đơn giá phải lớn hơn 0!");
				loi++;
			} else {
				m.addAttribute("messageP2", null);
			}
		}

		String img = "";
		if (photo2.get().isEmpty()) {
			img = "default.jpg";
		} else {
			param.save(photo2, "/uploads/product/", "productImg_" + (productDAO.findIdMax() + 1));
			img = param.getFileName();
		}
		product.setImages(img);
		session.set("product_temp", product);

		if (loi == 0) {
			productDAO.save(product);

			m.addAttribute("message", "*Thêm sản phẩm " + productDAO.findIdMax() + " thành công!");
			session.remove("product_temp");
		}

		return "forward:/DTNsShop/admin/product-list.html";
	}

	// Product List Update
	@PostMapping("/product-list.html/update/{id}")
	public String productListUpdate(Model m, @PathVariable("id") Long id, Product product,
			@RequestParam("name1") String name1, @RequestParam("category2") String cate1,
			@RequestParam("amount1") String amount1, @RequestParam("price1") String price1,
			@RequestParam("available1") Boolean available1, @RequestParam("review1") String review1,
			@RequestParam("attach1") Optional<MultipartFile> photo1) {

		m.addAttribute("showEdit", true);
		product = productDAO.findById(id).get();
		product.setName(name1);
		if (cate1.equals("")) {
			product.setCategory(null);
		}
		if (!price1.isEmpty()) {
			product.setPrice(Double.parseDouble(price1));
		} else {
			product.setPrice(0.0);
		}
		product.setAmount(amount1);
		product.setAvailable(available1);
		product.setReview(review1);

		m.addAttribute("items", product);
		int loi = 0;

		if (name1.isEmpty()) {
			m.addAttribute("messageN1", "*Tên sản phẩm không được bỏ trống!");
			loi++;
		} else {
			m.addAttribute("messageN1", null);
		}
		if (cate1.isEmpty()) {
			m.addAttribute("messageC1", "*Vui lòng chọn danh mục!");
			loi++;
		} else {
			m.addAttribute("messageC1", null);
			product.setCategory(categoryDAO.findById(cate1).get());
		}
		if (amount1.isEmpty()) {
			m.addAttribute("messageA1", "*Vui lòng nhập số lượng!");
			loi++;
		} else {
			if (Integer.parseInt(amount1) <= 0) {
				m.addAttribute("messageA1", "*Vui lòng nhập số lượng sản phẩm lớn hơn 0!");
				loi++;
			} else {
				m.addAttribute("messageA1", null);
			}
		}
		if (price1.isEmpty()) {
			m.addAttribute("messageP1", "*Vui lòng nhập đơn giá!");
			loi++;
		} else {
			if (Double.parseDouble(price1) <= 0) {
				m.addAttribute("messageP1", "*Đơn giá phải lớn hơn 0!");
				product.setPrice(Double.parseDouble(price1));
				loi++;
			} else {
				m.addAttribute("messageP1", null);
			}
		}

		String img = "";
		if (photo1.get().getSize() > 0) {
			param.save(photo1, "/uploads/product/", "productImg_" + id);
			if (param.getFileName() != null) {
				img = param.getFileName();
				product.setImages(img);
			} else {
				product.setImages(product.getImages());
			}
		}

		if (loi == 0) {
			productDAO.save(product);
			m.addAttribute("message", "*Cập nhật sản phẩm " + id + " thành công! :))");
		}

		return "forward:/DTNsShop/admin/product-list.html";
	}

	// Product List Delete
	@PostMapping("/product-list.html/delete/{id}")
	public String productRemove(Model m, @PathVariable("id") String id) {
		productDAO.deleteById(Long.valueOf(id));
		xoasp = 2;
		idsp = Long.valueOf(id);

		return "redirect:/DTNsShop/admin/product-list.html";
	}

	@RequestMapping("/product-list.html/cancel")
	public String productListCancel(Model m) {
		m.addAttribute("show", false);
		m.addAttribute("showEdit", false);

		return "redirect:/DTNsShop/admin/product-list.html";
	}

	// >>Products Manager Category Page (= o =)
	int cate11 = 0;String cateid = "";
	@RequestMapping({ "/product-category.html", "/product-category.html/sort" })
	public String productManagerCategoryPage(Model m, @RequestParam("field") Optional<String> field,
			@RequestParam("sort") Optional<Integer> criteria, @RequestParam("p") Optional<Integer> p,
			@RequestParam("keywords") Optional<String> kw) {

		List<Categories> list2 = categoryDAO.findAll();

		m.addAttribute("category", list2);
		m.addAttribute("product", productDAO.findAll());

		String kwords = kw.orElse(session.get("keywords_pr1", ""));
		session.set("keywords_pr1", kwords);

		int s = criteria.orElse(0);
		int paging = p.orElse(0);
		Sort sort;
		Pageable pageable;
		if (s == 0) {
			sort = Sort.by(Direction.ASC, field.orElse("id"));
			s = 1;
		} else {
			sort = Sort.by(Direction.DESC, field.orElse("id"));
			s = 0;
		}

		m.addAttribute("field2", field.orElse("id"));
		m.addAttribute("sort", s);
		m.addAttribute("number", paging);
		

		pageable = PageRequest.of(paging, 5, sort);

		Page<Product> list = categoryDAO.getAllCategoProduct("%" + kwords + "%", pageable);
		m.addAttribute("items", list);

		if(cate11 != 0) {
			m.addAttribute("message","Cập nhật danh mục sản phẩm "+cateid+" thành công!");
			cate11 = 0;
		}
		
		return urlPage + "product_category";
	}
	@PostMapping("/product-category.html/update")
	public String updateCategoryProduct(Model m,@RequestParam("category") String cate,@RequestParam("product") Long id) {
		
		Product pr = productDAO.findById(id).get();
		pr.setCategory(categoryDAO.getById(cate));
		productDAO.save(pr);
		cate11 ++;
		cateid = pr.getName();
		
		return "redirect:/DTNsShop/admin/product-category.html";
	}
	
	int themcolor2 = 0;int xoacolor2 = 0;String nameColor2;
	// >>Products Manager Color Page (= o =)
	@RequestMapping({"/product-color.html","/product-color.html/sort"})
	public String productManagerColorPage(Model m, @RequestParam("field") Optional<String> field,
			@RequestParam("sort") Optional<Integer> criteria, @RequestParam("p") Optional<Integer> p,
			@RequestParam("keywords") Optional<String> kw) {

		String kwords = kw.orElse(session.get("keywords_color2", ""));
		session.set("keywords_color2", kwords);

		int s = criteria.orElse(0);
		int paging = p.orElse(0);
		Sort sort;
		Pageable pageable;
		if (s == 0) {
			sort = Sort.by(Direction.ASC, field.orElse("id"));
			s = 1;
		} else {
			sort = Sort.by(Direction.DESC, field.orElse("id"));
			s = 0;
		}

		m.addAttribute("field2", field.orElse("id"));
		m.addAttribute("sort", s);
		m.addAttribute("number", paging);
		m.addAttribute("colors",colorDAO.findAll());
		m.addAttribute("product",productDAO.findAll());

		pageable = PageRequest.of(paging, 5, sort);
		Page<ProductImages> list = imageDAO.getAllImages("%"+kwords+"%", pageable);
		m.addAttribute("items", list);
		
		if(xoacolor2 != 0) {
			m.addAttribute("message","Đã xóa hình ảnh "+nameColor2+" thành công!");
			xoacolor2 = 0;
		}
		if (themcolor2 != 0) {
			m.addAttribute("message", "*Cập nhật hình ảnh "+nameColor2+" thành công!");
			themcolor2 = 0;
		}

		return urlPage + "product_color";
	}
	//Product color imgae remove :)))))
	@PostMapping("/product-color.html/delete/{id}")
	public String colorImageRemove(Model m, @PathVariable("id") Long id) {

		ProductImages img = imageDAO.getById(id);
		if(img != null) {
			imageDAO.delete(img);
			xoacolor2++;
			nameColor2= img.getProduct().getName() +" "+img.getColors().getName();
		}

		return "redirect:/DTNsShop/admin/product-color.html";
	}
	//Product color image update :)))
	@PostMapping("/product-color.html/update")
	public String updateImageProduct(Model m,@RequestParam("color") Integer idColor,@RequestParam("product") Long idProduct
			,@RequestParam("attach") Optional<MultipartFile> photo) {
		
		ProductImages img = imageDAO.findByColorAndProduct(idColor, idProduct);
		
		ProductImages imgNew = new ProductImages(); 
		
		String imgs = "";
		
		if (photo.get().isEmpty()) {
			imgs = "default.jpg";
		} else {
			param.save(photo, "/uploads/productImg/", "productImg_"+img.getId());
			imgs = param.getFileName();
		}	
		m.addAttribute("message",imgs);
		
		if(img != null) {
			img.setImages(imgs);			
			imageDAO.save(img);
			
			themcolor2++;
			nameColor2= img.getProduct().getName()+" "+img.getColors().getName();
		}else {
			imgNew.setColors(colorDAO.getById(idColor.intValue()));
			imgNew.setProduct(productDAO.getById(idProduct));
			imgNew.setImages(imgs);
			
			imageDAO.save(imgNew);
			themcolor2++;
			nameColor2= imgNew.getProduct().getName()+" "+imgNew.getColors().getName();
		}
		
		return "redirect:/DTNsShop/admin/product-color.html";
	}
	
	
	int themcolor = 0;int xoacolor = 0;String nameColor;
	// >>Products Manager Color List Page (= o =)
	@RequestMapping({"/color-list.html","/color-list.html/sort"})
	public String productManagerColorListPage(Model m, @RequestParam("field") Optional<String> field,
			@RequestParam("sort") Optional<Integer> criteria, @RequestParam("p") Optional<Integer> p,
			@RequestParam("keywords") Optional<String> kw) {

		String kwords = kw.orElse(session.get("keywords_color1", ""));
		session.set("keywords_color1", kwords);

		if (themcolor != 0) {
			m.addAttribute("message", "*Thêm màu sắc "+nameColor+" thành công!");
			themcolor = 0;
		}
		if (xoacolor > 0) {
			m.addAttribute("message", "Đã xóa màu sắc " + nameColor + "!");
			xoacolor = 0;
		}
//		else if (xoac < 0) {
//			m.addAttribute("message", "Không thể xóa ! Danh mục " + nameColor + " đã có sản phẩm!");
//			xoac = 0;
//		}

		int s = criteria.orElse(0);
		int paging = p.orElse(0);
		Sort sort;
		Pageable pageable;
		if (s == 0) {
			sort = Sort.by(Direction.ASC, field.orElse("id"));
			s = 1;
		} else {
			sort = Sort.by(Direction.DESC, field.orElse("id"));
			s = 0;
		}

		m.addAttribute("field2", field.orElse("id"));
		m.addAttribute("sort", s);
		m.addAttribute("number", paging);

		pageable = PageRequest.of(paging, 5, sort);
		Page<Colors> list = colorDAO.findAllBynameLike("%" + kwords + "%", pageable);
		m.addAttribute("items", list);
		

		return urlPage + "color_list";
	}
	//Color Addd :))
	@RequestMapping("/color-list.html/add")
	public String addColor(Model m, Colors color,
			@RequestParam("name2") String name) {
		int loi = 0;
		m.addAttribute("show", true);

		color = new Colors();
		color.setName(name);
		session.set("color_temp1", color);

		if (name.isEmpty()) {
			m.addAttribute("messageN1", "*Tên màu sắc không được bỏ trống!");
			loi++;
		} else {
			m.addAttribute("messageN1", null);
			nameColor = name;
		}

		if (loi == 0) {
			themcolor++;
			colorDAO.save(color);
			session.remove("color_temp1");
			return "redirect:/DTNsShop/admin/color-list.html";
		}
		return "forward:/DTNsShop/admin/color-list.html";
	}
	//Color Update 
	@PostMapping("/color-list.html/update/{id}")
	public String colorUpdate(Model m, Colors color, @PathVariable("id")Integer id,
			@RequestParam("name") String name) {

		m.addAttribute("showEdit", true);
		m.addAttribute("items2",colorDAO.findById(id).get());

		int loi = 0;
		String img = "";

		if (name.isEmpty()) {
			m.addAttribute("messageN", "*Tên màu sắc không được bỏ trống!");
			loi++;
		} else {
			m.addAttribute("messageN", null);
		}

		color = colorDAO.findById(id).get();

		session.set("color_temp1", color);

		if (loi == 0) {

			color.setName(name);
			colorDAO.save(color);
			m.addAttribute("message1", "Cập nhật màu sắc " + color.getName() + " thành công !!!");

			session.remove("color_temp1");
		}

		return "forward:/DTNsShop/admin/color-list.html";
	}

	@PostMapping("/color-list.html/delete/{id}")
	public String colorRemove(Model m, @PathVariable("id") Integer id) {

		Colors color = colorDAO.getById(id);

		colorDAO.delete(color);
		xoacolor++;
		nameColor = color.getName();

		return "redirect:/DTNsShop/admin/color-list.html";
	}

	@RequestMapping("/color-list.html/cancel")
	public String cancelColor(Model m) {

		m.addAttribute("show", false);
		m.addAttribute("showEdit", false);
		m.addAttribute("message", null);
		session.remove("color_temp1");

		return "redirect:/DTNsShop/admin/color-list.html";
	}
	/* Product */

	/* Category */
	// Categories Manager Form (= v =)
	@RequestMapping("/categories-manager.html")
	public String categoriesManagerPage() {
		return urlPage + "categories_manager";
	}

	@PostMapping("/categories-manager.html/add")
	public String categoryManagerAdd(Model m, Categories category, @RequestParam("id") String idd,
			@RequestParam("name") String name) {
		int loi = 0;

		category = new Categories(idd, name);
		session.set("category_temp2", category);

		if (idd.isEmpty()) {
			m.addAttribute("messageI1", "*Id không được bỏ trống!");
			loi++;
		} else {
			if (!categoryDAO.findById(idd).isEmpty()) {
				m.addAttribute("messageI1", "*Danh mục đã tồn tại!");
				loi++;
			} else {
				m.addAttribute("messageI1", null);
			}
		}
		if (name.isEmpty()) {
			m.addAttribute("messageN1", "*Tên danh mục không được bỏ trống!");
			loi++;
		} else {
			m.addAttribute("messageN1", null);
		}

		if (loi == 0) {
			session.remove("category_temp2");
			categoryDAO.save(category);
			m.addAttribute("message", "Thêm danh mục " + idd + " thành công!");
			// categoryDAO.save(category);
		}
		return urlPage + "categories_manager";
	}

	int xoa = 0;
	String i = "";

	// >>Categories Manager List (= v =)
	@RequestMapping({ "/categories-list.html", "/categories-list.html/sort" })
	public String categoriesListPage(Model m, @RequestParam("field") Optional<String> field,
			@RequestParam("sort") Optional<Integer> criteria, @RequestParam("p") Optional<Integer> p,
			@RequestParam("keywords") Optional<String> kw) {
		String kwords = kw.orElse(session.get("keywords_cate", ""));
		session.set("keywords_cate", kwords);

		if (them != 0) {
			m.addAttribute("message", "*Thêm danh mục thành công!");
			them = 0;
		}
		if (xoa > 0) {
			m.addAttribute("message", "Đã xóa danh mục " + i + "!");
			xoa = 0;
		} else if (xoa < 0) {
			m.addAttribute("message", "Không thể xóa ! Danh mục " + i + " đã có sản phẩm!");
			xoa = 0;
		}

		int s = criteria.orElse(0);
		int paging = p.orElse(0);
		Sort sort;
		Pageable pageable;
		if (s == 0) {
			sort = Sort.by(Direction.ASC, field.orElse("id"));
			s = 1;
		} else {
			sort = Sort.by(Direction.DESC, field.orElse("id"));
			s = 0;
		}

		m.addAttribute("field2", field.orElse("id"));
		m.addAttribute("sort", s);
		m.addAttribute("number", paging);

		pageable = PageRequest.of(paging, 5, sort);
		Page<Categories> list = categoryDAO.findAllBynameLike("%" + kwords + "%", pageable);
		m.addAttribute("items", list);

		return urlPage + "categories_list";
	}

	@RequestMapping("/categories-list.html/add")
	public String addCategory(Model m, Categories category, @RequestParam("id2") String idd,
			@RequestParam("name2") String name) {
		int loi = 0;
		m.addAttribute("show", true);

		category = new Categories(idd, name);
		session.set("category_temp2", category);

		if (idd.isEmpty()) {
			m.addAttribute("messageI1", "*Id không được bỏ trống!");
			loi++;
		} else {
			if (!categoryDAO.findById(idd).isEmpty()) {
				m.addAttribute("messageI1", "*Danh mục đã tồn tại!");
				loi++;
			} else {
				m.addAttribute("messageI1", null);
			}
		}
		if (name.isEmpty()) {
			m.addAttribute("messageN1", "*Tên danh mục không được bỏ trống!");
			loi++;
		} else {
			m.addAttribute("messageN1", null);
		}

		if (loi == 0) {
			them++;
			categoryDAO.save(category);
			session.remove("category_temp2");
			return "redirect:/DTNsShop/admin/categories-list.html";
		}
		return "forward:/DTNsShop/admin/categories-list.html";
	}

	// Account Update ++++++
	@PostMapping("/categories-list.html/update/{id}")
	public String categoryUpdate(Model m, Categories category, @PathVariable("id") String id,
			@RequestParam("name") String name) {

		m.addAttribute("showEdit", true);
		m.addAttribute("items2", categoryDAO.findById(id).get());

		int loi = 0;
		String img = "";

		if (name.isEmpty()) {
			m.addAttribute("messageN", "*Tên danh mục không được bỏ trống!");
			loi++;
		} else {
			m.addAttribute("messageN", null);
		}

		category = categoryDAO.findById(id).get();

		session.set("category_temp2", category);

		if (loi == 0) {

			category.setName(name);
			categoryDAO.save(category);
			m.addAttribute("message1", "Cập nhật danh mục " + id + " thành công !!!");

			session.remove("user_temp2");
		}

		return "forward:/DTNsShop/admin/categories-list.html";
	}

	@PostMapping("/categories-list.html/delete/{id}")
	public String categoryRemove(Model m, @PathVariable("id") String id) {

		Optional<Categories> category = categoryDAO.findById(id);

		if (!category.get().getProduct().isEmpty()) {
			xoa = -1;
		} else {
			categoryDAO.deleteById(id);
			xoa = 2;
		}
		i = id;

		return "redirect:/DTNsShop/admin/categories-list.html";
	}

	@RequestMapping("/categories-list.html/cancel")
	public String cancelCategory(Model m) {

		m.addAttribute("show", false);
		m.addAttribute("showEdit", false);
		m.addAttribute("message", null);
		session.remove("category_temp2");

		return "redirect:/DTNsShop/admin/categories-list.html";
	}
	/* Category */

	/* Order */
	// Order Manager (Waitting)Page =))))
	int order1 = 0;

	@RequestMapping({ "/order-manager.html", "/order-manager.html/sort" })
	public String orderManagerPage(Model m, @RequestParam("field") Optional<String> field,
			@RequestParam("sort") Optional<Integer> criteria, @RequestParam("p") Optional<Integer> p,
			@RequestParam("keywords") Optional<String> kw) {
		String kwords = kw.orElse(session.get("keywords_order", ""));
		session.set("keywords_order", kwords);

		int s = criteria.orElse(0);
		int paging = p.orElse(0);
		Sort sort;
		Pageable pageable;
		if (s == 0) {
			sort = Sort.by(Direction.ASC, field.orElse("id"));
			s = 1;
		} else {
			sort = Sort.by(Direction.DESC, field.orElse("id"));
			s = 0;
		}

		m.addAttribute("field2", field.orElse("id"));
		m.addAttribute("sort", s);
		m.addAttribute("number", paging);

		pageable = PageRequest.of(paging, 5, sort);

		Page<Order> list = orderDAO.getAllOrder1(false, false, "%" + kwords + "%", pageable);
		m.addAttribute("orders", list);

		if (order1 != 0) {
			m.addAttribute("message", "Cập nhật đơn hàng DH00" + order1 + " thành công ! :))");
			order1 = 0;
		}
		// m.addAttribute("orders",orderDAO.getAllOrder1(false,false));
		// m.addAttribute("orders2",orderDAO.getAllOrder1(false,true));

		return urlPage + "order_manager";
	}

	@RequestMapping("/order-manager.html/update/{id}")
	public String orderUpdate(Model m, @PathVariable("id") Long id) {

		Order order = orderDAO.findById(id).get();
		order.setStatus(true);
		orderDAO.save(order);
		order1 = id.intValue();

		return "redirect:/DTNsShop/admin/order-manager.html";
	}

	@RequestMapping("/order-details/{id}")
	public String orderDetailss(Model m, @PathVariable("id") Long id) {

		Optional<Order> order = orderDAO.findById(id);
		if (!order.isEmpty()) {
			List<OrderDetails> orderDetails = orderDetailDAO.getAllOrder(id);

			m.addAttribute("users", order.get().getAccount());
			m.addAttribute("orders", order.get());
			m.addAttribute("orderd", orderDetails);
			m.addAttribute("ammount", orderDetailDAO.getAmount(id));

			return urlPage + "order_details";
		} else {
			return "redirect:/DTNsShop/admin/order-manager.html";
		}

	}

	// Order Manager (delivered)Page =))))
	@RequestMapping({ "/order-delivered.html", "/order-delivered.html/sort" })
	public String orderDeliveredPage(Model m, @RequestParam("field") Optional<String> field,
			@RequestParam("sort") Optional<Integer> criteria, @RequestParam("p") Optional<Integer> p,
			@RequestParam("keywords") Optional<String> kw) {

		String kwords = kw.orElse(session.get("keywords_order2", ""));
		session.set("keywords_order2", kwords);

		int s = criteria.orElse(0);
		int paging = p.orElse(0);
		Sort sort;
		Pageable pageable;
		if (s == 0) {
			sort = Sort.by(Direction.ASC, field.orElse("id"));
			s = 1;
		} else {
			sort = Sort.by(Direction.DESC, field.orElse("id"));
			s = 0;
		}

		m.addAttribute("field2", field.orElse("id"));
		m.addAttribute("sort", s);
		m.addAttribute("number", paging);

		pageable = PageRequest.of(paging, 5, sort);

		Page<Order> list = orderDAO.getAllOrder1(true, false, "%" + kwords + "%", pageable);
		m.addAttribute("orders", list);

		return urlPage + "order_delivered";
	}

	// Order Manager Cancel Order :)))
	@RequestMapping({ "/order-cancel.html", "/order-cancel.html/sort" })
	public String orderCancelManagerPage(Model m, @RequestParam("field") Optional<String> field,
			@RequestParam("sort") Optional<Integer> criteria, @RequestParam("p") Optional<Integer> p,
			@RequestParam("keywords") Optional<String> kw) {
		String kwords = kw.orElse(session.get("keywords_order3", ""));
		session.set("keywords_order3", kwords);

		int s = criteria.orElse(0);
		int paging = p.orElse(0);
		Sort sort;
		Pageable pageable;
		if (s == 0) {
			sort = Sort.by(Direction.ASC, field.orElse("id"));
			s = 1;
		} else {
			sort = Sort.by(Direction.DESC, field.orElse("id"));
			s = 0;
		}

		m.addAttribute("field2", field.orElse("id"));
		m.addAttribute("sort", s);
		m.addAttribute("number", paging);

		pageable = PageRequest.of(paging, 5, sort);

		Page<Order> list = orderDAO.getAllOrder1(false, true, "%" + kwords + "%", pageable);
		m.addAttribute("orders", list);

		return urlPage + "cancel_order";
	}
	/* Order */

	/* Report */
	// Report Manager Page |0| v |0|
	@RequestMapping({"/report-manager.html","/report-manager.html/sort"})
	public String reportManagerPage(Model m, @RequestParam("field") Optional<String> field,
			@RequestParam("sort") Optional<Integer> criteria, @RequestParam("p") Optional<Integer> p,
			@RequestParam("keywords") Optional<String> kw) {
		String kwords = kw.orElse(session.get("keywords_fav", ""));
		session.set("keywords_fav", kwords);

		int s = criteria.orElse(0);
		int paging = p.orElse(0);
		Sort sort;
		Pageable pageable;
		if (s == 0) {
			sort = Sort.by(Direction.ASC, field.orElse("product.name"));
			s = 1;
		} else {
			sort = Sort.by(Direction.DESC, field.orElse("product.name"));
			s = 0;
		}

		m.addAttribute("field2", field.orElse("product.name"));
		m.addAttribute("sort", s);
		m.addAttribute("number", paging);

		pageable = PageRequest.of(paging, 5, sort);

		Page<Report> list = favDAO.getListReport("%" + kwords + "%",pageable);
		m.addAttribute("items", list);
		
		return urlPage + "report_manager";
	}

	// >>Report Order Manager Page |0| v |0|
	@RequestMapping({"/report-order.html","/report-order.html/sort"})
	public String reportCartPage(Model m, @RequestParam("field") Optional<String> field,
			@RequestParam("sort") Optional<Integer> criteria, @RequestParam("p") Optional<Integer> p,
			@RequestParam("keywords") Optional<String> kw) {
		String kwords = kw.orElse(session.get("keywords_report", ""));
		session.set("keywords_report", kwords);

		int s = criteria.orElse(0);
		int paging = p.orElse(0);
		Sort sort;
		Pageable pageable;
		if (s == 0) {
			sort = Sort.by(Direction.ASC, field.orElse("account.fullname"));
			s = 1;
		} else {
			sort = Sort.by(Direction.DESC, field.orElse("account.fullname"));
			s = 0;
		}

		m.addAttribute("field2", field.orElse("account.fullname"));
		m.addAttribute("sort", s);
		m.addAttribute("number", paging);

		pageable = PageRequest.of(paging, 5, sort);

		Page<Report2> list = orderDAO.getListReport("%" + kwords + "%",pageable);
		m.addAttribute("items", list);
		m.addAttribute("amount",orderDetailDAO.getTotal());
		
		return urlPage + "report_order";
	}
	/* Report */

	/* Profile */
	// Profile Manager Page :]]
	@RequestMapping("/profile-manager.html")
	public String profileManagerPage() {

		return urlPage + "profile_manager";
	}
	/* Profile */
}
