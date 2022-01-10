package dao;

public class NoticeQuery {
	public static String SELECT_NOTICE_LIST5;
	public static String SELECT_NOTICE_LIST;
	public static String SELECT_NOTICE_ONE;
	public static String SELECT_NOTICE_COUNT;
	public static String INSERT_NOTICE;
	public static String DELETE_NOTICE;
	static {
		SELECT_NOTICE_LIST5 = "SELECT notice_no noticeNo, notice_title noticeTitle, create_date createDate FROM notice ORDER BY createDate DESC LIMIT 0,5";
		SELECT_NOTICE_LIST = "SELECT notice_no noticeNo, notice_title noticeTitle, create_date createDate FROM notice ORDER BY createDate DESC LIMIT ?, ?";
		SELECT_NOTICE_ONE = "SELECT notice_no noticeNo, notice_title noticeTitle, notice_content noticeContent, create_date createDate FROM notice WHERE notice_no = ?";
		SELECT_NOTICE_COUNT = "SELECT COUNT(*) FROM notice";
		INSERT_NOTICE = "INSERT INTO notice(notice_title, notice_content, create_date, update_date) VALUES(?,?,NOW(),NOW())";
		DELETE_NOTICE = "DELETE FROM notice WHERE notice_no = ?";
	}
}