package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.Admin;

public class AdminDao {
	// 로그인
		public Admin login(Connection conn, Admin paramMember) throws SQLException {
			Admin loginAdmin = null;
			String sql = AdminQuery.ADMIN_LOGIN;
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, paramMember.getAdminId());
			stmt.setString(2, paramMember.getAdminPw());
			System.out.println(stmt + "AdminDao.login stmt");
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				loginAdmin = new Admin();
				loginAdmin.setAdminId(rs.getString("adminId"));
			}
			rs.close();
			stmt.close();
			return loginAdmin;
		}
}
