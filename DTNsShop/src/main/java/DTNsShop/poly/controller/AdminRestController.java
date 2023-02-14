package DTNsShop.poly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import DTNsShop.poly.dao.AccountDAO;
import DTNsShop.poly.entity.Account;
@RestController
@Controller
@RequestMapping("DTNsShop/admin")
public class AdminRestController {
	@Autowired
	AccountDAO accountDAO;
	
	@RequestMapping(value="/account-list.html/find/{id}",method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Account> find(@PathVariable("id") String id){
		try {
			return new ResponseEntity<Account>(accountDAO.findById(id).get(),HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Account>(HttpStatus.BAD_REQUEST);
		}
	}

}
