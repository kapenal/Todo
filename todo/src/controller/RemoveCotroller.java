package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import service.MemberService;
import vo.Member;

@WebServlet("/member/removeMember")
public class RemoveCotroller extends HttpServlet {
	private MemberService memberService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원탈퇴폼
		request.getRequestDispatcher("/WEB-INF/view/deleteMember.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원탈퇴액션
		memberService = new MemberService();
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		String memberId = loginMember.getMemberId();
		String memberPw = request.getParameter("memberPw");
		// 디버깅
		System.out.println(memberId + memberPw + "RemoveCotroller.java");
		boolean result = memberService.removeMember(memberId, memberPw);
		if(result) {
			System.out.println("회원탈퇴 성공");
			response.sendRedirect(request.getContextPath()+"/member/logout");
		} else {
			System.out.println("회원탈퇴 실패");
			response.sendRedirect(request.getContextPath()+"/member/calendar");
		}
		
	}

}