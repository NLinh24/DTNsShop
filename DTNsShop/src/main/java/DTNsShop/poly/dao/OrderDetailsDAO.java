package DTNsShop.poly.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import DTNsShop.poly.entity.OrderDetails;
import DTNsShop.poly.entity.Report2;

public interface OrderDetailsDAO extends JpaRepository<OrderDetails,Long> {

	@Query("SELECT o FROM OrderDetails o WHERE o.order.id = ?1")
	List<OrderDetails> getAllOrder(Long id);
	
	@Query("SELECT sum(o.quantity*o.price) FROM OrderDetails o WHERE o.order.id = ?1")
	Double getAmount(Long id);
	
	@Query("SELECT sum(o.quantity*o.price) FROM OrderDetails o WHERE o.order.status = 1")
	Double getTotal();
	
}
