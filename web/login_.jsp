<%-- 
    Document   : login_
    Created on : 21/02/2024, 03:41:12 PM
    Author     : octam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Don Galleto</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <script src="resources/js/script1.js"></script>
        
    </head>

    <body>

        <!-- Barra de Navegación-->
        <nav class="navbar navbar-expand-lg navbar-light bg-warning">
            <a class="navbar-brand" href="index.jsp">Registrarse</a>
        </nav>
 
        <div class="container mt-4">
            <div class="card mx-auto" style="width: 50%;">
                <div class="card-body">
                    <form onsubmit="login('acceder'); return false;">
                        <h1 style="text-align: center;">Inicio de sesión</h1>
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="bi bi-person-circle"></i>
                                    </div>
                                </div>
                                <input type="text" id="usuarioLogin" placeholder="Usuario" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="bi bi-key-fill"></i>
                                    </div>
                                </div>
                                <input type="password" id="contraLogin" placeholder="Contraseña" class="form-control">
                            </div>
                        </div>



                        <div class="form-group" style="text-align: center;">
                            <button id="btnFormularioRegistro" class="btn btn-info" type="submit">Iniciar Sesión</button>
                            <button id="btnFormularioCancel" class="btn btn-danger" >Cancelar</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>

        <!-- Bootstrap y otros scripts -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
                integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
                integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <script>
                                        $(document).ready(function () {
                                            // Tu código JavaScript aquí
                                        });
        </script>

    </body>

</html>
