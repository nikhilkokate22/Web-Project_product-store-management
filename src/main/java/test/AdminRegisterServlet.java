package test;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@SuppressWarnings("serial")
@WebServlet("/adminReg")

public class AdminRegisterServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{
		String aNm = req.getParameter("aname");
		String aPw = req.getParameter("apass");
		String aFn = req.getParameter("aFname");
		String aLn = req.getParameter("aLname");
		String aCt = req.getParameter("acity");
		String aMid = req.getParameter("amid");
		Long aPh = Long.parseLong(req.getParameter("aphno"));
		
		AdminBean ab = new AdminBean();
		ab.setuName(aNm);
		ab.setpWord(aPw);
		ab.setfName(aFn);
		ab.setlName(aLn);
		ab.setCity(aCt);
		ab.setmId(aMid);
		ab.setPhNo(aPh);
		
		int status = AdminRegisterDAO.reg(ab);
		if(status>0) {
			HttpSession hs = req.getSession();
			hs.setAttribute("Abean", ab);
			RequestDispatcher rd = req.getRequestDispatcher("AdminRegister.jsp");
			rd.forward(req, res);
		}
		else {
			req.setAttribute("msg", "Registration failed..<br>");
			req.getRequestDispatcher("Msg.jsp").forward(req, res);
		}
	}
}
