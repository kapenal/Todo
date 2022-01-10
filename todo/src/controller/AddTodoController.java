package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberService;
import service.TodoService;
import vo.Member;
import vo.Todo;

@WebServlet("/member/addTodo")
public class AddTodoController extends HttpServlet {
	private TodoService todoService;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 일정 추가
		todoService = new TodoService();
		String todoDate = request.getParameter("todoDate");
		String todoContent = request.getParameter("todoContent");
		String fontColor = request.getParameter("fontColor");
		// 디버깅
		System.out.println(todoDate + todoContent + fontColor +"AddTodoController.java");
		String memberId = ((Member)(request.getSession().getAttribute("loginMember"))).getMemberId();
		Todo todo = new Todo();
		todo.setMemberId(memberId);
		todo.setTodoDate(todoDate);
		todo.setTodoContent(todoContent);
		todo.setFontColor(fontColor);
		todoService.addTodo(todo);
		
		String y = todoDate.substring(0,4);
		String m = todoDate.substring(5,7);
		String d = todoDate.substring(todoDate.length()-2, todoDate.length());
		// 디버깅
		System.out.println(todoDate.substring(0,4)+todoDate.substring(5,6)+"/"+todoDate.substring(todoDate.length()-2,todoDate.length()));
		
		response.sendRedirect(request.getContextPath()+"/member/todoList?y="+y+"&m="+m+"&d="+d);
	}

}
