package DTNsShop.poly.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartItem {
	private Long idItem;
	private Long idProduct;
	private String name;
	private double price;
	private int qty = 1;
	private String img;
}
