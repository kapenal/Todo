package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MemberService;


@WebServlet("/notLogin/checkMember")
public class CheckMember extends HttpServlet {
	private MemberService memberService;
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		System.out.println(memberId);
		memberService = new MemberService();
		String result = "사용가능";
		if(memberService.checkMember(memberId) != 0) {
			result = "사용불가";
			memberId = "";
		}
		System.out.println(result);
		System.out.println(memberId);
		request.setAttribute("result", result);
		request.setAttribute("memberId", memberId);
		request.getRequestDispatcher("/WEB-INF/view/addMember.jsp").forward(request, response);
	}
	
}