package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.Todo;

public class TodoDao {
	// 일정 수정
	public void updateTodo(Connection conn, Todo todo) throws SQLException {
		String sql = TodoQuery.UPDATE_TODO;
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, todo.getTodoContent());
		stmt.setInt(2, todo.getTodoNo());
		System.out.println(stmt + "TodoDao.updateTodo");
		stmt.executeUpdate();
		stmt.close();
	}
	// 현재 월 모든 일정 조회
	public List<Todo> selectTodoListByMonth(Connection conn, Todo todo) throws SQLException{
		List<Todo> list = new ArrayList<Todo>();
		String sql = TodoQuery.SELECT_TODO_LIST_BY_MONTH;
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, todo.getMemberId());
		stmt.setString(2, todo.getTodoDate());
		System.out.println(stmt + "TodoDao.selectTodoListByMonth");
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Todo t = new Todo();
			t.setTodoDate(rs.getString("todoDate"));
			t.setTodoContent(rs.getString("todoContent5"));
			t.setFontColor(rs.getString("fontColor"));
			list.add(t);
		}
		return list;
	}
	// 일정 조회(수정할때 사용)
	public String selectTodo(Connection conn, int todoNo) throws SQLException {
		String todoContent = null;
		String sql = TodoQuery.SELECT_TODO;
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, todoNo);
		System.out.println(stmt + "TodoDao.selectTodo");
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			todoContent = rs.getString("todoContent");
		}
		stmt.close();
		rs.close();
		return todoContent;
	}
	// 일정 삭제
	public void removeTodo(Connection conn, int todoNo) throws SQLException {
		String sql = TodoQuery.REMOVE_TODO;
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, todoNo);
		System.out.println(stmt + "TodoDao.removeTodo");
		stmt.executeUpdate();
		stmt.close();
	}
	// 일정 추가
	public void addTodo(Connection conn, Todo todo) throws SQLException {
		String sql = TodoQuery.ADD_TODO;
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, todo.getMemberId());
		stmt.setString(2, todo.getTodoContent());
		stmt.setString(3, todo.getTodoDate());
		stmt.setString(4, todo.getFontColor());
		System.out.println(stmt + "TodoDao.addTodo");
		stmt.executeUpdate();
		stmt.close();
	}
	// 날짜에 해당하는 일정 리스트 조회
	public List<Todo> selectTodoListByDate(Connection conn, Todo todo) throws SQLException {
		List<Todo> list = new ArrayList<Todo>();
		String sql = TodoQuery.SELECT_TODO_LIST_BY_DATE;
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, todo.getMemberId());
		stmt.setString(2, todo.getTodoDate());
		System.out.println(stmt + "TodoDao.selectTodoListByDate");
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Todo t = new Todo();
			t.setTodoNo(rs.getInt("todoNo"));
			t.setTodoDate(rs.getString("todoDate"));
			t.setTodoContent(rs.getString("todoContent"));
			t.setCreateDate(rs.getString("createDate"));
			t.setUpdateDate(rs.getString("updateDate"));
			list.add(t);
		}
		return list;
	}
	// 회원탈퇴 시 회원의 일정 삭제
	public void deleteTodo(Connection conn, String memberId) throws SQLException {
		String sql = TodoQuery.DELETE_TODO;
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, memberId);
		System.out.println(stmt + "TodoDao.deleteTodo");
		stmt.executeUpdate();
		stmt.close();
	}

}
