package DTNsShop.poly.interceptor;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import DTNsShop.poly.entity.Account;
import DTNsShop.poly.model.CartItem;
import DTNsShop.poly.service.ItemsService;
import DTNsShop.poly.service.SessionService;
import DTNsShop.poly.service.ShoppingCartService;

@Service
public class AuthInterceptor implements HandlerInterceptor {

	@Autowired
	SessionService session;
	@Autowired
	ShoppingCartService cart;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String uri = request.getRequestURI();
		Account user = session.get("user",null);
		//System.out.println(uri);
		String error = "";
		if (user == null) {
			error = "Please login!";
		} else if (!user.getAdmins() && uri.contains("admin")) {
			error = "Access denied!";
		}
		Collection<CartItem> citem = cart.getCartsItem();
		if(citem.isEmpty() && uri.contains("checkout")) {
			error = "Vui long them san pham vao gio hang!";
			response.sendRedirect("/DTNsShop/products.html?error=" + error);
			return false;
		}
		if (error.length() > 0) {
			session.set("security-uri", uri);
			response.sendRedirect("/DTNsShop/login?error=" + error);
			return false;
		}
		return true;
	}

}
