package DTNsShop.poly.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import DTNsShop.poly.entity.Colors;

public interface ColorsDAO extends JpaRepository<Colors, Integer> {

	Page<Colors> findAllBynameLike(String keywords, Pageable pageable);
	
}
