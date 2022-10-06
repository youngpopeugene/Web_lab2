let x;
let y;
let r;

function formHandler(event){
    event.preventDefault();
    if (validateValues()){
        sendData();
    }
}

function validateValues(){
    let radioButtons = document.querySelectorAll('input[name="value_X"]');
    for (const radioButton of radioButtons) {
        if (radioButton.checked) {
            x = radioButton.value;
            break;
        }
    }
    y = document.querySelector('input[name="value_Y"]').value.replace(",", ".");
    r = document.querySelector('option[name="value_R"]:checked').value;
    if ($.isNumeric(x) && $.isNumeric(y) && $.isNumeric(r) && y>(-1*5) && y<5){
        document.querySelector('.message').textContent = "";
        return true;
    }else document.querySelector('.message').textContent = " ERROR!";
    return false;
}

function sendData(){
    let data = "r=" + encodeURIComponent(r) + "&x=" + encodeURIComponent(x) + "&y=" + encodeURIComponent(y);
    let xhr = new XMLHttpRequest();
    xhr.open("GET", "/Web_lab2_Web_exploded/controller?" + data, true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.send();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                let table = document.querySelector('#result_table').getElementsByTagName('tbody')[0];
                let newRow = table.insertRow(table.rows.length-1);
                newRow.className = "results";
                if (x == parseInt(x)) newRow.insertCell().outerHTML = "<th>" + parseInt(x) + ".0" + "</th>";
                else newRow.insertCell().outerHTML = "<th>" + x + "</th>";
                if (y == parseInt(y)) newRow.insertCell().outerHTML = "<th>"+ parseInt(y)  + ".0" + "</th>";
                else newRow.insertCell().outerHTML = "<th>"+ y +"</th>";
                if (r == parseInt(r))  newRow.insertCell().outerHTML = "<th>" + parseInt(r)  + ".0" + "</th>";
                else newRow.insertCell().outerHTML = "<th>"+ r +"</th>";
                console.log(xhr.response);
                if (xhr.response.trim() == "true") newRow.insertCell().outerHTML = "<th style = 'color: green'>" + xhr.response.toUpperCase() +"</th>";
                else newRow.insertCell().outerHTML = "<th style = 'color: red'>" + xhr.response.toUpperCase() +"</th>";


                // $('#circle').after($('<circle>', {
                //     cx: (150 + 100 * x/r).valueOf(),
                //     cy: (150 - 100 * y/r).valueOf(),
                //     r: "3",
                //     fill: "red",
                // }));

                // // $("#circle").attr("cx",150 + 100 * x/r );
                // // $("#circle").attr("cy",150 - 100 * y/r );
                // var d1 = document.getElementById('circle');
                // d1.insertAdjacentHTML('afterend',
                //     '<circle cx = {cx} cy = {cy} r="3" fill="red" stroke-width="0" />');
            }
        }
    }
}

function cleanTable(){
    let data2 = "clean_status=true";
    let xhr2 = new XMLHttpRequest();
    xhr2.open("GET", "/Web_lab2_Web_exploded/controller?" + data2, true);
    xhr2.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr2.send();
    xhr2.onreadystatechange = function () {
        if (xhr2.readyState === 4) {
            if (xhr2.status === 200) {
                window.location.reload();
            }
        }
    }
}

function watcher(event){
    const svg = document.querySelector('svg');
    const rect = svg.getBoundingClientRect();
    r = document.querySelector('option[name="value_R"]:checked').value;
    x = ((event.clientX-rect.left - 150)*(r/2)/50).toPrecision(2);
    y = (((-1)*(event.clientY - rect.top - 150))*(r/2)/50).toPrecision(2);
    sendData(x, y, r);

}


