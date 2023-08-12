package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberBean;
import model.MemberDAO;

// 서블릿 url apply.do
// 멤버 아이디를 아이디를 가지고 세션에서 꺼내와서 
// DAO데이터베이스에 처리하는 기능을 만든다. getOneMembr()
// 결과값 가지고 오고 가져온 결과를 MemberBean객체를 생성해서 
// 그 결과를 07_Apply.jsp로 보낸다.


@WebServlet("/apply.do")
public class _07_Apply extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		reqPro(req,resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		reqPro(req,resp);
	}
	
	public void reqPro(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// id값 가져오기 
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("memId");
		
		if( id != null) {
			// 1. 아이디값을 이용해서 데이터베이스에서 찾아서 결과를 저장!
			MemberDAO mdao = MemberDAO.getInstance();
			MemberBean bean = mdao.getOneMember(id);
			
			String tel = bean.getTel();
			String[] arr = tel.split("-"); 
			String tel1 = arr[0];
			String tel2 = arr[1];
			String tel3 = arr[2];
			
			
			req.setAttribute("tel1", tel1);
			req.setAttribute("tel2", tel2);
			req.setAttribute("tel3", tel3);
			req.setAttribute("bean", bean);
			
		}
		RequestDispatcher dis = req.getRequestDispatcher("07_apply.jsp");
		dis.forward(req, resp);
		
	}
}





