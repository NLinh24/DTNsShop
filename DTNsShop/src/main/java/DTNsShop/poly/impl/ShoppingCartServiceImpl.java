package DTNsShop.poly.impl;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import DTNsShop.poly.model.*;
import DTNsShop.poly.service.ShoppingCartService;
@SessionScope
@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {
	
	private Map<Long,CartItem> map = new HashMap<>();
	
	@Override
	public void add(CartItem item) {
		CartItem cart = map.get(item.getIdItem());
		if(cart != null) {
			cart.setQty(item.getQty()+cart.getQty());
		}else {
			map.put(item.getIdItem(),item);
		}
	}
	@Override
	public void update(Long itemId,int quanlity) {
		CartItem item = map.get(itemId);
		item.setQty(quanlity);
		
		if(item.getQty() <= 0) {
			map.remove(itemId);
		}
	}
	@Override
	public void remove(Long itemId) {
		map.remove(itemId);
	}
	@Override
	public Collection<CartItem> getCartsItem(){
		return map.values();
	}
	@Override
	public void clear() {
		map.clear();
	}

	@Override
	public double getAmount() {
		return map.values().stream().mapToDouble(item->item.getQty()*item.getPrice()).sum();
	}
	
	@Override
	public int getCount() {
		if(map.isEmpty()) {
			return 0;
		}
		return map.values().size();
	}
	
	
}
