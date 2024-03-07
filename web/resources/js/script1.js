
function login(data) {
    var us = document.getElementById('usuarioLogin').value; // Agregué .value para obtener el valor del campo
    var ps = document.getElementById('contraLogin').value;
    var url = "ServletLogin?accion="+data+"&user="+us+"&ps="+ps; 
//    var url = "http://192.168.137.56:8081/DON_GALLETO/api/venta/login";

//    var url = "http://192.168.137.5:8089/DonGalletoProyect/ServletUsuarios?accion="+data+"&usuario="+us+"&contra="+ps;
    $.ajax({
        type: "POST",
        url: url,
//        headers:'Content-Type':'application/x-www-form-urlencode:charset=UTF-8',
        success: function (response) {
            console.log("Mensaje del servlet:", response);
            
            $.getJSON('resources/json/errors.json', function(localErrors) {
            // Comparar los campos
           if(JSON.stringify(localErrors).includes(response)){  
                    // Los mensajes de error coinciden
                    alert(localErrors[response].mensaje);
                } else {
                    // Manejar otros casos o no hacer nada
                    sessionStorage.setItem('usuario', us);
                    // Redirigir a la URL deseada
                    window.location.href = 'index.jsp';
                }
            
        });
         
        },
        error: function (xhr, status, error) {
            // Manejar errores
            console.error("Error:", error);
        }
    });
}