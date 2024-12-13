package gihan;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class CancelServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().write("Payment was canceled.");
    }
}