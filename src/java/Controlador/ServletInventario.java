package Controlador;

import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/OperacionesServlet")
public class ServletInventario extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        Connection conexion = null;

        try {
            // Establecer la conexión a la base de datos
            String jdbcUrl = "jdbc:mysql://localhost:3306/donGalleto";
            String usuario = "root";
            String contrasena = "";

            Class.forName("com.mysql.cj.jdbc.Driver");
            conexion = DriverManager.getConnection(jdbcUrl, usuario, contrasena);

            // Obtener el ID del producto y el nuevo precio desde la solicitud AJAX
            String productoId = request.getParameter("productoId");
            String nuevoNombre = request.getParameter("nuevoNombre");
            String nuevaCantidadStr = request.getParameter("nuevaCantidad");
            String nuevoPrecioStr = request.getParameter("nuevoPrecio");

            if (productoId != null && !productoId.isEmpty()
                    && (nuevoNombre != null && !nuevoNombre.isEmpty()
                    || nuevaCantidadStr != null && !nuevaCantidadStr.isEmpty()
                    || nuevoPrecioStr != null && !nuevoPrecioStr.isEmpty())) {
                // Actualizar el precio en la base de datos
                StringBuilder sqlUpdateBuilder = new StringBuilder("UPDATE materia_prima SET");
                if (nuevoNombre != null && !nuevoNombre.isEmpty()) {
                    sqlUpdateBuilder.append(" nombre = ?,");
                }
                if (nuevaCantidadStr != null && !nuevaCantidadStr.isEmpty()) {
                    sqlUpdateBuilder.append(" cantidad = ?,");
                }
                if (nuevoPrecioStr != null && !nuevoPrecioStr.isEmpty()) {
                    sqlUpdateBuilder.append(" costo_unitario = ?,");
                }
                // Eliminar la última coma si existe
                if (sqlUpdateBuilder.charAt(sqlUpdateBuilder.length() - 1) == ',') {
                    sqlUpdateBuilder.deleteCharAt(sqlUpdateBuilder.length() - 1);
                }
                sqlUpdateBuilder.append(" WHERE id = ?");
                String sqlUpdate = sqlUpdateBuilder.toString();

                PreparedStatement pstmt = conexion.prepareStatement(sqlUpdate);
                int paramIndex = 1;
                if (nuevoNombre != null && !nuevoNombre.isEmpty()) {
                    pstmt.setString(paramIndex++, nuevoNombre);
                }
                if (nuevaCantidadStr != null && !nuevaCantidadStr.isEmpty()) {
                    pstmt.setInt(paramIndex++, Integer.parseInt(nuevaCantidadStr));
                }
                if (nuevoPrecioStr != null && !nuevoPrecioStr.isEmpty()) {
                    pstmt.setDouble(paramIndex++, Double.parseDouble(nuevoPrecioStr));
                }
                pstmt.setInt(paramIndex, Integer.parseInt(productoId));
                pstmt.executeUpdate();
                pstmt.close();

                // Imprimir mensaje de éxito en la consola del servidor
                System.out.println("Datos actualizados del producto " + nuevoNombre);

                // Enviar una respuesta de éxito a la solicitud AJAX
                out.print("Datos actualizados del producto " + nuevoNombre);
            } else {
                // Verificar si se proporciona un ID para eliminar el producto
                String eliminarProductoId = request.getParameter("eliminarProductoId");

                if (eliminarProductoId != null && !eliminarProductoId.isEmpty()) {
                    // Eliminar el producto de la base de datos
                    String sqlDelete = "DELETE FROM materia_prima WHERE id = ?";
                    PreparedStatement pstmt = conexion.prepareStatement(sqlDelete);
                    pstmt.setInt(1, Integer.parseInt(eliminarProductoId));
                    pstmt.executeUpdate();
                    pstmt.close();

                    // Imprimir mensaje de éxito en la consola del servidor
                    System.out.println("Producto eliminado con éxito con ID " + eliminarProductoId);

                    // Enviar una respuesta de éxito a la solicitud AJAX
                    out.print("Producto eliminado con éxito con ID " + eliminarProductoId);
                } else {
                    // Si no se proporciona un ID para eliminar, intentar agregar un nuevo producto
                    String nombre = request.getParameter("nombre");
                    String cantidadStr = request.getParameter("cantidad");
                    String precioStr = request.getParameter("precio");
                    String unidadMedida = request.getParameter("medida");

                    if (nombre != null && !nombre.isEmpty() && cantidadStr != null && !cantidadStr.isEmpty() && precioStr != null && !precioStr.isEmpty()) {
                        // Insertar el nuevo producto en la base de datos
                        String sqlInsert = "INSERT INTO materia_prima (nombre, cantidad, unidad_medida,costo_unitario) VALUES (?, ?, ?,?)";
                        PreparedStatement pstmt = conexion.prepareStatement(sqlInsert);
                        pstmt.setString(1, nombre);
                        pstmt.setInt(2, Integer.parseInt(cantidadStr));
                        pstmt.setString(3, unidadMedida);
                        pstmt.setDouble(4, Double.parseDouble(precioStr));
                        pstmt.executeUpdate();
                        pstmt.close();

                        // Imprimir mensaje de éxito en la consola del servidor
                        System.out.println("Nuevo producto agregado con éxito al inventario");

                        // Enviar una respuesta de éxito a la solicitud AJAX
                        out.print("Nuevo producto agregado con éxito al inventario");
                    } else {
                        // Verificar si se proporciona un ID para cargar los detalles del producto
                        String cargarDetallesProductoId = request.getParameter("productoId");

                        if (cargarDetallesProductoId != null && !cargarDetallesProductoId.isEmpty()) {
                            try {
                                // Consulta SQL para obtener los detalles del producto según el ID
                                String sqlSelect = "SELECT nombre, cantidad, costo_unitario FROM materia_prima WHERE id = ?";
                                PreparedStatement pstmt = conexion.prepareStatement(sqlSelect);
                                pstmt.setInt(1, Integer.parseInt(cargarDetallesProductoId));

                                // Ejecutar la consulta y obtener el resultado
                                ResultSet rs = pstmt.executeQuery();

                                // Verificar si se encontraron resultados
                                if (rs.next()) {
                                    // Construir el objeto JSON con los detalles del producto
                                    JsonObject detallesProducto = new JsonObject();
                                    detallesProducto.addProperty("nombre", rs.getString("nombre"));
                                    detallesProducto.addProperty("cantidad", rs.getInt("cantidad"));
                                    detallesProducto.addProperty("precio", rs.getDouble("costo_unitario"));

                                    // Enviar la respuesta JSON
                                    out.print(detallesProducto.toString());
                                } else {
                                     JsonObject detallesProducto = new JsonObject();
                                    detallesProducto.addProperty("nombre", "");
                                    detallesProducto.addProperty("cantidad", 0);
                                    detallesProducto.addProperty("precio", 0.0);

                                    // Enviar la respuesta JSON
                                    out.print(detallesProducto.toString());
                                }

                                // Cerrar recursos
                                rs.close();
                                pstmt.close();
                            } catch (SQLException e) {
                                // Manejar cualquier error de SQL
                                out.print("Error al obtener detalles del producto: " + e.getMessage());
                            }
                        } else {
                            // Enviar una respuesta de error si no se proporcionan los datos necesarios
                            out.print("Error: Datos insuficientes para realizar la operación");
                        }
                    }
                }
            }
        } catch (Exception e) {
            // Imprimir mensaje si hay un error en la conexión
            System.out.println("Error en la conexión a la base de datos: " + e.getMessage());

            // Enviar una respuesta de error a la solicitud AJAX
            out.print("Error: " + e.getMessage());
        } finally {
            // Cerrar la conexión
            if (conexion != null) {
                try {
                    conexion.close();
                } catch (SQLException e) {
                    System.out.println("Error al cerrar la conexión: " + e.getMessage());
                }
            }
        }
    }
}
