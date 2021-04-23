<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Web1</title>
    <link rel="stylesheet" href="css/Main.css">

</head>
<body>
<table>
    <tr>
        <jsp:include page="header.jsp"/>
        <div class="graphics" style="text-align: center">
            <jsp:include page="graphics.jsp"/>
        </div>
        <td>
            <div class="main">
                <form method="get" action="controller" id="valueForm">
                    <div class="xRect">
                        <div style="text-align: center">X</div>
                        <input autocomplete="off" autofocus required
                               class="input" id="x" onchange="checkXData()" onkeyup="checkXData()" maxlength="6"
                               name="x" placeholder="Введите число от -5 до 5" style="border: 2px solid #d0d1c7;"
                               title="Введите число" type="text">
                    </div>
                    <div id="yplace">
                        <span style="text-align: center;">Y</span>
                    </div>
                    <div class="yRect">
                        <label>-2
                            <input type="radio" name="y" value="-2">
                        </label>
                        <label>-1.5
                            <input type="radio" name="y" value="-1.5">
                        </label>
                        <label>-1
                            <input type="radio" name="y" value="-1">
                        </label>
                        <label>-0.5
                            <input type="radio" name="y" value="-0.5">
                        </label>
                        <label>0
                            <input type="radio" name="y" value="0">
                        </label>
                        <label>0.5
                            <input type="radio" name="y" value="0.5">
                        </label>
                        <label>1
                            <input type="radio" name="y" value="1">
                        </label>
                        <label>1.5
                            <input type="radio" name="y" value="1.5">
                        </label>
                        <label>2
                            <input type="radio" name="y" value="2">
                        </label>
                    </div>

                    <div class="rRect" id="rField">
                        <div style="text-align: center;">
                            <span>R: </span><span id="rValue">2</span>
                        </div>

                        <input autocomplete="off" id="rEndValue" name="r" type="hidden" value=2>
                        <table id="tableButton">
                            <tr>
                                <td>
                                    <button class="buttonNumber" id="1" name="r"
                                            onclick="document.getElementById('rValue').innerText = '1'; document.getElementById('rEndValue').value = 1"
                                            type="button">1
                                    </button>
                                </td>
                                <td>
                                    <button class="buttonNumber" id="1.5" name="r"
                                            onclick="document.getElementById('rValue').innerText = '1.5'; document.getElementById('rEndValue').value = 1.5"
                                            type="button">1.5
                                    </button>
                                </td>
                                <td>
                                    <button class="buttonNumber" id="2" name="r"
                                            onclick="document.getElementById('rValue').innerText = '2'; document.getElementById('rEndValue').value = 2"
                                            type="button">2
                                    </button>
                                </td>
                                <td>
                                    <button class="buttonNumber" id="2.5" name="r"
                                            onclick="document.getElementById('rValue').innerText = '2.5'; document.getElementById('rEndValue').value = 2.5"
                                            type="button">2.5
                                    </button>
                                <td>
                                    <button class="buttonNumber" id="3" name="r"
                                            onclick="document.getElementById('rValue').innerText = '3'; document.getElementById('rEndValue').value = 3"
                                            type="button">3
                                    </button>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <button onclick="onSubmitClick()" class="checkButton" type="submit"> Проверить</button>
                </form>
            </div>
        </td>
    </tr>
</table>

<script src="js/jquery.js"></script>
<script src="js/validate.js"></script>
<script src="js/graphics.js"></script>
<script src="js/Script.js"></script>
</body>
</html>