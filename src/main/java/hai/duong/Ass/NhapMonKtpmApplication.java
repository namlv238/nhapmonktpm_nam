package hai.duong.Ass;

import java.util.concurrent.TimeUnit;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.CacheControl;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@SpringBootApplication
public class NhapMonKtpmApplication implements WebMvcConfigurer{

	public static void main(String[] args) {
		SpringApplication.run(NhapMonKtpmApplication.class, args);
	}
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// TODO Auto-generated method stub
		//WebMvcConfigurer.super.addResourceHandlers(registry);
		registry.addResourceHandler("/static/**").addResourceLocations("/WEB-INF/static/")
		.setCacheControl(CacheControl.maxAge(2,TimeUnit.HOURS).cachePublic());
		
		
	}

}
