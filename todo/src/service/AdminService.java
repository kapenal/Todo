package service;

import java.sql.Connection;
import java.sql.SQLException;

import commons.DBUtil;
import dao.AdminDao;
import dao.MemberDao;
import vo.Admin;

public class AdminService {
	private AdminDao adminDao;
	
	public Admin login(Admin admin) {
		Admin loginAdmin = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection("jdbc:mariadb://3.36.55.237:3306/todo", "root", "java1004");
			System.out.println("AdminService login conn 접속 성공");
			this.adminDao = new AdminDao();
			loginAdmin = adminDao.login(conn, admin);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		return loginAdmin;
	}
}
