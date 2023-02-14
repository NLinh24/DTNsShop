package DTNsShop.poly.controller;

import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import DTNsShop.poly.dao.FavoriteDAO;
import DTNsShop.poly.dao.OrderDAO;
import DTNsShop.poly.dao.OrderDetailsDAO;
import DTNsShop.poly.dao.ProductDAO;
import DTNsShop.poly.dao.ProductImageDAO;
import DTNsShop.poly.entity.Account;
import DTNsShop.poly.entity.Favorite;
import DTNsShop.poly.entity.Order;
import DTNsShop.poly.entity.OrderDetails;
import DTNsShop.poly.entity.Product;
import DTNsShop.poly.entity.ProductImages;
import DTNsShop.poly.model.CartItem;
import DTNsShop.poly.model.Item;
import DTNsShop.poly.service.ItemsService;
import DTNsShop.poly.service.SessionService;
import DTNsShop.poly.service.ShoppingCartService;

@Controller
@RequestMapping("DTNsShop")
public class ProductController {
	@Autowired
	ProductDAO productDAO;
	@Autowired
	OrderDAO orderDAO;
	@Autowired
	OrderDetailsDAO orderDetailDAO;
	@Autowired
	FavoriteDAO favDAO;
	@Autowired
	ProductImageDAO imageDAO;

	@Autowired
	ItemsService items;
	@Autowired
	ShoppingCartService cart;
	@Autowired
	SessionService session;

	@Autowired
	HttpServletRequest req;

	String uri;
	String urlPage = "user/";

	// Cart page
	@RequestMapping("/carts.html")
	public String cartsPage(Model model) {
		model.addAttribute("items", items.getItems());
		Collection<CartItem> citem = cart.getCartsItem();
		model.addAttribute("cartItems", citem);
		model.addAttribute("total", cart.getAmount());
		model.addAttribute("NoOfItems", cart.getCount());

		return urlPage + "carts";
	}

	@RequestMapping("/carts.html/views")
	public String cartsView(Model model) {
		Collection<CartItem> citem = cart.getCartsItem();
		model.addAttribute("cartItems", citem);
		model.addAttribute("total", cart.getAmount());
		model.addAttribute("NoOfItems", cart.getCount());

		return urlPage + "carts";
	}

	@RequestMapping("/carts.html/add/{id}")
	public String addCart(@PathVariable("id") Long id) {

		// System.out.println(id);
		Item item = items.findById(id);
		System.out.println(item.toString());

		if (item != null) {
			CartItem citem = new CartItem();
			BeanUtils.copyProperties(item, citem);
			citem.setIdItem(item.getId());
			citem.setQty(1);

			cart.add(citem);
		}

		// return "redirect:/carts.html";
		String url = session.get("urisu", null);
		if (url != null) {
			return "redirect:" + url;
		} else {
			return "redirect:/DTNsShop/products.html";
		}
	}

	@RequestMapping("/carts.html/remove/{id}")
	public String remove(@PathVariable("id") Long id) {
		cart.remove(id);

		String url = session.get("urisu", null);
		if (url != null) {
			return "redirect:" + url;
		} else {
			return "redirect:/DTNsShop/products.html";
		}
	}

	@PostMapping("/carts.html/update/{id}")
	public String update(@RequestParam("id") Long id, @RequestParam("qty") Integer qty) {
		cart.update(id, qty);
		return "redirect:/DTNsShop/carts.html/views";
	}

	@RequestMapping("/carts.html/clear")
	public String clear() {
		cart.clear();
		return "redirect:/DTNsShop/carts.html/views";
	}

	// Check Out page
	int check = 0;

	@RequestMapping("/checkout.html")
	public String checkoutPage(Model m) {
//		if (check != 0) {
//			m.addAttribute("message", "*Đặt hàng thành công!");
//			check = 0;
//		}
		return urlPage + "checkout";
	}

	@PostMapping("/checkout.html")
	public String productOrder(Model m, @RequestParam("address") String address) {
		Account ac = (Account) session.get("user", null);
		Collection<CartItem> citem = cart.getCartsItem();
		int loi = 0;
		if (address.isEmpty()) {
			m.addAttribute("message", "*Vui lòng nhập địa chỉ giao hàng của bạn!");
			loi++;
		}
		if (loi == 0) {
			Order order = new Order();
			order.setAccount(ac);
			order.setAddress(address);
			order.setCreatedate(new Date());
			order.setStatus(false);
			order.setCancelorder(false);

			orderDAO.save(order);

			for (CartItem item : citem) {
				OrderDetails orderds = new OrderDetails();
				orderds.setOrder(order);
				orderds.setProduct(productDAO.findById(item.getIdProduct()).get());
				orderds.setPrice(item.getPrice());
				orderds.setQuantity(Integer.valueOf(item.getQty()));

				orderDetailDAO.save(orderds);
			}
			cart.clear();
			// check++;
		} else {
			return urlPage + "checkout";
		}

		String url = session.get("urisu", null);
		if (url != null) {
			return "redirect:" + url;
		} else {
			return "redirect:/DTNsShop/products.html";
		}
	}

	// Product-Detail page
	@RequestMapping("/products-detail.html/{id}")
	public String productDetailPage(Model m, Product product, @PathVariable("id") Long id) {
		setUri();
		Account ac = session.get("user", null);
		product = productDAO.findById(id).get();
		List<Product> items = productDAO.getAllProductSame(product.getCategory().getId(), product.getName());
		List<ProductImages> subImg = imageDAO.getAllSubImage(id);
		
		m.addAttribute("products", product);
		m.addAttribute("items", items);
		m.addAttribute("like", favDAO.getCountFavLike(id));

		if (ac != null) {
			Favorite fav = favDAO.getAllFav2(ac.getUsername(), id);
			m.addAttribute("check", fav);
		} else {
			m.addAttribute("check", null);
		}
		
		if(!subImg.isEmpty()) {
			m.addAttribute("subImage",subImg);
		}else {
			m.addAttribute("subImage",null);
		}

		return urlPage + "product_detail";
	}

	// Product-Order page
	@RequestMapping("/products-order.html")
	public String productOrderPage(Model m) {
		setUri();
		Account ac = session.get("user", "");

		m.addAttribute("orders", orderDAO.getAllOrderUser(ac.getUsername()));

		return urlPage + "order_product";
	}

	@RequestMapping("/products-order.html/cancel/{id}")
	public String productOrderCancelPage(Model m, @PathVariable("id") Long id) {

		Order order = orderDAO.getById(id);
		order.setCancelorder(true);

		orderDAO.save(order);

		return "redirect:/DTNsShop/products-order.html";
	}
	// Product Order Details

	@RequestMapping("/order-details.html")
	public String orderDetails() {

		return urlPage + "order_details";
	}

	@RequestMapping("/products-order.html/order-details/{id}")
	public String orderDetailss(Model m, @PathVariable("id") Long id) {

		Account user = (Account) session.get("user", null);

		Order order = orderDAO.getOrders(user.getUsername(), id);
		List<OrderDetails> orderDetails = orderDetailDAO.getAllOrder(id);

		m.addAttribute("orders", order);
		m.addAttribute("orderd", orderDetails);
		m.addAttribute("ammount", orderDetailDAO.getAmount(id));
		if (order == null) {
			return "redirect:/DTNsShop/products-order.html";
		}

		return urlPage + "order_details";
	}

	// Product-Favorite page
	@RequestMapping("/product-favorite.html")
	public String productFavoritePage(Model m) {
		setUri();
		Account ac = (Account) session.get("user", null);

		List<Favorite> list = favDAO.getAllFav(ac.getUsername());
		m.addAttribute("items", list);

		return urlPage + "favorite_product";
	}

	@RequestMapping("/product-favorite.html/like/{id}")
	public String productFavLike(@PathVariable("id") Long id) {

		Account ac = (Account) session.get("user", null);
		Product pr = productDAO.getById(id);

		Favorite fav = new Favorite();
		fav.setUserid(ac);
		fav.setProduct(pr);
		favDAO.save(fav);

		String uri2 = session.get("urisu", null);
		if (uri2 != null) {
			return "redirect:" + uri2;
		}

		return "redirect:/DTNsShop/product-favorite.html";
	}

	@PostMapping("/product-favorite.html/unlike/{id}")
	public String productFavUnlike(@PathVariable("id") Long id) {
		
		Account ac = (Account) session.get("user", null);
		Favorite fav = favDAO.getAllFav2(ac.getUsername(), id);
		
		if (fav != null) {
			favDAO.delete(fav);
		}
		String uri2 = session.get("urisu", null);
		if (uri2 != null) {
			return "redirect:" + uri2;
		} else {
			return "redirect:/DTNsShop/product-favorite.html";
		}
	}

	// Product-Favorite page

	@ModelAttribute("ordersCount")
	public Integer getOderCount() {
		Account ac = (Account) session.get("user", null);

		if (ac != null) {
			return orderDAO.getCountOrder1(ac.getUsername());
		} else {
			return 0;
		}
	}

	@ModelAttribute("favCount")
	public Integer getFavcount() {
		Account ac = (Account) session.get("user", null);

		if (ac != null) {
			return favDAO.getCountFav(ac.getUsername());
		} else {
			return 0;
		}
	}

	public void setUri() {
		uri = req.getRequestURI();
		session.set("urisu", uri);
	}
}
