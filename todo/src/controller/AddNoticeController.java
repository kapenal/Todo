package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.NoticeService;
import vo.Notice;

@WebServlet("/admin/addNotice")
public class AddNoticeController extends HttpServlet {
	private NoticeService noticeService;
	private Notice notice;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/addNotice.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		noticeService = new NoticeService();
		notice = new Notice();
		String noticeTitle = request.getParameter("noticeTitle");
		String noticeContent = request.getParameter("noticeContent");
		System.out.println(noticeTitle + "and" + noticeContent);
		notice.setNoticeTitle(noticeTitle);
		notice.setNoticeContent(noticeContent);
		noticeService.insertNotice(notice);
		response.sendRedirect(request.getContextPath()+"/noticeList");
	}

}
