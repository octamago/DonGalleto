package Modelo;

import ConexionBD.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ServiceUsuarios {

    //Método Insertar en users ---- 17 de Septiembte 2023.
    public String insertar(String nombre, String contra, String correo, String usuario) throws SQLException {
        try ( Connection cn = new Conexion().ConexionBD();  PreparedStatement ps = cn.prepareStatement("INSERT INTO users(completo, contra, correo, usuario,tipoUsuario) VALUES (?, ?, ?, ?, ?)")) {

            ps.setString(1, nombre);
            ps.setString(2, contra);
            ps.setString(3, correo);
            ps.setString(4, usuario);
            ps.setString(5, "cliente");

            int filasAfectadas = ps.executeUpdate();
            return (filasAfectadas > 0) ? "Exito" : "Error";

        } catch (SQLException e) {
            System.out.println("Error Service: " + e);
            return "Error";
        }
    }

    //Método Buscar en users ---- 17 de Septiembte 2023.
    public String buscar(String usuario) throws SQLException {
        try ( Connection cn = new Conexion().ConexionBD();  PreparedStatement ps = cn.prepareStatement("SELECT * FROM users WHERE usuario = ?;")) {

            ps.setString(1, usuario);
            try ( ResultSet rs = ps.executeQuery()) {
                System.out.println("Exito en Servicio");
                return rs.next() ? "Exito" : "Error P";
            }

        } catch (SQLException e) {
            System.out.println("Error Service: " + e);
            return "Error BD";
        }
    }

public Usuario validarUsuario(String usuario, String contra) throws SQLException, ClassNotFoundException {
    Connection cn = null;
    PreparedStatement ps = null;
    Usuario user = null;
    ResultSet rs = null;
    try {
        cn = new Conexion().ConexionBD();
        ps = cn.prepareStatement("SELECT * FROM users WHERE usuario = ? AND contra = ?;");
        ps.setString(1, usuario);
        ps.setString(2, contra);

        rs = ps.executeQuery();

        if (rs.next()) {
            user = new Usuario(
                    rs.getString("completo"),
                    rs.getString("contra"),
                    rs.getString("correo"),
                    rs.getString("usuario"),
                    rs.getString("tipousuario")
            );
        }

        return user;
    } catch (SQLException e) {
        return null;
    } finally {
        // Cerrar recursos (ResultSet, PreparedStatement, Connection) en un bloque finally
        if (rs != null) {
            rs.close();
        }
        if (ps != null) {
            ps.close();
        }
        if (cn != null) {
            cn.close();
        }
    }
}

//    public String validarUsuario(String usuario, String contra) {
//        try ( Connection cn = new Conexion().ConexionBD();  PreparedStatement ps = cn.prepareStatement("SELECT usuario, contra, tipoUsuario FROM users WHERE usuario = ? AND contra = ?")) {
//
//            ps.setString(1, usuario);
//            ps.setString(2, contra);
//
//            try ( ResultSet rs = ps.executeQuery()) {
//                if (rs.next()) {
//                    String tipoUsuario = rs.getString("tipoUsuario");
//                    System.out.println("Éxito en el servicio");
//
//                    // Verificar el tipo de usuario (1 o 2)
//                    if (tipoUsuario.equals("administrador") || tipoUsuario.equals("cliente")) {
//                        return "Exito";
//                    } else {
//                        return "Usuario válido, pero el tipo de usuario no es 1 ni 2";
//                    }
//                } else {
//                    System.out.println("Usuario o contraseña incorrectos");
//                    return "Usuario o contraseña incorrectos";
//                }
//            }
//        } catch (SQLException e) {
//            System.out.println("Error en el servicio: " + e);
//            return "Error";
//        }
//    }

    public String buscarUsuario(String usuario) throws SQLException {
        try ( Connection cn = new Conexion().ConexionBD();  PreparedStatement ps = cn.prepareStatement("SELECT usuario FROM users WHERE usuario = ?;")) {

            ps.setString(1, usuario);

            try ( ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return "Exito"; // Si el usuario existe pero su tipo no es 1 ni 2
                } else {
                    return "No encontrado";
                }

            }

        } catch (SQLException e) {
            System.out.println("Error Service: " + e);
            return "Error Buscar";
        }
    }

}
