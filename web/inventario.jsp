<%-- 
    Document   : inventario
    Created on : 5/12/2023, 10:01:55 AM
    Author     : octam
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<script src="resources/js/index.js"></script>-->
        <link rel="stylesheet" type="text/css" href="resources/css/estilosIndex.css">

        <script src="resources/js/Ventas.js"></script>
        <title>Ventas</title>

        <!-- Fuentes -->
        <link href='https://fonts.googleapis.com/css?family=Open Sans' rel='stylesheet'>    
        <!-- Bootstrap CSS -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css">
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <style>
            /* Estilos para los formularios */
            #contenedor {
                font-family: 'Poppins', sans-serif;
                font-weight: 300;
                font-size: 15px;
                line-height: 1.7;
                color: #c4c3ca;
                background-color: #f2994a;
                overflow-x: hidden;
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;
                margin: 0;
            }

            #contenedorForms {
                display: flex;
                justify-content: space-between; /* Espacio entre los formularios */
                max-width: 100%; /* Ajusta según tus necesidades */

            }

            form {
                background-color: rgb(135, 135, 135,0.5);
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
                width: 400px; /* Espacio para ambos formularios */
                height:  550px; /* Espacio para ambos formularios */
                text-align: center; /* Centrar el contenido dentro del formulario */
                margin: 20px;
            }

            #formAgregarProducto {
                display: none;
            }

            label {
                color: #fff;
                margin-bottom: 5px;
                display: block; /* Alinear las etiquetas una debajo de la otra */
            }

            select, input {
                width: 100%;
                padding: 10px;
                margin-bottom: 15px;
                border: none;
                border-bottom: 2px solid #000;
                background-color: #666; /* Color grisáceo */
                color: #fff;
                outline: none;
            }

            input::placeholder {
                color: #ccc;
            }

            button {
                border-radius: 5px; /* Bordes redondeados */
                cursor: pointer;
                transition: background-color 0.3s;
                padding: 10px;
                width: 100%;
                outline: none;
            }
            .close-button {
                background-color: #e74c3c;
                color: white;
                border: none;
                width: 40px;
                height: 40px;
                border-radius: 50%;
                display: block;

            }

            .close-button:hover {
                background-color: #c0392b;
            }
            /* Estilo para el botón azul */
            button.blue {
                 background-color: #000000;
                color: white;
                border: none;
            }
            button.blue2 {
                 background-color: #000000;
                color: white;
                border: none;
            }

            /* Estilo para el botón rojo */
            button.red {
                 background-color: #000000;
                color: white;
                border: none;
            }

            button:hover {
                 background-color: #878787; /* Blanco al pasar el ratón por encima */
                color: #fffffff;
            }
        </style>
    </head>
    <body id="contenedorIndex"> 
        <nav class="navbar navbar-light bg-light">
            <div class="containerNav">
                <a class="navbar-brand" href="index.jsp">
                    <img src="resources/img/logoPequeñoDonGalleto.png" alt="" height="60" style="margin-left: 10%;">
                    <span>Modificar Inventario</span>
                </a>
            </div>
        </nav>
        <div id="contenedor">


            <div id="contenedorForms">
                <form id="formInventario" method="post">
                    <h2>Seleccionar Inventario</h2>
                    <label for="selectInventario">Seleccionar Producto:</label>
                    <select id="selectInventario" name="productoId" style="width: 300px;" onchange="cargarDatosProducto()">
                        <option value="">Seleccione agun producto</option>
                        <%
                            Connection conexion = null;

                            try {
                                // Establecer la conexión a la base de datos
                                String jdbcUrl = "jdbc:mysql://localhost:3306/donGalleto";
                                String usuario = "root";
                                String contrasena = "";

                                Class.forName("com.mysql.cj.jdbc.Driver");
                                conexion = DriverManager.getConnection(jdbcUrl, usuario, contrasena);

                                // Imprimir mensaje si hay conexión
                                System.out.println("Conexión exitosa a la base de datos");

                                // Realizar la consulta para obtener los productos del inventario
                                Statement stmt = conexion.createStatement();
                                ResultSet rs = stmt.executeQuery("SELECT id, nombre FROM materia_prima");

                                // Crear las opciones del select
                                while (rs.next()) {
                                    out.println("<option value='" + rs.getInt("id") + "'>" + rs.getString("nombre") + "</option>");
                                }

                                // Cerrar las conexiones
                                rs.close();
                                stmt.close();
                                conexion.close();
                            } catch (Exception e) {
                                // Imprimir mensaje si hay un error en la conexión
                                System.out.println("Error en la conexión a la base de datos: " + e.getMessage());

                                // Imprimir el error en la página web
                                out.println("Error: " + e.getMessage());
                            }
                        %>

                    </select>
                    <label for="nuevoNombre">Nuevo Nombre:</label>
                    <input type="text" id="nuevoNombre" name="nuevoNombre">

                    <label for="nuevaCantidad">Nueva Cantidad:</label>
                    <input type="number" id="nuevaCantidad" name="nuevaCantidad" min="1">

                    <label for="nuevoPrecio">Nuevo Precio:</label>
                    <input type="text" id="nuevoPrecio" name="nuevoPrecio">

                    <button class="blue" onclick="actualizarPrecio()">Actualizar Precio</button>
                    <br>
                    <br>
                    <!-- Botón para eliminar producto (rojo) -->
                    <button class="red" onclick="eliminarProducto()">Eliminar Producto</button>
                </form>
            </div>
           <button class="blue2" style="width:120px;" onclick="toggleAgregarProductoForm()">Agregar Producto</button>
           
           <button class="blue" style="width:120px;margin-left: 10px;" onclick="window.location.href='reporte_inventario.jsp';">Ir a Reporte de inventario</button>

            <form id="formAgregarProducto" method="post">
                <button class="close-button" onclick="toggleAgregarProductoForm()">X</button>
                <h2>Agregar producto</h2>

                <label for="nombre">Nombre del Producto:</label>
                <input type="text" id="nombre" name="nombre" required>

                <label for="cantidad">Cantidad:</label>
                <input type="number" id="cantidad" name="cantidad" min="1" required>
                
                <label for="unidadMedida">Unidad de Medida:</label>
                <select id="medida" name="medida">
                    <option value="kg">Kilogramos (kg)</option>
                    <option value="g">Gramos (g)</option>
                    <option value="l">Litros (l)</option>
                    <option value="ml">Mililitros (ml)</option>
                    <option value="unidad">Unidad (u)</option>
                    <option value="pieza">Piezas</option>
                    <option value="botella">Botellas</option>
                    <option value="metro">Metros</option>
                    <!-- Agrega más opciones según tus necesidades -->
                </select>

                <label for="precio">Costo:</label>
                <input type="text" id="precio" name="precio" required>
                <!-- Botón para agregar producto -->
                <button class="blue" onclick="agregarProducto()">Agregar Producto</button>

            </form>
        </div>
    </body>

    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.4.2/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.print.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

    <script>
                    //                            document.addEventListener("DOMContentLoaded", datosGalletas);
                    $(document).ready(function () {
                        $(document).ready(function () {
                            // Inicializar el elemento select con Select2
                            $('#selectInventario').select2();
                        });

                    });
                    function actualizarPrecio() {
                        event.preventDefault();

                        actualizar();


                    }
                    function actualizar() {
                        // Obtener los datos del formulario
                        var formData = $("#formInventario").serialize();

                        // Realizar la actualización del precio a través de AJAX
                        $.ajax({
                            type: "POST",
                            url: "ServletInventario",
                            data: formData,
                            success: function (response) {
                                // Mostrar SweetAlert2 en caso de éxito

                                Swal.fire({
                                    icon: 'success',
                                    title: 'Éxito',
                                    text: response
                                }).then((result) => {
                                    // Recargar la página solo si el usuario hace clic en "Aceptar" en la alerta
                                    if (result.isConfirmed || result.dismiss === Swal.DismissReason.backdrop) {
                                        window.location.reload();
                                    }
                                });
                                var formAgregarProducto = $("#formInventario");

                                // Alternar la visibilidad del formulario
                                formAgregarProducto.find("input[type=text], input[type=number]").val("");
                                // Recargar la página o realizar otras acciones después de la actualización del precio
                                // window.location.reload(); // Recargar la página
                            },
                            error: function (error) {
                                // Mostrar SweetAlert2 en caso de error
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Error',
                                    text: 'Ocurrió un error al procesar la solicitud.',
                                });
                            }
                        });
                    }


                    function agregarProducto() {
                        // Evitar el comportamiento predeterminado del formulario
                        event.preventDefault();

                        // Obtener los datos del formulario
                        var formData = $("#formAgregarProducto").serialize();

                        // Realizar la petición Ajax al servlet
                        $.ajax({
                            type: "POST",
                            url: "ServletInventario",
                            data: formData,
                            success: function (response) {

                                Swal.fire({
                                    icon: 'success',
                                    title: 'Éxito',
                                    text: response
                                }).then((result) => {
                                    // Recargar la página solo si el usuario hace clic en "Aceptar" en la alerta
                                    if (result.isConfirmed || result.dismiss === Swal.DismissReason.backdrop) {
                                        window.location.reload();
                                    }
                                });

                                // Recargar la página o realizar otras acciones después de agregar el producto
                                // window.location.reload(); // Recargar la página
                            },
                            error: function (error) {
                                // Mostrar SweetAlert2 en caso de error
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Error',
                                    text: 'Ocurrió un error al procesar la solicitud.',
                                });
                            }
                        });
                    }
                    function toggleAgregarProductoForm() {
                        // Obtener el formulario de agregar producto por su ID
                        var formAgregarProducto = $("#formAgregarProducto");

                        // Obtener el botón por su ID
                        var btnAgregarProducto = $(".blue2");

                        // Alternar la visibilidad del formulario
                        formAgregarProducto.toggle();

                        // Cambiar el texto del botón entre "Agregar Producto" y "X"
                        if (formAgregarProducto.is(":visible")) {
                            btnAgregarProducto.hide();
                        } else {
                            btnAgregarProducto.text("Agregar Producto");
                            btnAgregarProducto.show();
                        }

                        // Limpiar los campos del formulario cada vez que se muestre
                        if (formAgregarProducto.is(":visible")) {
                            formAgregarProducto.find("input[type=text], input[type=number]").val("");
                        }
                    }





                    function eliminarProducto() {
                        event.preventDefault();
                        // Obtener el ID del producto seleccionado
                        var productoId = $("#selectInventario").val();

                        // Verificar si se seleccionó un producto
                        if (productoId) {
                            // Confirmar si realmente deseas eliminar el producto
                            Swal.fire({
                                title: '¿Estás seguro?',
                                text: 'Esta acción eliminará el producto. ¿Quieres continuar?',
                                icon: 'warning',
                                showCancelButton: true,
                                confirmButtonColor: '#3085d6',
                                cancelButtonColor: '#d33',
                                confirmButtonText: 'Sí, eliminar'
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    // Realizar la eliminación a través de AJAX
                                    $.ajax({
                                        type: "POST",
                                        url: "ServletInventario",
                                        data: {eliminarProductoId: productoId},
                                        success: function (response) {
                                            // Manejar la respuesta (puedes mostrar un mensaje de éxito, actualizar la interfaz, etc.)
                                            console.log(response);
                                            Swal.fire({
                                                icon: 'success',
                                                title: 'Eliminado!',
                                                text: 'El producto ha sido eliminado.',
                                            }).then((result) => {
                                                // Recargar la página solo si el usuario hace clic en "Aceptar" en la alerta
                                                if (result.isConfirmed || result.dismiss === Swal.DismissReason.backdrop) {
                                                    window.location.reload();
                                                }
                                            });

                                            // Puedes recargar la página o realizar otras acciones después de eliminar el producto
                                            // window.location.reload(); // Recargar la página
                                        },
                                        error: function (error) {
                                            // Manejar el error
                                            console.error(error);
                                            Swal.fire(
                                                    'Error',
                                                    'Hubo un error al eliminar el producto.',
                                                    'error'
                                                    );
                                        }
                                    });
                                }
                            });
                        } else {
                            // Mostrar un mensaje si no se ha seleccionado un producto
                            Swal.fire(
                                    'Advertencia',
                                    'Por favor, selecciona un producto para eliminar.',
                                    'warning'
                                    );
                        }
                    }



                    function cargarDatosProducto() {
                        // Obtener el ID del producto seleccionado
                        var productoId = $("#selectInventario").val();

                        // Verificar si se seleccionó un producto
                        if (productoId) {
                            // Realizar la solicitud AJAX para obtener detalles del producto
                            $.ajax({
                                type: "POST",
                                url: "ServletInventario", // Asegúrate de tener una URL adecuada para esta solicitud
                                data: {productoId: productoId},
                                success: function (response) {
                                    // Parsear la respuesta JSON (asegúrate de que el servlet devuelva JSON)
                                    var producto = JSON.parse(response);

                                    // Llenar los campos del formulario con los datos del producto
                                    $("#nuevoNombre").val(producto.nombre);
                                    $("#nuevaCantidad").val(producto.cantidad);
                                    $("#nuevoPrecio").val(producto.precio);
                                },
                                error: function (error) {
                                    // Manejar el error
                                    console.error(error);
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Error',
                                        text: 'Ocurrió un error al cargar los datos del producto.',
                                    });
                                }
                            });
                        } else {
                            $("#nuevoNombre").val("");
                            $("#nuevaCantidad").val("");
                            $("#nuevoPrecio").val("");

                        }
                    }






    </script>


</body>
</html>

