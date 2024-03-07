package Modelo;

public class HistoricoEliminacionGalletasModelo {
    int idEliminar;
    String nombre,cantidad,motivo;
    String idGalletaG, existenciaNueva;

    public String getIdGalletaG() {
        return idGalletaG;
    }

    public void setIdGalletaG(String idGalletaG) {
        this.idGalletaG = idGalletaG;
    }

    public String getExistenciaNueva() {
        return existenciaNueva;
    }

    public void setExistenciaNueva(String existenciaNueva) {
        this.existenciaNueva = existenciaNueva;
    }
    
    

    public int getIdEliminar() {
        return idEliminar;
    }

    public void setIdEliminar(int idEliminar) {
        this.idEliminar = idEliminar;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCantidad() {
        return cantidad;
    }

    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }
    
    
}
