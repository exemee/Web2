<%@ page contentType="text/html;charset=UTF-8"%>
<div class="graphics">
    <svg xmlns="http://www.w3.org/2000/svg" width="300" height="300">

        <line x1="0" y1="150" x2="300" y2="150" stroke="#000"></line>
        <line x1="150" y1="0" x2="150" y2="300" stroke="#000"></line>
        <polygon points="300,150 295,145 295,155" fill="#000" stroke="#000"></polygon>
        <polygon points="150,0 145,5 155,5" fill="#000" stroke="#000"></polygon>
        <line x1="270" y1="155" x2="270" y2="145" stroke="#000"></line>
        <text x="265" y="140" class="axis-text">R</text>
        <line x1="210" y1="155" x2="210" y2="145" stroke="#000"></line>
        <text x="200" y="140" class="axis-text">R/2</text>
        <line x1="90" y1="155" x2="90" y2="145" stroke="#000"></line>
        <text x="75" y="140" class="axis-text">-R/2</text>
        <line x1="30" y1="155" x2="30" y2="145" stroke="#000"></line>
        <text x="23" y="140" class="axis-text">-R</text>
        <line x1="145" y1="30" x2="155" y2="30" stroke="#000"></line>
        <text x="157" y="35" class="axis-text">R</text>
        <line x1="145" y1="90" x2="155" y2="90" stroke="#000"></line>
        <text x="157" y="95" class="axis-text">R/2</text>
        <line x1="145" y1="210" x2="155" y2="210" stroke="#000"></line>
        <text x="157" y="215" class="axis-text">-R/2</text>
        <line x1="145" y1="270" x2="155" y2="270" stroke="#000"></line>
        <text x="157" y="275" class="axis-text">-R</text>

        <polygon points="210,150 150,90 150,150" fill="#00f" stroke="#003" fill-opacity="0.5"></polygon>
        <rect height="60" width="120" x="30" y="150" fill-opacity="0.5" fill="#a0f" stroke="#003"></rect>
        <path fill="chocolate" stroke="#003" d="M 150,270 L 150,150 L 270,150 A 120,120 90 0 1 150,270"
              fill-opacity="0.5"></path>

        <%--<defs>
            <clipPath id="left-fourth">
                <rect x="0" y="0" width="150" height="150"/>
            </clipPath>
            <clipPath id="top-diagonal">
                <polygon points="80,150,150,220,150,150"/>
            </clipPath>
        </defs>--%>
    </svg>
</div>