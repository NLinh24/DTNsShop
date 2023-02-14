package DTNsShop.poly.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Item{
	private Long id;
	private Long idProduct;
	private String name;
	private double price;
	private int qty = 1;
	private String img;
	
	public Item(Long id,Long idProduct, String name, double price, int qty, String img) {
		super();
		this.id = id;
		this.idProduct=idProduct;
		this.name = name;
		this.price = price;
		this.qty = qty;
		this.img = img;
	}
	
	
}
