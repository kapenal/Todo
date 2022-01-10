package controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.CalendarService;
import service.TodoService;
import vo.Member;
import vo.Todo;

@WebServlet("/member/calendar")
public class CalendarController extends HttpServlet {
	private CalendarService calendarService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 상태에서만 요청할 수 있도록 필터링 -> 필터를 사용(LoginFilter)
		
		String currentYear = request.getParameter("currentYear");
		String currentMonth = request.getParameter("currentMonth");
		String option = request.getParameter("option");
		// 디버깅
		System.out.println(currentYear+"년 "+currentMonth+"월 "+option+"옵션 CalendarController");
		
		calendarService = new CalendarService();
		String memberId = ((Member)request.getSession().getAttribute("loginMember")).getMemberId();
		// 디버깅
		System.out.println(memberId + "CalendarController");
		Map<String, Object> map = calendarService.getTargetCalendar(memberId, currentYear, currentMonth, option);
		
		// 모델
		request.setAttribute("targetYear", map.get("targetYear"));
		request.setAttribute("targetMonth", map.get("targetMonth"));
		request.setAttribute("endDay", map.get("endDay"));
		request.setAttribute("preEndDay", map.get("preEndDay"));
		// 달력을 출력할때 사용할 빈칸
		request.setAttribute("startBlank", map.get("startBlank"));
		request.setAttribute("endBlank", map.get("endBlank"));
		// 달력에 출력할 일정 모델
		request.setAttribute("todoList", map.get("todoList"));
		
		request.getRequestDispatcher("/WEB-INF/view/calendar.jsp").forward(request, response);
	}
}