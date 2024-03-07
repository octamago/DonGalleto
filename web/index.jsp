<%-- 
    Document   : index
    Created on : 16 sep. 2023, 23:39:32
    Author     : Jessica Delgado
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap CSS -->
        <link href='https://fonts.googleapis.com/css?family=Open Sans' rel='stylesheet'>    

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>




        <link rel="stylesheet" type="text/css" href="resources/css/estilosIndex.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <title>DonGalleto</title>
    </head>
    <body id="contenedorIndex">  
        <nav class="navbar navbar-light bg-light">
            <div class="containerNav">
                <a class="navbar-brand" href="#">
                    <img src="resources/img/logoPequeñoDonGalleto.png" alt="" height="60" style="margin-left: 10%;">

                </a>
            </div>
        </nav>

        <div class="container" id="menuPrincipal">
            <div class="row">
                <div class="col">
                    <img src="resources/img/logoDonGalleto.png" style="margin-top: 10%;">
                </div>
                <div class="col" style="margin-top: 10%;">
                    <button class="btn btn-light" id="btnIndex" onclick="window.location.href = 'Ventas.jsp';">VENDER</button>
                    <button class="btn btn-light" id="btnIndex" onclick="window.location.href = 'inventario.jsp';">INVENTARIO</button>
                    <button class="btn btn-light" id="btnIndex" onclick="window.location.href = 'Ganancias.jsp';">GANANCIAS</button>
                    <button class="btn btn-light" id="btnIndex" onclick="window.location.href = 'Produccion.jsp';">PRODUCCIÓN</button>
                </div>
                <div class="col">

                </div>
            </div>

        </div>   



        <script>
            var usuario = sessionStorage.getItem('usuario');
            var inactividadTimeout;
            var tiempoInactividad = 60 * 1000; // 1 minuto en milisegundos
            var redireccionURL = 'login_.jsp'; // Cambiar a la página de inicio de sesión
            var segundosTranscurridos = 0;
            if (!usuario) {
            window.location.href = redireccionURL;
            }

            function reiniciarTemporizador() {
            
            inactividadTimeout = setTimeout(function () {
            sessionStorage.removeItem('usuario');
            window.location.href = redireccionURL;
            }, tiempoInactividad);
            }

            // Detectar actividad del mouse y reiniciar el temporizador
            document.addEventListener('mousemove', function () {
            reiniciarTemporizador();
            segundosTranscurridos = 0; // Reiniciar el contador al mover el mouse
            });
            document.addEventListener('keydown', function () {
            reiniciarTemporizador();
            segundosTranscurridos = 0; // Reiniciar el contador al mover el mouse
            }); // Puedes agregar más eventos según necesites


            // Llamada inicial para empezar el temporizador
            reiniciarTemporizador();
            // También puedes usar setInterval para verificar la inactividad cada cierto tiempo
            var verificadorInactividad = setInterval(function () {
            if (!usuario) {
            clearInterval(verificadorInactividad);
            } else {
            reiniciarTemporizador();
            
            }
            }, tiempoInactividad );
            
            var tempo = setInterval(function () {
            segundosTranscurridos++;
            console.log(segundosTranscurridos + ' segundos transcurridos');
            }, 1000 );
        </script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


    </body>
</html>
