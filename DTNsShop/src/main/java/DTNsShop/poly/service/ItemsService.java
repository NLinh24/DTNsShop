package DTNsShop.poly.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import DTNsShop.poly.model.*;

@SessionScope
@Service
public interface ItemsService {
	List<Item> getItems();
	void setItems();
	void add(Item item);
	void remove(Long id);
	void update(Item item);
	Item findById(Long itemId);
	void setItems(List<Item> list);

}
