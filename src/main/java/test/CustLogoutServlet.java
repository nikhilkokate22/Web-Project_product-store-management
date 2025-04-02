package test;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@SuppressWarnings("serial")
@WebServlet("/logout2")
public class CustLogoutServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{
		HttpSession hs = req.getSession(false);
		if(hs==null) {
			req.setAttribute("msg", "Session Expired...<br>");
			req.getRequestDispatcher("Msg.jsp").forward(req, res);
		}
		else {
			hs.removeAttribute("cbean");
			hs.removeAttribute("alist1");
			req.setAttribute("msg","Logged Out Successfully..<br>");
			req.getRequestDispatcher("CustLogout.jsp").forward(req, res);
		}
	}
}
