package dao;

public class TodoQuery {
	public static final String DELETE_TODO;
	public static final String SELECT_TODO_LIST_BY_DATE;
	public static final String SELECT_TODO_LIST_BY_MONTH;
	public static final String ADD_TODO;
	public static final String REMOVE_TODO;
	public static final String SELECT_TODO;
	public static final String UPDATE_TODO;
	// 스태틱필드 초기화시킬때 사용
	static {
		DELETE_TODO = "DELETE FROM todo WHERE member_id=?";
		SELECT_TODO_LIST_BY_DATE = "SELECT todo_no todoNo, todo_date todoDate, todo_content todoContent, create_date createDate, update_date updateDate FROM todo WHERE member_id=? AND todo_date=?";
		SELECT_TODO_LIST_BY_MONTH = "SELECT todo_date todoDate, SUBSTR(todo_content, 1, 5) todoContent5, font_color fontColor FROM todo WHERE member_id=? AND SUBSTR(todo_date, 1, 7)=? ORDER BY todo_date ASC";
		ADD_TODO = "INSERT INTO todo( member_id, todo_content, todo_date, create_date, update_date, font_color) VALUES(?,?,?,NOW(),NOW(),?)";
		REMOVE_TODO = "DELETE FROM todo WHERE todo_no=?";
		SELECT_TODO = "SELECT todo_date todoDate, todo_content todoContent, update_date updateDate FROM todo WHERE todo_no=?";
		UPDATE_TODO = "UPDATE todo SET todo_content=?, update_date=Now() WHERE todo_no=?";
	}
}
