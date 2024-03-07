/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.DatosGalletasModelo;
import Modelo.HistoricoEliminacionGalletasModelo;
import Modelo.HistoricoVentasGalletasModelo;
import Modelo.ServiceUsuarios;
import Modelo.Usuario;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author octam
 */
@MultipartConfig
public class ServletLogin extends HttpServlet {

    ServiceUsuarios serviceUser = new ServiceUsuarios();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setCharacterEncoding("UTF-8");

        String accion = request.getParameter("accion");
        String usr = request.getParameter("user");
        String pass = request.getParameter("ps");
        String lstGalletas = "";
        Usuario respuesta = null;
        if (!accion.equals(" ") && !usr.equals("") && !pass.equals("")) {
            switch (accion) {
                case "acceder": {
                    try {

                        String usuario = usr.replaceAll("[^a-zA-Z0-9@._-]", "").trim();
                        String password = pass.replaceAll("[^a-zA-Z0-9@._-]", "").trim();
                        
                        if(usuario.equals(usr) && password.equals(pass)){
                        lstGalletas = serviceUser.buscar(usuario);
                            
                        }else{
                            lstGalletas= "Error I";
                            
                        }
                    } catch (SQLException ex) {
                        lstGalletas = "Error BD";
                        
                    }
                }
                if (lstGalletas == "Exito") {
                    System.out.println("Datos ingresados: " + usr + " " + pass + " ");
                    try {
                        respuesta = serviceUser.validarUsuario(usr, pass);
                    } catch (SQLException ex) {
                        Logger.getLogger(ServletLogin.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (ClassNotFoundException ex) {
                        Logger.getLogger(ServletLogin.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    if (respuesta != null) {
                        Gson gson = new Gson();
                        response.setContentType("application/json");
                        response.getWriter().write(gson.toJson(respuesta));
                    } else {
                        response.setContentType("text/plain");
                        response.getWriter().write("Error P");
                    }
                } else {
                    response.setContentType("text/plain");
                    System.out.println("Datos ingresados rechazados: " + usr + " " + pass + " ");
                    response.getWriter().write(lstGalletas);
                }
                break;

            }
        } else {
            response.getWriter().write("Error V");
        }
    }

}
