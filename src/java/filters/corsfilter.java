package filters;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebFilter("/*")
public class corsfilter implements Filter {

    // IPs permitidas
    private static final List<String> ALLOWED_IPS = new ArrayList<>();

    static {
        ALLOWED_IPS.add("192.168.124.65");
        ALLOWED_IPS.add("192.168.137.1");
        ALLOWED_IPS.add("192.168.137.");
        ALLOWED_IPS.add("192.168.137.56");
        ALLOWED_IPS.add("192.168.124.21");
        ALLOWED_IPS.add("192.168.124.192");

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // Verifica si la solicitud proviene de la IP permitida
        String remoteAddr = httpRequest.getRemoteAddr();
        String origin = httpRequest.getHeader("Origin");
        if (!ALLOWED_IPS.contains(remoteAddr)) {
            System.out.println("Acceso rechazado para: " + remoteAddr+""+ origin);
            httpResponse.setStatus(HttpServletResponse.SC_FORBIDDEN);
        } else {
            // Configuración de los encabezados CORS
            System.out.println("Acceso permitido para: " + remoteAddr+" " + origin);
            httpResponse.setHeader("Access-Control-Allow-Origin", origin);
            httpResponse.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
            httpResponse.setHeader("Access-Control-Allow-Headers", "Content-Type, Accept, X-Requested-With");

            // Continuar con la cadena de filtros
            chain.doFilter(request, response);
        }
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Puedes realizar alguna inicialización si es necesario
    }

    @Override
    public void destroy() {
        // Puedes realizar alguna limpieza si es necesario
    }
}
