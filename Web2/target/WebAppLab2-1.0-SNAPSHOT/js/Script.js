function checkXData() {
    let x = document.getElementById("x").value.replace(",", ".")

    if (x === "-" || x === "0") {
        return;
    }
    if (parseInt(x)) {
        if (x >= -5 && x <= 5) {
            document.getElementById("x").setAttribute("style", "border: 2px solid green;")
        } else {
            document.getElementById("x").setAttribute("style", "border: 2px solid red;")
            document.getElementById("x").value = "";
        }
    } else {
        document.getElementById("x").setAttribute("style", "border: 2px solid red;")
        document.getElementById("x").value = "";
    }
}
function backToIndex(){
    document.location.href="index.jsp";
}