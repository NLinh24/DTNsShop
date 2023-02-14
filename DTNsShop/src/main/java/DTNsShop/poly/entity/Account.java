package DTNsShop.poly.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import DTNsShop.poly.entity.Order;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Accounts")
public class Account implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	private String username;
	
	@Column(name="[Password]")
	private String password;
	private String fullname;
	private String email;
	
	private String phonenumber;
	
	private Boolean active;
	private Boolean admins;
	private String photo;
	
	@JsonIgnore
	@OneToMany(mappedBy = "account")
	private List<Order> orders;
	
	@JsonIgnore
	@OneToMany(mappedBy = "userid")
	private List<Favorite> favorite;

	public Account(String username, String password, String fullname, String email, String phonenumber, Boolean active,
			Boolean admins, String photo) {
		super();
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.email = email;
		this.phonenumber = phonenumber;
		this.active = active;
		this.admins = admins;
		this.photo = photo;
	}

	public Account(String username, String fullname, String email, String phonenumber, Boolean active, Boolean admins,
			String photo) {
		super();
		this.username = username;
		this.fullname = fullname;
		this.email = email;
		this.phonenumber = phonenumber;
		this.active = active;
		this.admins = admins;
		this.photo = photo;
	}

	
}
