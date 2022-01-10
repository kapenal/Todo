package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.Notice;

public class NoticeDao {
	// 공지 삭제
	public void deleteNotice(Connection conn) {
		// 여기부터...
	}
	
	// 공지 작성
	public void insertNotice(Connection conn, Notice notice) throws SQLException {
		String sql = NoticeQuery.INSERT_NOTICE;
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, notice.getNoticeTitle());
		stmt.setString(2, notice.getNoticeContent());
		System.out.println(stmt + "NoticeDao.insertNotice");
		stmt.executeUpdate();
		stmt.close();
	}
	
	// 공지사항 상세보기
	public Notice selectNoticeOne(Connection conn, int noticeNo) throws SQLException {
		Notice notice = new Notice();
		String sql = NoticeQuery.SELECT_NOTICE_ONE;
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, noticeNo);
		System.out.println(stmt + "NoticeDao.selectNoticeOne");
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			notice.setNoticeNo(rs.getInt("noticeNo"));
			notice.setNoticeTitle(rs.getString("noticeTitle"));
			notice.setNoticeContent(rs.getString("noticeContent"));
			notice.setCreateDate(rs.getString("createDate"));
		}
		rs.close();
		stmt.close();
		return notice;
	}
	
	public int selectNoticeCount(Connection conn) throws SQLException {
		int count = 0;
		String sql = NoticeQuery.SELECT_NOTICE_COUNT;
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		System.out.println(rs);
		while(rs.next()) {
			count++;
		}
		rs.close();
		stmt.close();
		return count;
	}
	
	// 공지사항 리스트
	public List<Notice> selectNoticeList(Connection conn, int beginRow, int ROW_PER_PAGE) throws SQLException{
		List<Notice> list = new ArrayList<>();
		String sql = NoticeQuery.SELECT_NOTICE_LIST;
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, ROW_PER_PAGE);
		System.out.println(stmt + "NoticeDao.selectNoticeList");
		ResultSet rs = stmt.executeQuery();
		while(rs.next()){
			Notice notice = new Notice();
			notice.setNoticeNo(rs.getInt("noticeNo"));
			notice.setNoticeTitle(rs.getString("noticeTitle"));
			notice.setCreateDate(rs.getString("createDate"));
			list.add(notice);
		}
		rs.close();
		stmt.close();
		return list;
	}
	
	// login화면에 보여줄 공지사항 5개
	public List<Notice> selectNoticeList5(Connection conn) throws SQLException{
		List<Notice> list = new ArrayList<>();
		String sql = NoticeQuery.SELECT_NOTICE_LIST5;
		PreparedStatement stmt = conn.prepareStatement(sql);
		System.out.println(stmt + "NoticeDao.selectNoticeList5");
		ResultSet rs = stmt.executeQuery();
		while(rs.next()){
			Notice notice = new Notice();
			notice.setNoticeNo(rs.getInt("noticeNo"));
			notice.setNoticeTitle(rs.getString("noticeTitle"));
			notice.setCreateDate(rs.getString("createDate"));
			list.add(notice);
		}
		rs.close();
		stmt.close();
		return list;
	}
}
