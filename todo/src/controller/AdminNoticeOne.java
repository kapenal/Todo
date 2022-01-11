package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.NoticeService;
import vo.Notice;


@WebServlet("/admin/adminNoticeOne")
public class AdminNoticeOne extends HttpServlet {
private NoticeService noticeService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		
		noticeService = new NoticeService();
		Notice notice = noticeService.getNoticeOne(noticeNo);
		HttpSession session = ((HttpServletRequest)request).getSession();
		
		request.setAttribute("loginAdmin", session.getAttribute("loginAdmin"));
		request.setAttribute("notice", notice);
		
		request.getRequestDispatcher("/WEB-INF/view/adminNoticeOne.jsp").forward(request, response);
	}
}
