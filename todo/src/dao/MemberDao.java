package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.Member;

public class MemberDao {
	// 회원가입 중복아이디 검사
	public int checkMember(Connection conn, String memberId) throws SQLException {
		int result = 0;
		String sql = MemberQuery.CHECK_MEMBER;
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, memberId);
		System.out.println(stmt + "checkMember");
		int row = stmt.executeUpdate();
		ResultSet rs = stmt.executeQuery();
		
		System.out.println(row + "checkMember");
		if(rs.next()) {
			result++;
		}
		System.out.println(result + "checkMember");
		rs.close();
		stmt.close();
		return result;
	}
	
	// 회원가입
	public void insertMember(Connection conn, String memberId, String memberPw) throws SQLException {
		String sql = MemberQuery.INSERT_MEMBER;
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, memberId);
		stmt.setString(2, memberPw);
		System.out.println(stmt + "MemberDao.insertMember");
		stmt.executeUpdate();
		stmt.close();
	}
	
	// 회원탈퇴
	public int deleteMember(Connection conn, String memberId, String memberPw) throws SQLException {
		String sql = MemberQuery.DELETE_MEMBER;
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, memberId);
		stmt.setString(2, memberPw);
		System.out.println(stmt + "MemberDao.deleteMember");
		int row = stmt.executeUpdate();
		System.out.println(row);
		stmt.close();
		return row;
	}
	// 로그인
	public Member login(Connection conn, Member paramMember) throws SQLException {
		Member loginMember = null;
		String sql = MemberQuery.LOGIN;
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, paramMember.getMemberId());
		stmt.setString(2, paramMember.getMemberPw());
		System.out.println(stmt + "MemberDao.login stmt");
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			loginMember = new Member();
			loginMember.setMemberId(rs.getString("memberId"));
		}
		rs.close();
		stmt.close();
		return loginMember;
	}
}