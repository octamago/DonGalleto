package Modelo;

import ConexionBD.Conexion;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Base64;

public class ServiceLibros {
   
    //Método Insertar en books ---- 17 de Septiembte 2023.
    public String insertar(String titulo, String categoria, String autor, String anio, InputStream pdf) throws SQLException {
        try (Connection cn = new Conexion().ConexionBD();
             PreparedStatement ps = cn.prepareStatement("INSERT INTO books(titulo,categoria,autor,anio,pdf) VALUES(?,?,?,?,?);")) {

            ps.setString(1, titulo);
            ps.setString(2, categoria);
            ps.setString(3, autor);
            ps.setString(4, anio);
            ps.setBlob(5, pdf);
            
            int filasAfectadas = ps.executeUpdate();
            return (filasAfectadas > 0) ? "Exito" : "Error";
            
        } catch (SQLException e) {
            System.out.println("Error Service: " + e);
            return "Error";
        }
    }
    public DatosLibroModelo buscar(String titulo) throws SQLException {
    try (Connection cn = new Conexion().ConexionBD();
         PreparedStatement ps = cn.prepareStatement("SELECT  idBook,titulo,categoria,autor,anio FROM books WHERE titulo=?;")) {
        
        ps.setString(1, titulo);
        
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    
                    DatosLibroModelo book = new DatosLibroModelo();
                    book.setIdLibro(rs.getInt("idBook"));
                    book.setTitulo(rs.getString("titulo")); 
                    book.setCategoria(rs.getString("categoria"));
                    book.setAutor(rs.getString("autor"));
                    book.setAnio(rs.getString("anio"));
                    
                    return book;
                } else {
                    // Si no se encontró un libro con el título dado, retorna null
                    return null;
                }
            }
        } catch (SQLException e) {
            System.out.println("Error Service: " + e);
            return null;
        }
    }
    
        public DatosLibroModelo buscarPDF(String titulo) throws SQLException {
    try (Connection cn = new Conexion().ConexionBD();
         PreparedStatement ps = cn.prepareStatement("SELECT pdf FROM books WHERE titulo=?;")) {
        
        ps.setString(1, titulo);
        
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    
                    DatosLibroModelo book = new DatosLibroModelo();
                    book.setArchivoPdf(rs.getBytes("pdf"));
                    
                    return book;
                } else {
                    // Si no se encontró un libro con el título dado, retorna null
                    return null;
                }
            }
        } catch (SQLException e) {
            System.out.println("Error Service: " + e);
            return null;
        }
    }

}
