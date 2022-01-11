package controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.NoticeService;
import vo.Notice;

@WebServlet("/notLogin/noticeList")
public class NoticeListController extends HttpServlet {
	private NoticeService noticeService;
	private final int ROW_PER_PAGE = 10;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		noticeService = new NoticeService();
		int currentPage;
		if(request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		HttpSession session = ((HttpServletRequest)request).getSession();
		request.setAttribute("loginAdmin", session.getAttribute("loginAdmin"));
		Map<String, Object> map = noticeService.getNoticeList(currentPage, ROW_PER_PAGE);
		request.setAttribute("noticeList", map.get("list"));
		request.setAttribute("startPage", map.get("startPage"));
		request.setAttribute("lastPage", map.get("lastPage"));
		request.setAttribute("totalPage", map.get("totalPage"));
		request.setAttribute("currentPage", currentPage);
		
		request.getRequestDispatcher("/WEB-INF/view/noticeList.jsp").forward(request, response);
	}

}
