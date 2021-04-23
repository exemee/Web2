package exemee.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/controller")
public class ControllerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("x") != null && request.getParameter("y") != null && request.getParameter("r") != null) {
            getServletContext().getRequestDispatcher("/check_area").forward(request, response);
        } else {
            request.setAttribute("title", "Error:<br>invalid data");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        
    }
}
