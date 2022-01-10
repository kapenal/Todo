package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.MemberService;
import service.NoticeService;
import vo.Member;
import vo.Notice;


@WebServlet("/notLogin/login")
public class LoginController extends HttpServlet {
	private MemberService memberService;
	private Member member;
	private NoticeService noticeService;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// login 폼페이지
	
		noticeService = new NoticeService();
		List<Notice> noticeList = noticeService.getNoticeList5();
		request.setAttribute("noticeList", noticeList);
		
		request.getRequestDispatcher("/WEB-INF/view/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// login 액션
		// 모든 컨트롤러 doPost() 상단에 무조건 필요 -> 공통된 로직이 중복 -> 필터 사용
		// request.setCharacterEncoding("utf-8");
		
		// 이미 로그인 되었다면 요청 처리 불가
		HttpSession session = request.getSession();
		if(session.getAttribute("loginMember") != null) {
			response.sendRedirect(request.getContextPath()+"/member/calendar");
			return;
		}
		
		memberService = new MemberService();
		member = new Member();
		member.setMemberId(request.getParameter("memberId"));
		member.setMemberPw(request.getParameter("memberPw"));
		// 디버깅
		System.out.println(member.getMemberId() + member.getMemberPw() + "LoginController.java");
		Member loginMember = memberService.login(member);
		if(loginMember == null) {
			System.out.println("로그인 실패");
			request.getSession().invalidate();
			response.sendRedirect(request.getContextPath()+"/notLogin/login");
			return;
		} else {
			System.out.println("로그인 성공");
			session.setAttribute("loginMember", loginMember);
			response.sendRedirect(request.getContextPath()+"/member/calendar");
		}
	
	}

}
