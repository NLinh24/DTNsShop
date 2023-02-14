package DTNsShop.poly.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class InterConfig implements WebMvcConfigurer {

	@Autowired
	GlobalInterceptor global;
	@Autowired
	AuthInterceptor auth;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(global).addPathPatterns("/**").excludePathPatterns("/assets/**");
		
		registry.addInterceptor(auth).addPathPatterns("/admin/**","/DTNsShop/admin/**",
				"/DTNsShop/changePass","/DTNsShop/updateProfile","/DTNsShop/products-order.html","/DTNsShop/product-favorite.html/**",
				"/DTNsShop/carts.html/**","/DTNsShop/checkout.html"
				)
				.excludePathPatterns("/assets/**");
	}
	

}
