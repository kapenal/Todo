package service;

import java.sql.Connection;
import java.sql.SQLException;

import commons.DBUtil;
import dao.MemberDao;
import dao.TodoDao;
import vo.Member;

public class MemberService {
	private MemberDao memberDao;
	private TodoDao todoDao;
	
	public int checkMember(String memberId) {
		Connection conn = DBUtil.getConnection("jdbc:mariadb://3.36.55.237:3306/todo", "root", "java1004");
		int result = 0;
		try {
			memberDao = new MemberDao();
			result = memberDao.checkMember(conn, memberId);
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public void insertMember(String memberId, String memberPw) {
		Connection conn = DBUtil.getConnection("jdbc:mariadb://3.36.55.237:3306/todo", "root", "java1004");
		try {
			memberDao = new MemberDao();
			memberDao.insertMember(conn, memberId, memberPw);
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public boolean removeMember(String memberId, String memberPw) {
		boolean result = false;
		Connection conn = DBUtil.getConnection("jdbc:mariadb://3.36.55.237:3306/todo", "root", "java1004");
		try {
			conn.setAutoCommit(false);
			todoDao = new TodoDao();
			memberDao = new MemberDao();
			todoDao.deleteTodo(conn, memberId);
			// 삭제되는 행이 있는지 확인, todo에 외래키로 된게 있으면 delete가 안되서 예외처리 발생 -> 해결(예외 강제 발생으로 catch문으로 이동)
			if(memberDao.deleteMember(conn, memberId, memberPw) != 1) { 
				throw new Exception();
			}
			conn.commit();
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public Member login(Member member) {
		Member loginMember = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection("jdbc:mariadb://3.36.55.237:3306/todo", "root", "java1004");
			System.out.println("MemberService login conn 접속 성공");
			this.memberDao = new MemberDao();
			loginMember = memberDao.login(conn, member);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		return loginMember;
	}
}
