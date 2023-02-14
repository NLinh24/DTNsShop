package DTNsShop.poly.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import DTNsShop.poly.entity.Favorite;
import DTNsShop.poly.entity.Report;

public interface FavoriteDAO extends JpaRepository<Favorite, Long> {

	@Query("SELECT o FROM Favorite o WHERE o.userid.username = ?1")
	List<Favorite> getAllFav(String username);
	
	@Query("SELECT o FROM Favorite o WHERE o.userid.username = ?1 and o.product.id = ?2")
	Favorite getAllFav2(String username,Long id);
	
	@Query("SELECT count(o) FROM Favorite o WHERE o.userid.username = ?1")
	Integer getCountFav(String username);
	
	@Query("SELECT count(o) FROM Favorite o WHERE o.product.id = ?1")
	Integer getCountFavLike(Long id);
	
	@Query(value="SELECT new Report(o.product,o.product.name,count(o) as countReport) FROM Favorite o "+"WHERE o.product.name LIKE ?1"
			+ " GROUP BY o.product,o.product.name")
	Page<Report> getListReport(String keyword,Pageable pageable);
	
	
}
