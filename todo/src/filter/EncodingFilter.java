package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/*")
public class EncodingFilter implements Filter {
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 요청전 필터 서블릿보다 필터가 먼저
		request.setCharacterEncoding("utf-8");
		System.out.println("인코딩 필터 실행");
		
		chain.doFilter(request, response); // 사용자가 요청한 컨트롤러 메서드
		
		// 요청후 필터
	}
}