package DTNsShop.poly.controller;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import DTNsShop.poly.dao.CategoryDAO;
import DTNsShop.poly.dao.FavoriteDAO;
import DTNsShop.poly.dao.OrderDAO;
import DTNsShop.poly.dao.ProductDAO;
import DTNsShop.poly.entity.Account;
import DTNsShop.poly.entity.Categories;
import DTNsShop.poly.entity.Favorite;
import DTNsShop.poly.entity.Product;
import DTNsShop.poly.service.SessionService;

@Controller
@RequestMapping("DTNsShop")
public class HomeController {
	@Autowired
	SessionService session;
	@Autowired
	HttpServletRequest req;

	@Autowired
	ProductDAO productDAO;
	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	OrderDAO orderDAO;
	@Autowired
	FavoriteDAO favDAO;

	String uri;
	String urlPage = "user/";

	public void setUri() {
		uri = req.getRequestURI();
		session.set("urisu", uri);
	}

	// Home page
	@RequestMapping("/index.html")
	public String homePage(Model m, @RequestParam("field") Optional<String> field
			) {
		setUri();
		
		String sort;
		if (field.isEmpty()) {
			sort = categoryDAO.findAll().get(0).getId();
		} else {
			sort = field.get();
		}
		Pageable pageable = PageRequest.of(0, 12);

		m.addAttribute("top12", productDAO.findAllTop12Product(pageable));

		Page<Product> list = productDAO.findAllBycategory(sort, PageRequest.of(0, 12));

		m.addAttribute("product1", list);
		// Chờ ngày Update :)
		m.addAttribute("product2", productDAO.findAll(PageRequest.of(0, 3)));
		m.addAttribute("product3", productDAO.findAll(PageRequest.of(1, 3)));
		m.addAttribute("product4", productDAO.findAll(PageRequest.of(2, 3)));

		m.addAttribute("field2", sort);

		return "home/" + "index";
	}

	// Product page
	@RequestMapping({ "/products.html", "/products.html/sort" })
	public String productsPage(Model m, @RequestParam("field") Optional<String> field,
			@RequestParam("show") Optional<Integer> show, @RequestParam("sort") Optional<Integer> criteria,
			@RequestParam("p") Optional<Integer> p, @RequestParam("catego") Optional<String> catego,
			@RequestParam("keywords") Optional<String> kw) {
		setUri();
		String kwords = kw.orElse(session.get("keywords", ""));
		session.set("keywords", kwords);

		int s = criteria.orElse(0);
		int paging = p.orElse(0);
		int shows = show.orElse(9);

		Sort sort;
		String tim;
		Pageable pageable;

		if (s == 0) {
			sort = Sort.by(Direction.ASC, field.orElse("id"));
		} else {
			sort = Sort.by(Direction.DESC, field.orElse("id"));
		}

		m.addAttribute("sort", s);
		m.addAttribute("field2", field.orElse("id"));
		m.addAttribute("show", shows);

		m.addAttribute("number", paging);

		pageable = PageRequest.of(paging, shows, sort);
		Page<Product> list;
		if (!catego.isEmpty()) {
			tim = catego.get();
			m.addAttribute("catego", tim);
			list = productDAO.findAllBycategory(tim, pageable);
		} else {
			list = productDAO.findAllBynameLike("%"+kwords+"%", pageable);
		}
		if(list.isEmpty()) {
			m.addAttribute("check",true);
		}else {m.addAttribute("check",false);}
		
		m.addAttribute("product", list);

		return urlPage + "products";
	}

	// Contact page
	@RequestMapping("/contact.html")
	public String contactPage() {
		setUri();
		return urlPage + "contact";
	}

	// About page
	@RequestMapping("/about.html")
	public String aboutPage() {
		setUri();
		return urlPage + "about";
	}

	@ModelAttribute("ordersCount")
	public Integer getOderCount() {
		Account ac = (Account) session.get("user", null);

		if (ac != null) {
			return orderDAO.getCountOrder1(ac.getUsername());
		} else {
			return null;
		}
	}

	@ModelAttribute("favCount")
	public Integer getFavcount() {
		Account ac = (Account) session.get("user", null);

		if (ac != null) {
			return favDAO.getCountFav(ac.getUsername());
		} else {
			return null;
		}
	}
}
