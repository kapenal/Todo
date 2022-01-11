package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.NoticeService;

@WebServlet("/admin/deleteNotice")
public class DeleteNoticeController extends HttpServlet {
	private NoticeService noticeService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("noticeNo") + "DeleteNoticeController");
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		System.out.println(noticeNo + "공지사항번호");
		noticeService.removeNotice(noticeNo);
		response.sendRedirect(request.getContextPath()+"/notLogin/login");
	}
}