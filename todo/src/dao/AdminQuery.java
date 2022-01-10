package dao;

public class AdminQuery {
	public static final String ADMIN_LOGIN;
	// 스태틱필드 초기화시킬때 사용
	static {
		ADMIN_LOGIN = "SELECT admin_id adminId FROM admin WHERE admin_id=? AND admin_pw=?";
	}
}