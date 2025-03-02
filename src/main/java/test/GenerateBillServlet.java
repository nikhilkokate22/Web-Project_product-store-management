package test;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/billgenerator")
public class GenerateBillServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("cbean") == null) {
            response.sendRedirect("CustomerLogin.html"); // Redirect if session expired
            return;
        }

        CustomerBean cb = (CustomerBean) session.getAttribute("cbean");
        String productCode = request.getParameter("pcode");
        int requestedQty = Integer.parseInt(request.getParameter("pqty"));
             System.out.println("product code : "+productCode+" : "+requestedQty);
        // Fetch product details using DAO
        ProductBean pb = GenerateBillDAO.getProductDetails(productCode);
        if (pb == null) {
            out.println("<h3>Product not found! Please try again.</h3>");
            return;
        }

        // Check stock availability
        if (requestedQty > pb.getQty()) {
            out.println("<h3>Insufficient stock! Available quantity: " + pb.getQty() + "</h3>");
            out.println("<a href='viewProducts.jsp'>Go Back</a>");
            return;
        }

        float totalAmount = requestedQty * pb.getPrice();
        System.out.println("TotalAmount : "+totalAmount+"\nreqQty : "+requestedQty+"\ngetPrice : "+pb.getPrice());

        // Update stock and insert order
        boolean stockUpdated = GenerateBillDAO.updateStock(productCode, requestedQty);
        boolean orderInserted = GenerateBillDAO.insertOrder(cb.getCustNm(), productCode, pb.getName(), requestedQty, totalAmount);

        if (stockUpdated && orderInserted) {
            response.sendRedirect("paymentSuccess.jsp?customer=" + cb.getCustNm() + "&amount=" + totalAmount);
        } else {
            out.println("<h3>Error processing request. Please try again later.</h3>");
        }
    }
}
