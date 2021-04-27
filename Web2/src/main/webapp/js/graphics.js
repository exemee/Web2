const CANVAS_WIDTH = 300;
const CANVAS_HEIGHT = 300;
const CANVAS_R_VALUE = 120;
const DEFAULT_R_VALUE = 2;
const plot = $(".graphics svg");


function fromRToSvgX(x, r) {
    return x / r * CANVAS_R_VALUE + CANVAS_WIDTH / 2;
}

function fromRToSvgY(y, r) {
    return CANVAS_HEIGHT / 2 - y / r * CANVAS_R_VALUE;
}

function fromSvgToRX(x, r) {
    return r * (x - CANVAS_WIDTH / 2) / CANVAS_R_VALUE;
}

function fromSvgToRY(y, r) {
    return r * (CANVAS_HEIGHT / 2 - y) / CANVAS_R_VALUE;
}


function getRValue() {

    const rText = $('#rEndValue').val();
    let rValue = parseFloat(rText);

    if (rText === undefined) {
        rValue = parseFloat($(".queries").last().find(">:nth-child(3)").text());
        if (isNaN(rValue)) {
            rValue = DEFAULT_R_VALUE;
        }
    } else {
        if (!checkR()) {
            return null;
        }
    }
    return rValue;
}

function getYValue() {
    return $('input[name ="y"]').val();
}

function getXValue() {
    const xText = $('input[name="x"]').val();
    let xValue = parseFloat(xText);
    return xValue;
}

function getUrlContext() {
    const link = document.location.href.split('/');
    return link[4];
}

function clickPlotHandler(e) {
    const offset = $(this).offset();
    const x = e.pageX - offset.left;
    const y = e.pageY - offset.top;
    const rValue = getRValue();

    if (rValue !== null) {
        const xValue = fromSvgToRX(x, rValue);
        const yValue = fromSvgToRY(y, rValue);

        $.ajax({
            type: "GET",
            url: "controller",
            data: {
                "x": xValue,
                "y": yValue,
                "r": rValue
            },
            success: function () {
                console.log("dasdas");
                console.log(getUrlContext());
                if (!getUrlContext().startsWith("controller?")) {
                    document.location.href = "controller?x=" + xValue + "&y=" + yValue + "&r=" + rValue;
                } else {
                    // /*x=" + xValue + "&y=" + yValue + "&r=" + rValue + */
                    document.location.href = "controller?&fromClick=1";
                    //document.location.reload();
                }
            }
        })
    }
}


function drawPointsFromTableData() {
    $(".queries").each(function () {
        const query = $(this);
        const x = parseFloat(query.find(">:first-child").text());
        const y = parseFloat(query.find(">:nth-child(2)").text());
        const r = parseFloat(query.find(">:nth-child(3)").text());

        const color = query.find(">:nth-child(6) span").css("color");

        const existingContent = plot.html();
        const contentToInsert = `<circle r="4" cx="${fromRToSvgX(x, r)}" cy="${fromRToSvgY(y, r)}" fill="${color}"></circle>`;
        plot.html(existingContent + contentToInsert);
    });
}

plot.click(clickPlotHandler);
drawPointsFromTableData();