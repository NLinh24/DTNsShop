package DTNsShop.poly.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import DTNsShop.poly.entity.Account;
import DTNsShop.poly.entity.Product;

public interface ProductDAO extends JpaRepository<Product, Long> {

	Page<Product> findAllBynameLike(String keywords, Pageable pageable);

	@Query("SELECT max(o.id) FROM Product o")
	Long findIdMax();

	@Query("SELECT o FROM Product o ORDER BY o.price DESC")
	Page<Product> findAllTop12Product(Pageable pageable);
	
	@Query("SELECT o FROM Product o WHERE o.category.id = ?1")
	Page<Product> findAllBycategory(String id, Pageable pageable);
	
	@Query("SELECT o FROM Product o WHERE o.category.id = ?1 and o.name != ?2")
	List<Product> getAllProductSame(String id,String name);
	
	@Query("SELECT count(o) FROM Product o")
	Integer getCount();
}
