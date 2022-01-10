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

@WebServlet("/member/updateTodo")
public class UpdateTodoController extends HttpServlet {
	private TodoService todoService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 일정 수정
		todoService = new TodoService();
		String todoDate = request.getParameter("todoDate");
		int todoNo = Integer.parseInt(request.getParameter("todoNo"));
		// 매개변수 디버깅
		System.out.println(todoDate+todoNo+ "UpdateTodoController.java");
		String todoContent = todoService.selectTodo(todoNo);
		// 디버깅
		System.out.println(todoContent+ "UpdateTodoController.java");
		request.setAttribute("todoNo", todoNo);
		request.setAttribute("todoDate",todoDate);
		request.setAttribute("todoContent", todoContent);
		
		request.getRequestDispatcher("/WEB-INF/view/updateTodo.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String todoDate = request.getParameter("todoDate");
		// 매개변수 디버깅
		System.out.println(request.getParameter("todoNo")+""+request.getParameter("todoContent")+"UpdateTodoController");
		Todo todo = new Todo();
		todo.setTodoNo(Integer.parseInt(request.getParameter("todoNo")));
		todo.setTodoContent(request.getParameter("todoContent"));
		todoService.updateTodo(todo);
		
		String y = todoDate.substring(0,4);
		String m = todoDate.substring(5,7);
		String d = todoDate.substring(todoDate.length()-2, todoDate.length());
		// 디버깅
		System.out.println(todoDate.substring(0,4)+todoDate.substring(5,6)+"/"+todoDate.substring(todoDate.length()-2,todoDate.length()));
		
		response.sendRedirect(request.getContextPath()+"/member/todoList?y="+y+"&m="+m+"&d="+d);
	}

}
