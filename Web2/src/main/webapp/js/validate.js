const X_MAX_VALUE = 5;
const X_MIN_VALUE = -5;

const R_ELEMENT = $('input[name="r"]');
const X_ELEMENT = $('input[name="x"]');

function onSubmitClick(e) {
    e.preventDefault();
    if (checkX() && checkY() && checkR()) {
        let x = parseFloat(getXValue());
        let y = parseFloat(getYValue());
        let r = parseFloat(getRValue());

        // ajax submit
        $.ajax({
            type: "GET",
            url: "controller",
            data: {
                "x": x,
                "y": y,
                "r": r,
                "fromClick": 0
            },
            success: function () {
                document.location.reload();
            }
        });
    }
}

function checkInput(min, max, element) {
    let text = element.val().replace(",", ".");
    element.val(text);
    let val = parseFloat(text);
    if (/^(-?\d+)(\.\d+)?$/.test(text) && val >= min && val <= max) {
        $(element).css("border-color", "green");
        return true;
    } else {
        $(element).css("border-color", "red");
        return false;
    }
}

function checkY() {
    if ($('input[name="y"]').is(':checked').val() === undefined) {
        return false;
    } else {
        return true;
    }
}

function checkR() {
    return $('#rEndValue').val() !== undefined;
}

function checkX() {
    if (!checkInput(X_MIN_VALUE, X_MAX_VALUE, X_ELEMENT)) {
        return false;
    }
    return true;

}
