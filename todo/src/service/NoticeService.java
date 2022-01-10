package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import commons.DBUtil;
import dao.MemberDao;
import dao.NoticeDao;
import vo.Notice;

public class NoticeService {
	private NoticeDao noticeDao;
	
	public void insertNotice(Notice notice) {
		Connection conn = DBUtil.getConnection("jdbc:mariadb://3.36.55.237:3306/todo", "root", "java1004");
		try {
			noticeDao = new NoticeDao();
			noticeDao.insertNotice(conn, notice);
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
	
	public Notice getNoticeOne(int noticeNo) {
		Notice notice = new Notice();
		Connection conn = null;
		
		try {
			conn = DBUtil.getConnection("jdbc:mariadb://3.36.55.237:3306/todo", "root", "java1004");
			noticeDao = new NoticeDao();
			notice = noticeDao.selectNoticeOne(conn, noticeNo);
			System.out.println("공지사항 상세보기 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("공지사항 상세보기 실패");
		} finally {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return notice;
	}
	
	public Map<String, Object> getNoticeList(int currentPage, int ROW_PER_PAGE){
		List<Notice> list = null;
		Connection conn = null;
		int beginRow = 0;
		int displayPage = 10;
		int startPage = 0;
		int lastPage = 0;
		beginRow = (currentPage - 1) * ROW_PER_PAGE;
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			conn = DBUtil.getConnection("jdbc:mariadb://3.36.55.237:3306/todo", "root", "java1004");
			noticeDao = new NoticeDao();
			list = noticeDao.selectNoticeList(conn, beginRow, ROW_PER_PAGE);
			startPage = ((currentPage - 1) / displayPage) * displayPage + 1;
			int totalCount = noticeDao.selectNoticeCount(conn);
			lastPage = startPage + displayPage - 1;
			int totalPage = totalCount / ROW_PER_PAGE;
			if(totalCount % ROW_PER_PAGE != 0) {
				totalPage += 1;
			}
			if(lastPage > totalPage) {
				lastPage = totalPage;
			}
			map.put("list", list);
			map.put("startPage", startPage);
			map.put("lastPage", lastPage);
			map.put("totalPage", totalPage);
			System.out.println("공지사항 출력 완료");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("공지사항 출력 실패");
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return map;
	}
	
	public List<Notice> getNoticeList5(){
		List<Notice> list = null;
		Connection conn = null;
		
		try {
			conn = DBUtil.getConnection("jdbc:mariadb://3.36.55.237:3306/todo", "root", "java1004");
			noticeDao = new NoticeDao();
			list = noticeDao.selectNoticeList5(conn);
			System.out.println("공지사항 출력 완료");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("공지사항 출력 실패");
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}
}
