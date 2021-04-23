<%@ page import="exemee.models.Query" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%List<Query> queries = (List<Query>) application.getAttribute("queries");%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Web1</title>
    <link rel="stylesheet" href="css/Table.css">
</head>
<body>
<section>

    <table style="width: 100%; height: 100%;">
        <tr>
            <td>
                <main class="contentRect animated zoomIn">
                    <a class='photo cross' href='index.jsp'></a>
                    <div class="tableHead" id="table" >
                        <table id="dataTable" style="text-align: center;" class="hide" width="100%">
                            <tr>
                                <th>X</th>
                                <th>Y</th>
                                <th>R</th>
                                <th>Время запуска</th>
                                <th>Время работы</th>
                                <th>Результат</th>
                            </tr>
                            <%
                                if (queries != null)
                                    for (Query query : queries) {
                            %>
                            <tr class="queries">
                                <td class="x_cell"><%= query.getX() %>
                                </td>
                                <td class="y_cell"><%= query.getY() %>

                                </td>
                                <td class="r_cell"><%= query.getR() %>
                                </td>
                                <td><%= query.getCurrentTime() %>
                                </td>
                                <td><%= query.getTime() %>
                                </td>
                                <td><%= query.getResult() %>
                                </td>
                            </tr>
                            <%}%>
                        </table>
                    </div>
                    <button onclick="backToIndex()" class="checkButton">Back</button>
                </main>
            </td>
        </tr>
    </table>
    <jsp:include page="graphics.jsp"/>
</section>
<script src="js/jquery.js"></script>
<script src="js/Script.js"></script>
<script src="js/graphics.js"></script>
</body>
</html>
