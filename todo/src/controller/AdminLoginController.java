package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.AdminService;
import service.NoticeService;
import vo.Admin;
import vo.Notice;


@WebServlet("/notLogin/adminLogin")
public class AdminLoginController extends HttpServlet {
	private AdminService adminService;
	private Admin admin;
	private NoticeService noticeService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// login 폼페이지
		System.out.println("디버깅");
		noticeService = new NoticeService();
		List<Notice> noticeList = noticeService.getNoticeList5();
		request.setAttribute("noticeList", noticeList);
		
		request.getRequestDispatcher("/WEB-INF/view/adminLogin.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		System.out.println(request.getParameter("adminId"));
		System.out.println(request.getParameter("adminPw"));
		adminService = new AdminService();
		admin = new Admin();
		admin.setAdminId(request.getParameter("adminId"));
		admin.setAdminPw(request.getParameter("adminPw"));
		// 디버깅
		System.out.println(admin.getAdminId() + admin.getAdminPw() + "AdminLoginController.java");
		Admin loginAdmin = adminService.login(admin);
		if(loginAdmin == null) {
			System.out.println("로그인 실패");
			request.getSession().invalidate();
			response.sendRedirect(request.getContextPath()+"/notLogin/adminLogin");
			return;
		} else {
			System.out.println("로그인 성공");
			session.setAttribute("loginAdmin", loginAdmin);
			response.sendRedirect(request.getContextPath()+"/admin/adminIndex");
		}
	}

}
