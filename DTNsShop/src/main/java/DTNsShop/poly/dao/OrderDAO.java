package DTNsShop.poly.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import DTNsShop.poly.entity.Order;
import DTNsShop.poly.entity.Report2;

public interface OrderDAO extends JpaRepository<Order,Long> {

	@Query("SELECT o FROM Order o WHERE o.status = ?1 and o.cancelorder = ?2 and o.account.fullname LIKE ?3")
	Page<Order> getAllOrder1(Boolean status,Boolean cancel,String keyword,Pageable pageable);
	
	@Query("SELECT count(o) FROM Order o WHERE o.cancelorder = false")
	Integer getCount();
	
	@Query("SELECT o FROM Order o WHERE o.account.username = ?1 and o.cancelorder = false")
	List<Order> getAllOrderUser(String id);
	
	@Query("SELECT count(o) FROM Order o WHERE o.account.username = ?1 and o.cancelorder = false and o.status=false")
	Integer getCountOrder1(String id);
	
	
	@Query("SELECT o FROM Order o WHERE o.account.username = ?1 and o.id = ?2 and o.cancelorder = false")
	Order getOrders(String username,Long id);
	
	@Query(value="SELECT new Report2(o.account,o.account.fullname,count(o) as countOrder) "
			+ "FROM Order o WHERE o.account.fullname LIKE ?1"
			+ " GROUP BY o.account,o.account.fullname")
	Page<Report2> getListReport(String keyword,Pageable pageable);
}
