package test;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
@SuppressWarnings("serial")
@WebServlet("/admin")
public class AdminLoginServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException,IOException {
		String uN = req.getParameter("uname");
		String pW = req.getParameter("pword");
		AdminBean ab = new AdminLoginDAO().login(uN, pW);
		if(ab==null) {
			req.setAttribute("msg", "Invalid credentials..<br>");
			req.getRequestDispatcher("Msg.jsp").forward(req, res);
		}else {
			HttpSession hs = req.getSession();//New session created
			hs.setAttribute("abean", ab);
			RequestDispatcher rd = req.getRequestDispatcher("AdminLoginSuccess.jsp");
			rd.forward(req, res);
		}
	}
}
