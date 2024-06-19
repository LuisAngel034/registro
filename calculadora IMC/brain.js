function calcular(operacion) {
    var val1 = parseFloat(document.getElementById("v1").value);
    var val2 = parseFloat(document.getElementById("v2").value);
    var resultado = document.getElementById("res");

    if (isNaN(val1) || isNaN(val2)) {
        resultado.innerHTML = "Datos nulos o incorrectos";
        if (isNaN(val1)) {
            document.getElementById("v1").focus();
        } else {
            document.getElementById("v2").focus();
        }
        return;
    }

    switch (operacion) {
        case 'suma':
            resultado.innerHTML = val1 + val2;
            break;
        case 'resta':
            resultado.innerHTML = val1 - val2;
            break;
        case 'multiplicacion':
            resultado.innerHTML = val1 * val2;
            break;
        case 'division':
            if (val2 === 0) {
                resultado.innerHTML = "No se puede dividir entre cero";
            } else {
                resultado.innerHTML = val1 / val2;
            }
            break;
        default:
            resultado.innerHTML = "Operación no válida";
    }

}