package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberService;
import vo.Member;


@WebServlet("/notLogin/addMember")
public class AddMemberController extends HttpServlet {
	private MemberService memberService;
	private Member member;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원가입
		/*
		HttpSession session = request.getSession();
		if(session.getAttribute("loginMember") != null) {
			response.sendRedirect(request.getContextPath()+"/member/calendar");
			return;
		}
		*/
		request.getRequestDispatcher("/WEB-INF/view/addMember.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		memberService = new MemberService();
		member = new Member();
		String memberId = request.getParameter("memberId");
		String memberPW = request.getParameter("memberPw");
		// 디버깅
		System.out.println(memberId + memberPW + "AddMemberController.java");
		memberService.insertMember(memberId, memberPW);
		
		response.sendRedirect(request.getContextPath()+"/notLogin/login");
	}

}
