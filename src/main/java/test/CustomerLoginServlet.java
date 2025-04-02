package test;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@SuppressWarnings("serial")
@WebServlet("/custLog")
public class CustomerLoginServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{
		
		String uPh=req.getParameter("custpho");
		CustomerBean cb = new CustomerLoginDAO().login(uPh);
		if(cb==null) {
			req.setAttribute("msg", "Session Expired...<br>");
			req.getRequestDispatcher("Msg.jsp").forward(req, res);
		}
		else {
			HttpSession hs = req.getSession();
			hs.setAttribute("cbean", cb);
			RequestDispatcher rd = req.getRequestDispatcher("CustomerLoginSuccess.jsp");
			rd.forward(req, res);
		}
	}
}
