package Modelo;

import ConexionBD.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ServiceVentas {
    
    public List<DatosGalletasModelo> consultaListaGalletas() {
        List<DatosGalletasModelo> lstGalletas = new ArrayList<>();
        try {
            Conexion conexionBD = new Conexion();
            Connection cn = conexionBD.ConexionBD();
            PreparedStatement ps = cn.prepareStatement("SELECT idGalleta,nombre,precio,existencia FROM listadoGalletas;");

            try ( ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    DatosGalletasModelo bancoModel = new DatosGalletasModelo();
                    bancoModel.setIdGalleta(rs.getInt("idGalleta"));
                    bancoModel.setNombre(rs.getString("nombre"));
                    bancoModel.setPrecio(rs.getString("precio"));
                    bancoModel.setExistencia(rs.getString("existencia"));
                    lstGalletas.add(bancoModel);
                }
            }
        } catch (SQLException e) {
        }

        return lstGalletas;
    }
    
    public String precioCaja() {
        
        try {
            Conexion conexionBD = new Conexion();
            Connection cn = conexionBD.ConexionBD();
            PreparedStatement ps = cn.prepareStatement("SELECT precio FROM tipoVentaGalletas WHERE idTipoVenta= ?;");
            ps.setInt(1, 2);
            String precioCaja;
            try ( ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    precioCaja = rs.getString("precio");
                    return precioCaja;
                }
            }
        } catch (SQLException e) {
            return "Error Precio Caja";
        }    
        return null;
    }
    
    public String precioGramaje() {
        
        try {
            Conexion conexionBD = new Conexion();
            Connection cn = conexionBD.ConexionBD();
            PreparedStatement ps = cn.prepareStatement("SELECT precio FROM tipoVentaGalletas WHERE idTipoVenta= ?;");
            ps.setInt(1, 3);
            String precioGramaje;
            try ( ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    precioGramaje = rs.getString("precio");
                    return precioGramaje;
                }
            }
        } catch (SQLException e) {
            return "Error Precio Caja";
        }
        return null;
    }
    
    public String existenciaxID( int idBusqueda) {
        
        try {
            Conexion conexionBD = new Conexion();
            Connection cn = conexionBD.ConexionBD();
            PreparedStatement ps = cn.prepareStatement("SELECT existencia FROM listadoGalletas WHERE idGalleta=?;");
            ps.setInt(1, idBusqueda);
            String existenciaGalleta;
            try ( ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    existenciaGalleta = rs.getString("existencia");
                    return existenciaGalleta;
                }
            }
        } catch (SQLException e) {
            return "Error Precio Caja";
        }
        return null;
    }
    
    public String actualizarExistenciaPorID(int idBusqueda, String nuevaExistencia) {
        try {
            Conexion conexionBD = new Conexion();
            Connection cn = conexionBD.ConexionBD();
            PreparedStatement ps = cn.prepareStatement("UPDATE listadoGalletas SET existencia = ? WHERE idGalleta = ?");
            ps.setString(1, nuevaExistencia);
            ps.setInt(2, idBusqueda);

            int filasAfectadas = ps.executeUpdate();
            if (filasAfectadas > 0) {
                return "Existencia actualizada correctamente";
            } else {
                return "No se pudo actualizar la existencia";
            }
        } catch (SQLException e) {
            return "Error al actualizar la existencia";
        }
    }
    
    public String insertarGalletasEliminadas(HistoricoEliminacionGalletasModelo historicoEliminacion) {
    try {
        actualizarExistenciaPorID(Integer.parseInt(historicoEliminacion.idGalletaG),historicoEliminacion.getExistenciaNueva());
        
        Conexion conexionBD = new Conexion();
        Connection cn = conexionBD.ConexionBD();
        PreparedStatement ps = cn.prepareStatement("INSERT INTO historicoEliminacionGalletas (nombre, cantidad, motivo) VALUES (?, ?, ?)");

        ps.setString(1, historicoEliminacion.getNombre());
        ps.setString(2, historicoEliminacion.getCantidad());
        ps.setString(3, historicoEliminacion.getMotivo());

        int filasAfectadas = ps.executeUpdate();

        return (filasAfectadas > 0) ? "Se eliminaron correctamente" : "Error al eliminar galleta(s)";

    } catch (SQLException e) {
        return "Error al eliminar galleta(s): " + e.getMessage();
    }
}



    
    public Object insertarHisoricoVenta(HistoricoVentasGalletasModelo historico) {
        
        try {
            Map lstMap = new HashMap();
            Conexion conexionBD = new Conexion();
            Connection cn = conexionBD.ConexionBD();
            PreparedStatement ps = cn.prepareStatement("INSERT INTO historicoVentasGalletas(idVenta,nombreGalleta,cantidad,tipoVenta,totalHistoricoVenta,fechaHistoricoVenta) VALUES("+
            "(SELECT COALESCE(MAX(idVenta), 0) + 1 FROM ventasGalletas),"+
            "?,?,?,?,CURDATE());");
            
            ps.setString(1, historico.getNombreGalleta());
            ps.setString(2, historico.getCantidad());
            ps.setString(3, historico.getTipoVenta());
            ps.setString(4, historico.getTotalHistoricoVenta());
            
            int filasAfectadas = ps.executeUpdate();
            if(filasAfectadas>0){
                lstMap.put("resultado","Exito Insert Total Historico" );
            }else{
                lstMap.put("resultado","Error Insertar Hisorico Venta" );
            }
            
            return lstMap;
            
        } catch (SQLException e) {            
            return null;
        }    
    }
    
    public String insertarVentaTotales(HistoricoVentasGalletasModelo historico) {
        
        try {
            Conexion conexionBD = new Conexion();
            Connection cn = conexionBD.ConexionBD();
            PreparedStatement ps = cn.prepareStatement("INSERT INTO ventasGalletas(total) VALUES(?);");
            
            ps.setString(1, historico.getTotalHistoricoVenta());
            int filasAfectadas = ps.executeUpdate();
            if(filasAfectadas>0){
                
            }
            return (filasAfectadas > 0) ? "Exito Insert Total" : "Error Insert Total";
            
        } catch (SQLException e) {
            return "Error Precio Caja";
        }    
    }
    
}
