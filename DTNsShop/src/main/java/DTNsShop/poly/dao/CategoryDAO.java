package DTNsShop.poly.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import DTNsShop.poly.entity.Categories;
import DTNsShop.poly.entity.Product;

public interface CategoryDAO extends JpaRepository<Categories,String> {
	
	Page<Categories> findAllBynameLike(String keywords, Pageable pageable);
	
	@Query("SELECT DISTINCT o.category FROM Product o")
	List<Categories> findeAllCategoryInProduct();
	
	@Query("SELECT o FROM Product o WHERE o.category.name LIKE ?1")
	Page<Product> getAllCategoProduct(String keywords,Pageable pageable);
	
	@Query("SELECT count(o) FROM Categories o")
	Integer getCount();
}
