package DTNsShop.poly.service;

import java.util.Collection;

import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import DTNsShop.poly.model.*;

@SessionScope
@Service
public interface ShoppingCartService {

	int getCount();

	double getAmount();

	void clear();

	Collection<CartItem> getCartsItem();

	void remove(Long itemId);

	void update(Long itemId, int quanlity);

	void add(CartItem item);
	

}
