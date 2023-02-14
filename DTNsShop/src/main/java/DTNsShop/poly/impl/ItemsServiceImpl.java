package DTNsShop.poly.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import DTNsShop.poly.dao.ProductDAO;
import DTNsShop.poly.entity.Product;
import DTNsShop.poly.model.*;
import DTNsShop.poly.service.ItemsService;

@SessionScope
@Service
public class ItemsServiceImpl implements ItemsService {

	private static List<Item> list = new ArrayList<>();
	@Autowired
	ProductDAO dao;

	@Override
	public void setItems(List<Item> list) {
		this.list = list;
	}

	@Override
	public void add(Item item) {
		list.add(item);
	}

	@Override
	public void remove(Long id) {
		list.removeIf(item -> item.getId() == id);
	}

	@Override
	public List<Item> getItems() {
		List<Product> list1 = dao.findAll();
		Item item = new Item();
		for (int i = 0; i < list1.size(); i++) {
			list.add(new Item(Long.valueOf(i),list1.get(i).getId(), list1.get(i).getName(), list1.get(i).getPrice(),0,
					list1.get(i).getImages()));
		}

		return list;
	}

	@Override
	public void update(Item item) {
		for (int i = 0; i < list.size(); i++) {
			Item items = list.get(i);
			if (items.getId() == item.getId()) {
				list.set(i, items);
				break;
			}
		}
	}

	@Override
	public Item findById(Long itemId) {
		List<Item> list2 = getItems();
		for(int i=0;i < list2.size();i++) {
			if(list2.get(i).getIdProduct().equals(itemId)) {
				itemId=list2.get(i).getId();
				break;
			}
		}
		return list.get(itemId.intValue());
	}

	@Override
	public void setItems() {
		// TODO Auto-generated method stub

	}

}
