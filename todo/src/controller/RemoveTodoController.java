package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.TodoService;
import vo.Member;
import vo.Todo;

@WebServlet("/member/removeTodo")
public class RemoveTodoController extends HttpServlet {
	private TodoService todoService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 일정 삭제
		todoService = new TodoService();
		String todoDate = request.getParameter("todoDate");
		int todoNo = Integer.parseInt(request.getParameter("todoNo"));
		// 디버깅
		System.out.println(todoDate + "RemoveTodoController.java");
		todoService.removeTodo(todoNo);
		String y = todoDate.substring(0,4);
		String m = todoDate.substring(5,7);
		String d = todoDate.substring(todoDate.length()-2, todoDate.length());
		// 디버깅
		System.out.println(todoDate.substring(0,4)+todoDate.substring(5,6)+"/"+todoDate.substring(todoDate.length()-2,todoDate.length()));
		
		response.sendRedirect(request.getContextPath()+"/member/todoList?y="+y+"&m="+m+"&d="+d);
	}


}
