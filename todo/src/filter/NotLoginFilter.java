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

@WebFilter("/notLogin/*")
public class NotLoginFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 실행전
		// 이미 로그인 되어있다면 요청 처리 불가
		System.out.println("NotLoginFilter 실행");
		HttpSession session = ((HttpServletRequest) request).getSession();
		if(session.getAttribute("loginMember") != null) {
			((HttpServletResponse) response).sendRedirect(((HttpServletRequest) request).getContextPath()+"/member/calendar");
			return;
		} else if(session.getAttribute("loginAdmin") != null) {
			((HttpServletResponse) response).sendRedirect(((HttpServletRequest) request).getContextPath()+"/admin/adminIndex");
		}

		chain.doFilter(request, response);
	
		//실행후
	}
}