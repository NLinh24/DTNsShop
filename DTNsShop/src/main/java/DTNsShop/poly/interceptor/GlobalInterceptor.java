package DTNsShop.poly.interceptor;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import DTNsShop.poly.dao.CategoryDAO;
import DTNsShop.poly.model.CartItem;
import DTNsShop.poly.service.ShoppingCartService;

@Service
public class GlobalInterceptor implements HandlerInterceptor {

	@Autowired
	CategoryDAO dao;
	@Autowired
	ShoppingCartService cart;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		request.setAttribute("uri", request.getRequestURI());
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse res, Object handler, ModelAndView mv)
			throws Exception {
		req.setAttribute("categories", dao.findeAllCategoryInProduct());
		
		Collection<CartItem> citem = cart.getCartsItem();
		req.setAttribute("cartItems", citem);
		req.setAttribute("total", cart.getAmount());
		req.setAttribute("NoOfItems", cart.getCount());
	}

}
