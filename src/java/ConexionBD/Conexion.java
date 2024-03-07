package ConexionBD;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
    Connection con;
    public Connection ConexionBD(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/donGalleto","root","");
            return con;    
        }catch(Exception e){
            System.err.println("Error: "+e);
            return null;
        }
    }
}
