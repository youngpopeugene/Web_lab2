let x;
let y;
let r;

function validateValues(){
    let radioButtons = document.querySelectorAll('input[name="value_X"]');
    for (const radioButton of radioButtons) {
        if (radioButton.checked) {
            x = radioButton.value;
            break;
        }
    }
    y = document.querySelector('input[name="value_Y"]').value;
    r = document.querySelector('option[name="value_R"]:checked').value;
    if ($.isNumeric(x) && $.isNumeric(y) && $.isNumeric(r) && y>(-1*5) && y<5){
        return true;
    }else{
        document.querySelector('.message').textContent = " ERROR!";
    }
    return false;
}

function formHandler(event){
    event.preventDefault();
    if (validateValues()){
        sendData();
    }
}

function sendData(){
    let data = "r=" + encodeURIComponent(r) + "&x=" + encodeURIComponent(x) + "&y=" + encodeURIComponent(y);
    let xhr = new XMLHttpRequest();
    xhr.open("GET", "/hello-servlet", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.send(data);
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4) {
            if (xhr.status == 200) {
                console.log(x, y, r);
                let response = xhr.response;
                console.log(response);
            }
        }
    }
}