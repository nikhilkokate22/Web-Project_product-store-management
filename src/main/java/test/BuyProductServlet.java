package test;

import java.io.*;
import java.util.ArrayList;
import java.util.Iterator;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@SuppressWarnings("serial")
@WebServlet("/buy")
public class BuyProductServlet extends HttpServlet{
	@SuppressWarnings("unchecked")
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{
		HttpSession hs = req.getSession(false);
		
		if(hs==null){
			req.setAttribute("msg", "Product not available..<br>");
			req.getRequestDispatcher("Msg.jsp").forward(req, res);
		}
		else {
			ArrayList<ProductBean> al = (ArrayList<ProductBean>)hs.getAttribute("alist1");
			String pC =req.getParameter("pcode");
			Iterator<ProductBean> it  = al.iterator();
			while(it.hasNext()) {
				ProductBean pb = (ProductBean)it.next();
				
				if (pC != null && pC.equals(pb.getCode())) {
					hs.setAttribute("aaaa", pb);
					req.getRequestDispatcher("BuyProduct.jsp").forward(req, res);
					break;
				}
			}
			
		}
	}
}
