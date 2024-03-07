
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="resources/css/estilosIndex.css">
        <script src="resources/js/Produccion.js"></script>
        <title>Produccion</title>
        <link href='https://fonts.googleapis.com/css?family=Open Sans' rel='stylesheet'>    
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css">
    </head>
    <body id="contenedorIndex">
        <nav class="navbar navbar-light bg-light">
            <div class="containerNav">
                <a class="navbar-brand" href="index.jsp">
                    <img src="resources/img/logoPequeñoDonGalleto.png" alt="" height="60" style="margin-left: 10%;">
                    <span>Historial Ganancias</span>
                </a>
            </div>
        </nav>
        <div class="container">

            <div class="row">
                <h1 id="msjVenta">Ganancias</h1>
                <div class="col-8"> 
                    <!-- INICIA ÁREA DE GALLETAS --> 
                    <div class="row">
                        <div class="row" style="margin-top: 1%">
                            <div class="col-12">
                                <table id="tablaProductos" class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>NOMBRE</th>
                                            <th>CANTIDAD</th> 
                                            <th>$PERDIDAS</th> 
                                            <th>$TOTAL</th> 
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            Connection conexion = null;
                                            try {
                                                // Establecer la conexión a la base de datos
                                                String jdbcUrl = "jdbc:mysql://localhost:3306/donGalleto";
                                                String usuario = "root";
                                                String contrasena = "";

                                                Class.forName("com.mysql.cj.jdbc.Driver");
                                                conexion = DriverManager.getConnection(jdbcUrl, usuario, contrasena);

                                                // Realizar la consulta para obtener los productos del historicoGananciasGalletas
                                                Statement stmt = conexion.createStatement();
                                                ResultSet rs = stmt.executeQuery("SELECT * FROM historicoGananciasGalletas");

                                                // Mostrar los datos en la tabla
                                                while (rs.next()) {
                                                    out.println("<tr>");
                                                    out.println("<td>" + rs.getString("nombreGalleta") + "</td>");
                                                    out.println("<td>" + rs.getString("cantidad") + "</td>");
                                                    out.println("<td>" + rs.getString("perdida") + "</td>");
                                                    out.println("<td>" + rs.getString("totalHistoricoVenta") + "</td>");
                                                    out.println("</tr>");
                                                }

                                                // Cerrar las conexiones
                                                rs.close();
                                                stmt.close();
                                                conexion.close();
                                            } catch (Exception e) {
                                                // Imprimir mensaje si hay un error en la conexión
                                                out.println("Error en la conexión a la base de datos: " + e.getMessage());
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- TERMINA ÁREA DE GALLETAS -->
                </div>
              
            <div class="col-4">
                <div class="col" style="text-align: center;">
                    <button style="width: 410px;" type="button" class="btn btn-dark" onclick="imprimir()">IMPRIMIR</button>
                </div>
                <div class="card oculta" id="miTarjeta" style="margin-bottom: 1%;">
                    <div class="card-body">
                        <div class="input-group input-group-sm mb-3" style="width: 50%; margin: auto;">
                            <span class="input-group-text" id="inputGroup-sizing-default" style="width: 90px;">Fecha inicio</span>
                            <input id="fechaInicio" type="date" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                        </div>
                        <div class="input-group input-group-sm mb-3" style="width: 50%; margin: auto;">
                            <span class="input-group-text" id="inputGroup-sizing-default" style="width: 90px;">Fecha fin</span>
                            <input id="fechaFin" type="date" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                        </div>
                        <div class="row">
                            <div class="col" style="text-align: center;">
                                <button style="width: 100px;" type="button" class="btn btn-dark" onclick="buscarPorFecha()">Buscar</button>
                                <button style="width: 150px;" type="button" class="btn btn-dark" onclick="limpiarFiltro()">Limpiar filtro</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>                                
</div>


        <div id="graficaVentas"></div>

        <script>
            function imprimir() {
                // Lógica para la función imprimir
                alert('Funcionalidad de impresión');
            }

            function buscarPorFecha() {
                // Obtener valores de fechas
                var fechaInicio = $('#fechaInicio').val();
                var fechaFin = $('#fechaFin').val();
                // Lógica para la función buscar por fecha
                alert('Buscar desde ' + fechaInicio + ' hasta ' + fechaFin);
            }

            function limpiarFiltro() {
                // Limpiar campos de fecha
                $('#fechaInicio').val('');
                $('#fechaFin').val('');
                // Lógica adicional de limpieza si es necesario
                alert('Se limpió el filtro');
            }
            document.addEventListener("DOMContentLoaded", function () {
                // Realizar la conexión a la base de datos y obtener los datos del historial
                var ventasPorFecha =
            <%
                try {
                    // Establecer la conexión a la base de datos
                    String jdbcUrl = "jdbc:mysql://localhost:3306/donGalleto";
                    String usuario = "root";
                    String contrasena = "";

                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conexion = DriverManager.getConnection(jdbcUrl, usuario, contrasena);

                    // Realizar la consulta para obtener los datos del historialGananciasGalletas
                    Statement stmt = conexion.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT DATE_FORMAT(fechaHistoricoVenta, '%Y-%m-01') AS fecha, SUM(totalHistoricoVenta) AS total FROM historicoGananciasGalletas GROUP BY fecha");

                    // Imprimir los resultados en formato JSON
                    out.println("[");
                    while (rs.next()) {
                        out.println("{fecha: '" + rs.getString("fecha") + "', total: " + rs.getDouble("total") + "},");
                    }
                    out.println("]");

                } catch (Exception e) {
                    // Imprimir mensaje si hay un error en la conexión
                    out.println("Error en la conexión a la base de datos: " + e.getMessage());
                }
            %>
                ;
                // Configuración de la gráfica

                Highcharts.chart('graficaVentas', {
                    chart: {
                        type: 'column'
                    },
                    title: {
                        text: 'Ventas por Mes'
                    },
                    xAxis: {
                        categories: ventasPorFecha.map(function (venta) {
                            return venta.fecha;
                        }),
                        title: {
                            text: 'Fecha'
                        }
                    },
                    yAxis: {
                        title: {
                            text: 'Total de Ventas'
                        }
                    },
                    series: [{
                            name: 'Ventas',
                            data: ventasPorFecha.map(function (venta) {
                                return venta.total;
                            })
                        }]
                });
            });
               
        </script> 
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/2.4.2/js/dataTables.buttons.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.print.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
        <script src="https://code.highcharts.com/highcharts.js"></script>

        <script>
            document.addEventListener("DOMContentLoaded", datosGalletas);
            var table = $('#tablaProductos').DataTable({
                            dom: 'Bfrtip', // Botones y otros elementos
                            buttons: [
                                //                    'copy', 'csv', 'excel', 'pdf', 'print' // Botones de exportación
                                'excel', 'print' // Botones de exportación
                            ],
                            language: {url: 'resources/json/dataTablesEspañol.json'},
                            responsive: true,
                            pagingType: "full_numbers"
                                    // Agrega más opciones o personalizaciones según tus necesidades
                        });
        </script>
    </body>
</html>
