///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package Controlador;
//
//import Modelo.ServiceLibros;
//import java.io.IOException;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.annotation.MultipartConfig;
//import jakarta.servlet.http.Part;
//import java.io.InputStream;
//import java.sql.SQLException;
//
//
//@MultipartConfig
//public class ServletBook extends HttpServlet {
//
//    ServiceLibros servicioLibros = new ServiceLibros();
//    
////    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
////            throws ServletException, IOException {
////        String accion = request.getParameter("accion");
////        String titulo = request.getParameter("titulo");
////        String categoria = request.getParameter("categoria");
////        String autor = request.getParameter("autor");
////        String anio = request.getParameter("anio");
////        // Obtener el archivo desde la solicitud
////        Part archivoPart = request.getPart("archivo");
////
////        
////        response.setContentType("text/plain");
////        response.setCharacterEncoding("UTF-8");
////        response.getWriter().write(accion+titulo+categoria+autor+anio);
////        
////        try{
////                if(accion != null){
////                    switch(accion){
////                        case "insertar":
////                            //resultado = servicioLibros.insertar(titulo, categoria, autor, anio, base64Content);
////                            response.getWriter().write("Entra");
////                            break;
////                        default:
////                            response.sendRedirect("index.jsp");
////                    }
////                }else{
////                    //response.sendRedirect("index.jsp");
////                    response.getWriter().write("Error :( "+accion);
////                }
////            }catch(Exception e){
////                System.out.println("Errro Servlet: "+e);
////            }
////        
////        
////    }
////
////    @Override
////    protected void doGet(HttpServletRequest request, HttpServletResponse response)
////            throws ServletException, IOException {
////        processRequest(request, response);
////    }
//
//
//    @Override
//protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/plain");
//        response.setCharacterEncoding("UTF-8");
//        String accion = request.getParameter("accion");
//        
//        if(accion!=null){
//            switch(accion){
//                case "insertar":
//                    guardarRegistro(response,request);
//                    break;
//                case "buscar":
//                    buscarRegistro(response,request);
//                    break;
//                case "buscarPDF":
//                    buscarPDF(response,request);
//                    break;
//            }
//        }else{
//            response.getWriter().write("Error la accion no fue definida");
//        }
//    }
//    
//
//    
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//    private void guardarRegistro(HttpServletResponse response, HttpServletRequest request) throws IOException, ServletException {
//        String titulo = request.getParameter("titulo");
//        String categoria = request.getParameter("categoria");
//        String autor = request.getParameter("autor");
//        String anio = request.getParameter("anio");
//        
//        InputStream inputStream = null;
//        Part filePart = request.getPart("archivo");
//        inputStream = filePart.getInputStream();
//        if(inputStream!=null){
//            
//            try {
//                response.getWriter().write("VALIDO" + titulo);
//                servicioLibros.insertar(titulo, categoria, autor, anio, inputStream);
//            } catch (SQLException ex) {
//                response.getWriter().write("ERROR" + ex);
//            }
//        }else{
//            response.getWriter().write("No hay Archivo cargado");
//        }
//
//    }
//
//    private void buscarRegistro(HttpServletResponse response, HttpServletRequest request) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }
//
//    private void buscarPDF(HttpServletResponse response, HttpServletRequest request) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }
// 
//
//}
