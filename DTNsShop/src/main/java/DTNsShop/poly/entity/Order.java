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

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="Orders")
public class Order implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@ManyToOne @JoinColumn(name = "Username")
	private Account account;
	
	@OneToMany(mappedBy = "order") 
	private List<OrderDetails> orderdetail;
	
	@Temporal(TemporalType.DATE)
	private Date createdate = new Date();
	
	@Column(name = "[address]")
	private String address;
	
	@Column(name="[status]")
	private Boolean status;

	private Boolean cancelorder;

}
