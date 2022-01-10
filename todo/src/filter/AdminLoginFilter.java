package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/admin/*")
public class AdminLoginFilter implements Filter {
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 실행전
		// 이미 로그인 되어있다면 요청 처리 불가
		System.out.println("AdminLoginFilter 실행");
		HttpSession session = ((HttpServletRequest)request).getSession();
		if(session.getAttribute("loginAdmin") == null) {
			System.out.println("강제이동");
			((HttpServletResponse)response).sendRedirect(((HttpServletRequest)request).getContextPath()+"/notLogin/adminLogin");
			return;
		}

		chain.doFilter(request, response);
	
		//실행후
	}

}
