package DTNsShop.poly.dao;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import DTNsShop.poly.entity.Account;

public interface AccountDAO extends JpaRepository<Account, String> {
	
	@Query("SELECT o FROM Account o WHERE o.fullname LIKE ?1")
	Page<Account> findByKeywords(String keywords, Pageable pageable);
	
	Page<Account> findAllByfullnameLike(String keywords, Pageable pageable);
	
	@Query("SELECT count(o) FROM Account o")
	Integer getCount();
}
