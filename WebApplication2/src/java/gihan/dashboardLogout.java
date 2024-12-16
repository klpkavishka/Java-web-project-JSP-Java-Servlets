package gihan;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author gihan
 */
public class dashboardLogout extends HttpServlet {

   private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Invalidate the current session
        HttpSession session = request.getSession(false); // Get the current session, do not create a new one
        if (session != null) {
            session.invalidate(); // Invalidate the session
        }
        // Redirect to the login page
        response.sendRedirect("admin_login.jsp");
    }
}