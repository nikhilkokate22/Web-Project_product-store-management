package test;
import java.io.*;
import java.util.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@SuppressWarnings("serial")
@WebServlet("/view2")
public class ViewAllProductServletCust extends HttpServlet{
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		HttpSession hs = req.getSession(false);
		if(hs==null) {
			req.setAttribute("msg", "Products are not Available..<br>");
			req.getRequestDispatcher("Msg.jsp").forward(req, res);
		}
		else {
			ArrayList<ProductBean> al = new ViewAllProductsDAO().retrieve();
			hs.setAttribute("alist1", al);
			req.getRequestDispatcher("ViewAllProductsCust.jsp").forward(req, res);
		}
	}
}