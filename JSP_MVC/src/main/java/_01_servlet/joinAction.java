package _01_servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

	// 브라우저 주소창의 contextPath("/프로젝트명) 뒤에 @WebServlet 어노테이션 인수로
	// 지정된 요청이 들어오면 get방식으로 요청이 들어오면 doGet() 메서드가 자동으로 실행된다.
	//							post 방식으로 요청이 들어온다. doPost() 메서드가 자동으로 실행된다.
	
	
	// @WebServlet(/HomeController) -> mvc2 에서 controller 그때 사용! 
	@WebServlet("/joinAction")
	//위에꺼 치고 ctrl+space
	public class joinAction extends HttpServlet {

	
	// get방식으로 컨트롤러에 요청이 들어올 때 자동으로 실행되는 메서드
	// submit 버튼이 클릭되지 않았을 때
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doGet(req, resp);
	}
	
	// post 방식으로 컨트롤러에 요청이 들어올 때 자동으로 실행되는 메서드
	// submit 버튼이 클릭 되었을 때
	@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			reqPro(req,resp);
	
	}
	
	// 실제 처리하는 메서드를 호출 작성!
	protected void reqPro(HttpServletRequest req, HttpServletResponse resp)
						throws ServletException, IOException{
		
		req.setCharacterEncoding("utf-8");
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
	
		// 취미
		String[] arr = req.getParameterValues("hobby");
		String hobby = "";
		
		for(int i = 0; i < arr.length; i++) {
			hobby += arr[i];
			if(i != arr.length -1) {
				hobby += ",";				
			}			
		}
		
		MemberBean bean = new MemberBean(id,pw,name,email,hobby);
		
		// request 객체를 통해 jsp페이지로 전달할 데이터를 저장
		// 01_joinView.jsp로 저장해서 보낸다.
		req.setAttribute("bean", bean);
		
		
		// RequestDispatcher 인터페이스 객체를 이용해서 요청
		// 브라우저에 표시하기 위해 준비한다.
		RequestDispatcher dis = req.getRequestDispatcher("/Servlet/01_joinView.jsp");
		
		// forward()
		dis.forward(req, resp);
		
		
		
	}
	
	
	
	// init() 초기화진행을 진행을 해야된다.
	@Override
		public void init() throws ServletException {
			System.out.println("서블릿초기화");
	}
	
	
	// destory() 서블릿을 제거하는 것!

	private void destory() {
			System.out.println("서블릿 제거");
	}
	
	
	
	
}

