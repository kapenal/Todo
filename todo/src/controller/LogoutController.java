package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/member/logout")
public class LogoutController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 상태에서만 요청할 수 있도록 필터링 -> 필터를 사용(LoginFilter)
		
		request.getSession().invalidate();
		response.sendRedirect(request.getContextPath()+"/notLogin/login");
	}
}