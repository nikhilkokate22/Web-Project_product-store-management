package test;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@SuppressWarnings("serial")
@WebServlet("/viewProfile")
public class ViewCustProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("cbean") == null) {
            res.sendRedirect("CustomerLogin.html"); // Redirect if session expired
        } else {
            RequestDispatcher rd = req.getRequestDispatcher("ViewProfile.jsp");
            rd.forward(req, res);
        }
    }
}
