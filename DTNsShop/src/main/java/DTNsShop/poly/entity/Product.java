package DTNsShop.poly.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Products")
public class Product implements Serializable {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Column(name="[name]")
	private String name;
	private String images;
	
	private Double price;
	
	@Temporal(TemporalType.DATE)
	private Date createdate = new Date();
	
	private Boolean available;
	
	@ManyToOne @JoinColumn(name = "categoryid")
	private Categories category;
	
	@JsonIgnore
	@OneToMany(mappedBy = "product")
	private List<ProductImages> productimage;
	
	@JsonIgnore
	@OneToMany(mappedBy = "product")
	private List<OrderDetails> orderDetail;
	
	@JsonIgnore
	@OneToMany(mappedBy = "product")
	private List<Favorite> favorite;
	
	private String amount;
	private String review;
	public Product(String name, String images, Double price, Date createdate, Boolean available, String amount, String review) {
		super();
		this.name = name;
		this.images = images;
		this.price = price;
		this.createdate = createdate;
		this.available = available;
		this.amount = amount;
		this.review = review;
	}
	

	
}
