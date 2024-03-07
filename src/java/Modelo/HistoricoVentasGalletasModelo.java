package Modelo;

public class HistoricoVentasGalletasModelo {
    int idVenta;
    String nombreGalleta,cantidad,tipoVenta,totalHistoricoVenta,fecha;

    public String getCantidad() {
        return cantidad;
    }

    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public String getNombreGalleta() {
        return nombreGalleta;
    }

    public void setNombreGalleta(String nombreGalleta) {
        this.nombreGalleta = nombreGalleta;
    }

    public String getTipoVenta() {
        return tipoVenta;
    }

    public void setTipoVenta(String tipoVenta) {
        this.tipoVenta = tipoVenta;
    }

    public String getTotalHistoricoVenta() {
        return totalHistoricoVenta;
    }

    public void setTotalHistoricoVenta(String totalHistoricoVenta) {
        this.totalHistoricoVenta = totalHistoricoVenta;
    }
    
    
}
