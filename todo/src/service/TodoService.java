package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import commons.DBUtil;
import dao.TodoDao;
import vo.Todo;

public class TodoService {
	private TodoDao todoDao;
	
	public void updateTodo(Todo todo) {
		Connection conn = null;
		try {
			conn = DBUtil.getConnection("jdbc:mariadb://3.36.55.237:3306/todo", "root", "java1004");
			todoDao = new TodoDao();
			todoDao.updateTodo(conn, todo);
			System.out.println("일정 수정 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("일정 수정 실패 ");
		} finally {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public String selectTodo(int todoNo) {
		Connection conn = null;
		String todoContent = null;
		try {
			conn = DBUtil.getConnection("jdbc:mariadb://3.36.55.237:3306/todo", "root", "java1004");
			todoDao = new TodoDao();
			todoContent = todoDao.selectTodo(conn, todoNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return todoContent;
	}
	
	public void removeTodo(int todoNo) {
		Connection conn = null;
		try {
			conn = DBUtil.getConnection("jdbc:mariadb://3.36.55.237:3306/todo", "root", "java1004");
			todoDao = new TodoDao();
			todoDao.removeTodo(conn, todoNo);
			System.out.println("일정 삭제 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("일정 삭제 실패");
		} finally {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public void addTodo(Todo todo) {
		Connection conn = null;
		try {
			conn = DBUtil.getConnection("jdbc:mariadb://3.36.55.237:3306/todo", "root", "java1004");
			todoDao = new TodoDao();
			todoDao.addTodo(conn, todo);
			System.out.println("일정 추가 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("일정 추가 실패");
		} finally {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public List<Todo> getTodoListByList(Todo todo) {
		List<Todo> list = new ArrayList<>();
		Connection conn = null;
		
		try {
			conn = DBUtil.getConnection("jdbc:mariadb://3.36.55.237:3306/todo", "root", "java1004");
			todoDao = new TodoDao();
			list = todoDao.selectTodoListByDate(conn, todo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}
}
