package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.TodoService;
import vo.Member;
import vo.Todo;


@WebServlet("/member/todoList")
public class TodoListController extends HttpServlet {
	
	private TodoService todoService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String y = request.getParameter("y");
		String m = request.getParameter("m");
		String d = request.getParameter("d");
		// 디버깅
		System.out.println(y+""+m+""+d);
		// 월, 일 9이하 즉 2글자 미만이면 앞에 0을 붙여줌 ex) 9월 9일 -> 09월 09일
		if(d.length()<2) {
			d = "0"+d;
		}
		if(m.length()<2) {
			m = "0"+m;
		}
		String todoDate = y+"-"+m+"-"+d;
		String memberId = ((Member)(request.getSession().getAttribute("loginMember"))).getMemberId();
		Todo todo = new Todo();
		todo.setTodoDate(todoDate);
		todo.setMemberId(memberId);
		
		todoService = new TodoService();
		List<Todo> todoList = todoService.getTodoListByList(todo);
		int todoSize = todoList.size();
		// System.out.println(todoSize + "일정 개수");
		request.setAttribute("todoSize", todoSize);
		request.setAttribute("todoList", todoList);
		// System.out.println(todoList.size());
		request.setAttribute("todoDate", todoDate);
		request.getRequestDispatcher("/WEB-INF/view/todoList.jsp").forward(request, response);
	}
}