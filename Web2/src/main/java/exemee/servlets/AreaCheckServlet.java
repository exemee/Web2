package exemee.servlets;

import exemee.models.Query;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@WebServlet("/check_area")
public class AreaCheckServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ServletContext servletContext = getServletContext();
            List<Query> queries = servletContext.getAttribute("queries") == null ? new ArrayList<Query>() : (List<Query>) servletContext.getAttribute("queries");
            long startTime = System.nanoTime();
            String currentTime = new Date().toString();
            String xValue = request.getParameter("x").replace(',', '.');
            if (xValue.length() > 6) {
                xValue = xValue.substring(0, 6);
            }
            double x = Double.parseDouble(xValue);
            double y = Double.parseDouble(request.getParameter("y"));
            double r = Double.parseDouble(request.getParameter("r"));
            String fromClick = request.getParameter("fromClick");
            if(fromClick == null){
                fromClick = "";
            }
            if (checkValues(x, y, r) || fromClick.equals("1")) {
                String result = checkArea(x, y, r) ? "<span style='color: #439400'>Попал</span>" : "<span style='color: #94002D'>Не попал</span>";
                long endTime = System.nanoTime();
                String time = (endTime - startTime) / 1000000 + "." + (endTime - startTime) % 1000000;
                Query query = new Query(x, y, r, currentTime, time, result);
                queries.add(query);
                servletContext.setAttribute("queries", queries);
            }
            //request.getRequestDispatcher("table.jsp").forward(request, response);
            response.sendRedirect(request.getContextPath() + "/table.jsp");
        } catch (NumberFormatException e) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    private boolean checkArea(double x, double y, double r) {
        return ((x >= 0 && y <= 0 && x * x + y * y <= r * r ) ||
                ( x >= 0 && y >= 0 && y <= -x + r/2) ||
                (x <= 0 && y <= 0 && x >= -r && y >= -r/2));
    }

    private boolean checkValues(double x, double y, double r) {
        return (x > -5 && x < 5) &&
                Arrays.asList(-2.0, -1.5, -1.0, -0.5, 0, 0.5, 1.0, 1.5, 2.0).contains(y) &&
                Arrays.asList(1.0, 1.5, 2.0, 2.5, 3.0).contains(r);
    }
}
