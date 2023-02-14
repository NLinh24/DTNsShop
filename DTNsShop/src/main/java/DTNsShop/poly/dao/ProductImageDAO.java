package DTNsShop.poly.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import DTNsShop.poly.entity.ProductImages;

public interface ProductImageDAO extends JpaRepository<ProductImages, Long> {

	@Query("SELECT o FROM ProductImages o WHERE o.product.name LIKE ?1")
	Page<ProductImages> getAllImages(String keyword,Pageable pageable);
	
	
	@Query("SELECT o FROM ProductImages o WHERE o.colors.id = ?1 and o.product.id = ?2")
	ProductImages findByColorAndProduct(Integer idColor,Long idProduct);
	
	@Query("SELECT max(o.id) FROM ProductImages o")
	Long findIdMax();
	
	@Query("SELECT o FROM ProductImages o WHERE o.product.id = ?1")
	List<ProductImages> getAllSubImage(Long id);
}
