package test;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

@SuppressWarnings("serial")
@WebServlet("/custReg")
public class CustomerRegisterServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		long phNo = Long.parseLong(req.getParameter("custRegMo"));
		String cNm = req.getParameter("custRegNm");
		String cCt = req.getParameter("custRegCity");
		String cMid = req.getParameter("custMid");
		String cId = req.getParameter("custRegNm")+(req.getParameter("custRegMo")).substring(5);
		System.out.println(cId);
		
		CustomerBean cb = new CustomerBean();
		cb.setCustPhno(phNo);
		cb.setCustNm(cNm);
		cb.setCustCt(cCt);
		cb.setCustMid(cMid);
		cb.setCustId(cId);
		
		System.out.println(cb+" register servlet");
		int status = CustomerBeanDAO.reg(cb);
		System.out.println(status);
		if(status>0) {
			HttpSession hs = req.getSession();
			hs.setAttribute("cbean", cb);
			RequestDispatcher rd = req.getRequestDispatcher("CustomerLoginSuccess.jsp");
			rd.forward(req, res);
		}
		else {
			req.setAttribute("msg", "Registration failed..<br>");
			req.getRequestDispatcher("Msg.jsp").forward(req, res);
		}
	}
}
