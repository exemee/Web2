package exemee.servlets;

import exemee.models.Query;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@WebServlet("/controller")
public class ControllerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext servletContext = getServletContext();
        List<Query> queries = servletContext.getAttribute("queries") == null ? Collections.synchronizedList(new ArrayList<Query>()) :
                Collections.synchronizedList((List<Query>) servletContext.getAttribute("queries"));
        if (request.getParameter("x") != null && request.getParameter("y") != null && request.getParameter("r") != null) {
            String xValue = request.getParameter("x").replace(',', '.');
            if (xValue.length() > 6) {
                xValue = xValue.substring(0, 6);
            }
            double x = Double.parseDouble(xValue);
            double y = Double.parseDouble(request.getParameter("y"));
            double r = Double.parseDouble(request.getParameter("r"));

            request.setAttribute("query", new Query(x,y,r));

            getServletContext().getRequestDispatcher("/check_area").forward(request, response);
        } else {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}
