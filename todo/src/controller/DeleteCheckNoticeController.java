package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/admin/deleteCheckNotice")
public class DeleteCheckNoticeController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("noticeNo") + "DeleteNoticeController");
		System.out.println(request.getParameter("noticeTitle") + "DeleteNoticeController");
		request.setAttribute("noticeNo", request.getParameter("noticeNo"));
		request.setAttribute("noticeTitle", request.getParameter("noticeTitle"));
		request.getRequestDispatcher("/WEB-INF/view/deleteCheckNotice.jsp").forward(request, response);
	}

}