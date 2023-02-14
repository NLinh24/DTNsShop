package DTNsShop.poly.controller;

import java.util.Optional;
import java.util.Random;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import DTNsShop.poly.dao.AccountDAO;
import DTNsShop.poly.entity.Account;
import DTNsShop.poly.service.MailerService;
import DTNsShop.poly.service.SessionService;
import ch.qos.logback.core.joran.util.beans.BeanUtil;

@Controller
@RequestMapping("DTNsShop")
public class AccountController {
	@Autowired
	AccountDAO dao;
	@Autowired
	SessionService session;
	@Autowired
	MailerService mailer;

	String urlPage = "account/";
	String code;
	String confirmType;

	// Login page :)))
	@RequestMapping("/login")
	public String loginPage(Model m) {
		session.remove("user_temp");
		return urlPage + "login";
	}

	@PostMapping("/login")
	public String login(Model m, @RequestParam("username") String username, @RequestParam("password") String pass) {
		Account user = dao.getById(username);
		int loi = 0;
		session.set("user_temp", username);
		// Check Login :)
		if (username.isEmpty()) {
			m.addAttribute("messageU", "*Vui lòng nhập tài khoản!");
			loi++;
		} else {
			m.addAttribute("messageU", null);
		}
		if (pass.isEmpty()) {
			m.addAttribute("messageP", "*Vui lòng nhập mật khẩu!");
			loi++;
		} else {
			m.addAttribute("messageP", null);
		}
		if (loi == 0) {
			if (user != null && user.getActive() == true) {
				if (user.getPassword().equals(pass)) {
					m.addAttribute("message", "*Đăng nhập thành công!");
					session.set("user", user);
					session.remove("user_temp");
					String uri = session.get("urisu", "/DTNsShop/index.html");
					if (uri != null) {
						System.out.println(uri);
						return "redirect:" + uri;
					} else {
						return "redirect:/DTNsShop/index.html";
					}
				} else {
					m.addAttribute("messageP", "*Sai mật khẩu! :))");
				}
			} else if(user.getActive() == false) {
				m.addAttribute("messageU", "*Không thể đăng nhập bằng tài khoản này!");
			}else {
				m.addAttribute("messageU", "*Tài khoản này không tồn tại!");
			}
		}
		return urlPage + "login";
	}

	@RequestMapping("/logout")
	public String logout() {
		session.remove("user");
		return "redirect:/DTNsShop/index.html";
	}

	// Register page
	@RequestMapping("/register")
	public String registerPage() {
		session.remove("user_temp2");
		return urlPage + "register";
	}

	@PostMapping("/register")
	public String register(Model m, Account ac, @RequestParam("username") String username,
			@RequestParam("fullname") String fullname, @RequestParam("phonenumber") String phonenumber,
			@RequestParam("email") String email, @RequestParam("password") String pass,
			@RequestParam("confirmPassword") String confirmPass) {
		int loi = 0;
		ac = new Account(username, pass, fullname, email, phonenumber, false, false,"default.jpg");
		user = ac.getUsername();

		session.set("user_temp2", ac);
		if (username.isEmpty()) {
			m.addAttribute("messageU", "*Username không được bỏ trống!");
			loi++;
		} else {
			if (!dao.findById(username).isEmpty()) {
				m.addAttribute("messageU", "*Username đã tồn tại!");
				loi++;
			} else {
				m.addAttribute("messageU", null);
			}
		}
		if (fullname.isEmpty()) {
			m.addAttribute("messageF", "*Họ tên không được bỏ trống!");
			loi++;
		} else {
			m.addAttribute("messageF", null);
		}
		String dinhDangSdt = "^(0|\\+84)(\\s|\\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\\d)(\\s|\\.)?(\\d{3})(\\s|\\.)?(\\d{3})$";
		if (phonenumber.isEmpty()) {
			m.addAttribute("messagePN", "*Số điện thoại không được bỏ trống!");
			loi++;
		} else {
			if (!phonenumber.matches(dinhDangSdt)) {
				m.addAttribute("messagePN", "*Định dạng sdt không hợp lệ!");
				loi++;
			} else {
				m.addAttribute("messagePN", null);
			}
		}
		String dinhdangGmail = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@gmail+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
		String dinhdangFpt = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" + "fpt+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

		if (email.isEmpty()) {
			m.addAttribute("messageE", "*Email không được bỏ trống!");
			loi++;
		} else {
			if (!email.matches(dinhdangGmail) && !email.matches(dinhdangFpt)) {
				m.addAttribute("messageE", "*Định dạng email không hợp lệ!");
				loi++;
			} else {
				m.addAttribute("messageE", null);
				emailO = email;
			}
		}
		if (pass.isEmpty()) {
			m.addAttribute("messageP", "*Vui lòng nhập mật khẩu!");
			loi++;
		} else {
			if (pass.length() < 3) {
				m.addAttribute("messageP", "*Mật khẩu mới phải có ít nhất 3 ký tự!");
				loi++;
			} else {
				m.addAttribute("messageP", null);
			}
		}
		if (confirmPass.isEmpty()) {
			m.addAttribute("messageCP", "*Vui lòng nhập lại mật khẩu!");
			loi++;
		} else {
			if (!confirmPass.equals(pass)) {
				m.addAttribute("messageCP", "*Mật khẩu nhập lại không trùng khớp!");
				loi++;
			} else {
				m.addAttribute("messageCP", null);
			}
		}

		if (loi == 0) {

			dao.save(ac);

			m.addAttribute("message", "Đăng ký tài khoản thành công!Vui lòng kiểm tra email của bạn để xác nhận "
					+ "và kích hoạt tài khoản!");

			session.remove("user_temp2");

			code = randomMa(6);
			mailer.queue(email, "<DTNsShop> Xác nhận tài khoản của bạn",
					getHTMLT(code, "Mã xác nhận tài khoản của bạn", "confirmMessage"));

			confirmType = "register";
		}

		return urlPage + "register";
	}

	// Register page

	// ForgotPass page
	@RequestMapping("/forgotPass")
	public String forgotPassPage() {
		return urlPage + "forgotPass";
	}

	String user, emailO;

	@PostMapping("/forgotPass")
	public String sendPass(Model m, @RequestParam("username") String username, @RequestParam("email") String email)
			throws MessagingException {
		int loi = 0;
		session.set("user_temp", username);
		session.set("email_temp", email);
		if (username.isEmpty()) {
			m.addAttribute("messageU", "*Vui lòng nhập tài khoản của bạn!");
			loi++;
		} else {
			Optional<Account> findid = dao.findById(username);
			user = username;
			if (findid.isEmpty()) {
				m.addAttribute("messageU", "*Tài khoản này không tồn tại!");
				loi++;
			} else {
				m.addAttribute("messageU", null);
			}
		}

		String dinhdangGmail = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@gmail+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
		String dinhdangFpt = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" + "fpt+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

		if (email.isEmpty()) {
			m.addAttribute("messageE", "*Email không được bỏ trống!");
			loi++;
		} else {
			if (!email.matches(dinhdangGmail) && !email.matches(dinhdangFpt)) {
				m.addAttribute("messageE", "*Định dạng email không hợp lệ!");
				loi++;
			} else {
				m.addAttribute("messageE", null);
				emailO = email;
			}
		}

		if (loi == 0) {

			session.remove("user_temp");
			session.remove("email_temp");
			code = randomMa(6);

			mailer.queue(email, "<DTNsShop> Xác nhận tài khoản của bạn",
					getHTMLT(code, "Mã xác nhận tài khoản của bạn", "confirmMessage"));
			confirmType = "forgot";

			m.addAttribute("message", "Đang gửi mã xác nhận đến email của bạn!");
		}

		return urlPage + "forgotPass";
	}

	// ChangePass page
	@RequestMapping("/changePass")
	public String changePassPage() {
		return urlPage + "changePass";
	}

	@PostMapping("/changePass")
	public String changePass(Model m, Account ac, @RequestParam("oldPass") String oldPass,
			@RequestParam("password") String pass, @RequestParam("confirmPass") String confirmPass) {
		ac = (Account) session.get("user", "");
		int loi = 0;
		if (oldPass.isEmpty()) {
			m.addAttribute("messageOP", "*Vui lòng nhập mật khẩu cũ!");
			loi++;
		} else {
			if (!ac.getPassword().equals(oldPass)) {
				m.addAttribute("messageOP", "*Vui lòng nhập đúng mật khẩu cũ!");
				loi++;
			} else {
				m.addAttribute("messageOP", null);
			}
		}
		if (pass.isEmpty()) {
			m.addAttribute("messageNP", "*Vui lòng nhập mật khẩu mới!");
			loi++;
		} else {
			if (pass.length() < 3) {
				m.addAttribute("messageNP", "*Mật khẩu mới phải có ít nhất 3 ký tự!");
				loi++;
			} else {
				m.addAttribute("messageNP", null);
			}
		}
		if (confirmPass.isEmpty()) {
			m.addAttribute("messageCP", "*Vui lòng nhập lại mật khẩu!");
			loi++;
		} else {
			if (!confirmPass.equals(pass)) {
				m.addAttribute("messageCP", "*Mật khẩu nhập lại không trùng khớp!");
				loi++;
			} else {
				m.addAttribute("messageCP", null);
			}
		}
		if (loi == 0) {
			ac.setPassword(pass);
			dao.save(ac);
			m.addAttribute("message", "*Đổi mật khẩu thành công!!!");
		}

		return urlPage + "changePass";
	}

	// ConfirmMessage page
	@RequestMapping("/confirmMessage")
	public String confirmMessagePage() {
		return urlPage + "confirmMessage";
	}

	@PostMapping("/confirmMessage")
	public String confirmMessage(Model m, @RequestParam("code") String codeE) {
		int loi = 0;
		System.out.println(code);
		if (codeE.isEmpty()) {
			m.addAttribute("messageC", "*Không được bỏ trống!");
			loi++;
		} else {
			if (!codeE.equals(code)) {
				m.addAttribute("messageC", "*Mã xác nhận không đúng!");
				loi++;
			} else {
				m.addAttribute("messageC", null);
			}
		}
		if (loi == 0) {
			if (confirmType.equalsIgnoreCase("forgot")) {
				mailer.queue(emailO, "<DTNsShop>Mật khẩu tài khoản " + user,
						getHTMLT(dao.findById(user).get().getPassword(), "Lấy lại mật khẩu thành công :))", "login"));
			} else {
				Account ac = dao.findById(user).get();
				ac.setActive(true);
				dao.save(ac);

				mailer.queue(emailO, "<DTNsShop> Đã kích hoạt tài khoản " + user,
						getHTMLT("Test", "Kích hoạch tài khoản của bạn :))", "login"));
			}

			m.addAttribute("message", "Xác nhận tài khoản thành công!");
		}

		return urlPage + "confirmMessage";
	}

	// UpdateProfile page
	@RequestMapping("/updateProfile")
	public String updateProfile() {
		return urlPage + "updateProfile";
	}

	@PostMapping("/updateProfile")
	public String updateProfileUpdate(Model m, Account ac, @RequestParam("fullname") String fullname,
			@RequestParam("phonenumber") String phonenumber, @RequestParam("email") String email) {
		int loi = 0;

		if (fullname.isEmpty()) {
			m.addAttribute("messageF", "*Họ tên không được bỏ trống!");
			loi++;
		} else {
			m.addAttribute("messageF", null);
		}
		String dinhDangSdt = "^(0|\\+84)(\\s|\\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\\d)(\\s|\\.)?(\\d{3})(\\s|\\.)?(\\d{3})$";
		if (phonenumber.isEmpty()) {
			m.addAttribute("messageP", "*Số điện thoại không được bỏ trống!");
			loi++;
		} else {
			if (!phonenumber.matches(dinhDangSdt)) {
				m.addAttribute("messageP", "*Định dạng sdt không hợp lệ!");
				loi++;
			} else {
				m.addAttribute("messageP", null);
			}
		}
		String dinhdangGmail = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@gmail+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
		String dinhdangFpt = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" + "fpt+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

		if (email.isEmpty()) {
			m.addAttribute("messageE", "*Email không được bỏ trống!");
			loi++;
		} else {
			if (!email.matches(dinhdangGmail) && !email.matches(dinhdangFpt)) {
				m.addAttribute("messageE", "*Định dạng email không hợp lệ!");
				loi++;
			} else {
				m.addAttribute("messageE", null);
			}
		}
		if (loi == 0) {
			ac = session.get("user", "");
			ac.setFullname(fullname);
			ac.setPhonenumber(phonenumber);
			ac.setEmail(email);

			dao.save(ac);
			m.addAttribute("message", "Cập nhật thành công!");
		}

		return urlPage + "updateProfile";
	}

	// Extends Methods
	// Random code
	private static final String digits = "0123456789"; // 0-9
	private static final String ALPHA_NUMERIC = digits;
	private static Random generator = new Random();

	public String randomMa(int soKyTu) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < soKyTu; i++) {
			int number = randomNumber(0, ALPHA_NUMERIC.length() - 1);
			char ch = ALPHA_NUMERIC.charAt(number);
			sb.append(ch);
		}
		return sb.toString();
	}

	public static int randomNumber(int min, int max) {
		return generator.nextInt((max - min) + 1) + min;
	}

	public String getHTMLT(String code, String message, String url) {
		String html = "<!DOCTYPE html\r\n"
				+ "    PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n"
				+ "<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n" + "\r\n" + "<head>\r\n"
				+ "    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\r\n"
				+ "    <title>DTNsShop Enter Code</title>\r\n"
				+ "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\r\n" + "</head>\r\n"
				+ "\r\n" + "<body style=\"margin: 0; padding: 0;\">\r\n"
				+ "    <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"800\" style=\"border: 1px solid #cccccc;\">\r\n"
				+ "        <tr>\r\n" + "            <td align=\"center\"\r\n"
				+ "                style=\"padding: 10px 0 30px 0;background: url('https://lh3.googleusercontent.com/kwFhfKq_9afZ8_tGqSNozfp_DrYyzLikHy9xtC4kiiqylGWv7n_5UJA7yQ3W18xTmw=h500');background-size: cover;\">\r\n"
				+ "                <h3 style=\"color: #ffffff; font-family: Arial, sans-serif; font-size:50px;\">\r\n"
				+ "                    DTNsShop\r\n" + "                </h3>\r\n" + "            </td>\r\n"
				+ "        </tr>\r\n" + "        <tr>\r\n"
				+ "            <td bgcolor=\"#ffffff\" style=\"padding: 40px 30px 40px 30px;\">\r\n"
				+ "                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n"
				+ "                    <tr align=\"center\">\r\n"
				+ "                        <td style=\"color: #153643; font-family: Arial, sans-serif; font-size:18px;\">\r\n"
				+ "                            <b> " + message + "</b>\r\n" + "                        </td>\r\n"
				+ "                    </tr>\r\n" + "                    <tr>\r\n"
				+ "                        <td style=\"padding: 20px 0 30px 0;\">\r\n"
				+ "                        </td>\r\n" + "                    </tr>\r\n" + "                    <tr>\r\n"
				+ "                        <td>\r\n"
				+ "                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n"
				+ "                                <tr>\r\n"
				+ "                                    <td width=\"100%\" valign=\"top\">\r\n"
				+ "                                        <table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n"
				+ "                                            <tr align=\"center\">\r\n"
				+ "                                                <td\r\n"
				+ "                                                    style=\"color: #153643; font-family: Arial, sans-serif; font-size: 30px;\">\r\n"
				+ "                                                    <h1>" + code + "</h1>\r\n"
				+ "                                                </td>\r\n"
				+ "                                            </tr>\r\n"
				+ "                                        </table>\r\n"
				+ "                                    </td>\r\n" + "                                </tr>\r\n"
				+ "                            </table>\r\n" + "                        </td>\r\n"
				+ "                    </tr>\r\n" + "                    <tr align=\"center\">\r\n"
				+ "                        <td style=\"padding: 40px 0 30px 0;\">\r\n"
				+ "                            <a href=\"http://localhost:8080/DTNsShop/" + url
				+ "\" style=\"background-color: rgb(241, 75, 75);color:white;\r\n"
				+ "                                text-decoration: none;padding: 15px 50px 15px 50px;border-radius: 30px;\r\n"
				+ "                                box-shadow: rgba(0, 0, 0, 0.4) 0px 2px 4px, rgba(0, 0, 0, 0.3) 0px 7px 13px -3px, rgba(0, 0, 0, 0.2) 0px -3px 0px inset;                                \r\n"
				+ "                                \" class=\"dtn\">\r\n"
				+ "                                Click Me :)))\r\n" + "                            </a>\r\n"
				+ "                        </td>\r\n" + "                    </tr>\r\n" + "                </table>\r\n"
				+ "            </td>\r\n" + "        </tr>\r\n" + "        <tr>\r\n"
				+ "            <td bgcolor=\"crimson\" style=\"padding: 30px 30px 30px 30px;\">\r\n"
				+ "                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n"
				+ "                    <tr>\r\n"
				+ "                        <td style=\"color: #ffffff; font-family: Arial, sans-serif; font-size: 14px;\">\r\n"
				+ "                            &reg; DTNsShop, @LinhButoka 2022<br />\r\n"
				+ "                            <a href=\"http://localhost:8080/DTNsShop/register\" style=\"color: #ffffff;\">\r\n"
				+ "                                <font color=\"#ffffff\">Đăng ký</font>\r\n"
				+ "                            </a> để nhận nhiều ưu đãi hấp dẫn từ DTNsShop. :))\r\n"
				+ "                        </td>\r\n" + "                        <td align=\"right\">\r\n" + "\r\n"
				+ "                        </td>\r\n" + "                    </tr>\r\n" + "                </table>\r\n"
				+ "            </td>\r\n" + "        </tr>\r\n" + "    </table>\r\n" + "</body>\r\n" + "\r\n"
				+ "</html>";
		return html;
	}
}
