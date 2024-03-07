package Controlador;

import Modelo.DatosGalletasModelo;
import Modelo.HistoricoEliminacionGalletasModelo;
import Modelo.HistoricoVentasGalletasModelo;
import Modelo.ServiceVentas;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.MultipartConfig;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse; 
import java.io.BufferedReader;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig
public class ServletVentas extends HttpServlet {

    ServiceVentas serviceVentas = new ServiceVentas();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        ObjectMapper objectMapper = new ObjectMapper();
        
        BufferedReader reader = request.getReader();
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        ObjectMapper mapper = new ObjectMapper();
                    
        
        String accion = request.getParameter("accion");
                
        if (!accion.equals(" ")) {
            switch (accion) {
                case "datosGalletas":
                    List<DatosGalletasModelo> lstGalletas = serviceVentas.consultaListaGalletas();
                    String galletasJson = objectMapper.writeValueAsString(lstGalletas);
                    response.getWriter().write(galletasJson);
                    break;
                case "precioCaja":
                    String precioCaja = serviceVentas.precioCaja();
                    response.getWriter().write(objectMapper.writeValueAsString(precioCaja));
                    break;
                case "precioGranaje":
                    String precioGranaje = serviceVentas.precioGramaje();
                    response.getWriter().write(objectMapper.writeValueAsString(precioGranaje));
                    break;
                case "insertarVenta":                    
                    HistoricoVentasGalletasModelo historico1 = mapper.readValue(sb.toString(), HistoricoVentasGalletasModelo.class);

                    Object resultadoInsercion = serviceVentas.insertarHisoricoVenta(historico1);
                    response.getWriter().write(objectMapper.writeValueAsString(resultadoInsercion));
                    break;
                case "insertarVentaTotal":
                    HistoricoVentasGalletasModelo historico2 = mapper.readValue(sb.toString(), HistoricoVentasGalletasModelo.class);
                    String resultadoInsercionTotal = serviceVentas.insertarVentaTotales(historico2);
                    response.getWriter().write(objectMapper.writeValueAsString(resultadoInsercionTotal));
                    break;
                case "consultarExistenciaGalletas":
                    
                    Map<String, Object> data = mapper.readValue(sb.toString(), new TypeReference<Map<String, Object>>() { });
                    int idBusqueda = Integer.parseInt(data.get("idGalletaG").toString());
                    String totalExistencia = serviceVentas.existenciaxID(idBusqueda);
                    response.getWriter().write(objectMapper.writeValueAsString(totalExistencia));
                    break;
                case "actualizarExistenciaGalletas":
                    Map<String, Object> data1 = mapper.readValue(sb.toString(), new TypeReference<Map<String, Object>>() { });
                    int idBusqueda1 = Integer.parseInt(data1.get("idGalletaG").toString());
                    String existenciaNueva = data1.get("existenciaNueva").toString();
                    String msjActualizacion = serviceVentas.actualizarExistenciaPorID(idBusqueda1, existenciaNueva);
                    response.getWriter().write(objectMapper.writeValueAsString(msjActualizacion));
                    break;
                case "insertarGalletasEliminadas":
                    HistoricoEliminacionGalletasModelo historicoEliminacion = mapper.readValue(sb.toString(), HistoricoEliminacionGalletasModelo.class);
                    Object resultadoEliminacion = serviceVentas.insertarGalletasEliminadas(historicoEliminacion);
                    response.getWriter().write(objectMapper.writeValueAsString(resultadoEliminacion));
                    break;
            }
        } else {
            response.getWriter().write("Error: la acción no fue definida");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
