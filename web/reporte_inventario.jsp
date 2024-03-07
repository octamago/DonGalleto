<%@page import="java.text.DecimalFormat"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Reporte de Inventario</title>
        <link href="https://cdn.datatables.net/1.13.8/css/jquery.dataTables.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/buttons/2.4.2/css/buttons.dataTables.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/responsive/2.5.0/css/responsive.dataTables.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/searchbuilder/1.6.0/css/searchBuilder.dataTables.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/searchpanes/2.2.0/css/searchPanes.dataTables.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/select/1.7.0/css/select.dataTables.css" rel="stylesheet">
        <link href='https://fonts.googleapis.com/css?family=Open Sans' rel='stylesheet'>    

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>



        <script src="resources/js/index.js"></script>
        <link rel="stylesheet" type="text/css" href="resources/css/estilosIndex.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>     
        <!--     SweetAlert2 CSS 
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11">-->

        <style>
            body{

                background-color: #f2994a;
            }
            button.blue {
                background-color: #000000;
                color: white;
                border: none;
            }

            /* Estilo para el botón negro al pasar el ratón por encima (hover) */
            button.blue:hover {
                background-color: #878787; /* Blanco al pasar el ratón por encima */
                color: #fffffff;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-light bg-light">
            <div class="containerNav">
                <a class="navbar-brand" href="index.jsp">
                    <img src="resources/img/logoPequeñoDonGalleto.png" alt="" height="60" style="margin-left: 10%;">
                    <span>Reporte de Inventario</span>
                </a>
            </div>
            <div>
                <button class="blue" style="width:120px;" onclick="window.location.href = 'inventario.jsp'">Regresar</button>

            </div>
        </nav>
        <div class="container">
            <h2>Materia Prima</h2>

            <table id="materiaPrimaTable" class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Cantidad</th>
                        <th>Unidad de Medida</th>
                        <th>Costo Unitario</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Aquí puedes iterar sobre tus datos y llenar la tabla -->
                    <%
                        Connection conexion = null;
                        PreparedStatement pstmt = null;
                        ResultSet rs = null;
                        DecimalFormat df = new DecimalFormat("#.##");

                        try {
                            // Establecer la conexión a la base de datos
                            String jdbcUrl = "jdbc:mysql://localhost:3306/donGalleto";
                            String usuario = "root";
                            String contrasena = "";

                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conexion = DriverManager.getConnection(jdbcUrl, usuario, contrasena);

                            // Consultar los datos de la tabla materia_prima
                            String sql = "SELECT id, nombre, cantidad, unidad_medida, costo_unitario FROM materia_prima";
                            pstmt = conexion.prepareStatement(sql);
                            rs = pstmt.executeQuery();

                            // Iterar sobre los resultados y llenar la tabla
                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("id")%></td>
                        <td><%= rs.getString("nombre")%></td>
                        <td><%= rs.getInt("cantidad")%></td>
                        <td><%= rs.getString("unidad_medida")%></td>
                        <td><%= rs.getDouble("costo_unitario")%></td>
                        <td><%= df.format(rs.getInt("cantidad") * rs.getDouble("costo_unitario"))%></td>
                    </tr>
                    <%
                            }
                        } catch (Exception e) {
                            // Manejar errores
                            e.printStackTrace();
                        } finally {
                            // Cerrar recursos
                            try {
                                if (rs != null) {
                                    rs.close();
                                }
                                if (pstmt != null) {
                                    pstmt.close();
                                }
                                if (conexion != null) {
                                    conexion.close();
                                }
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.js"></script>
        <script src="https://cdn.datatables.net/1.13.8/js/jquery.dataTables.js"></script>
        <script src="https://cdn.datatables.net/buttons/2.4.2/js/dataTables.buttons.js"></script>
        <script src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.colVis.js"></script>
        <script src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.html5.js"></script>
        <script src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.print.js"></script>
        <script src="https://cdn.datatables.net/responsive/2.5.0/js/dataTables.responsive.js"></script>
        <script src="https://cdn.datatables.net/searchbuilder/1.6.0/js/dataTables.searchBuilder.js"></script>
        <script src="https://cdn.datatables.net/searchpanes/2.2.0/js/dataTables.searchPanes.js"></script>
        <script src="https://cdn.datatables.net/select/1.7.0/js/dataTables.select.js"></script>

        <!--     SweetAlert2 JS 
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>-->

        <script>
                    $(document).ready(function () {
                        // Inicializar la tabla DataTable
                        var table = $('#materiaPrimaTable').DataTable({
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


                        $('#materiaPrimaTable tbody').on('click', 'tr', function () {
                            if ($(this).hasClass('selected')) {
                                $(this).removeClass('selected');
                            } else {
                                table.$('tr.selected').removeClass('selected');
                                $(this).addClass('selected');
                            }
                        });
                    });
        </script>
    </body>
</html>
