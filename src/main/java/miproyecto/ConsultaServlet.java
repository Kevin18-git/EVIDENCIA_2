/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package miproyecto;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ConsultaServlet", urlPatterns = {"/consulta"})
public class ConsultaServlet extends HttpServlet {
    
    // Método para manejar solicitudes GET (consultar usuarios)

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Obtenemos la sesión HTTP
        HttpSession session = request.getSession();
        
        // Recuperamos la lista de usuarios de la sesión (o creamos una nueva)
        List<Usuario> listaUsuarios = (List<Usuario>) session.getAttribute("listaUsuarios");
        if (listaUsuarios == null) {
            listaUsuarios = new ArrayList<>();
            session.setAttribute("listaUsuarios", listaUsuarios);
        }
        
        // Verificamos si hay un parámetro de búsqueda
        String emailBusqueda = request.getParameter("email");
        
        // Si hay un parámetro de búsqueda, buscamos el usuario
        if (emailBusqueda != null && !emailBusqueda.isEmpty()) {
            Usuario usuarioEncontrado = null;
            
            // Buscamos el usuario por email
            for (Usuario usuario : listaUsuarios) {
                if (usuario.getEmail().equals(emailBusqueda)) {
                    usuarioEncontrado = usuario;
                    break;
                }
            }
            
            // Agregamos el resultado de la búsqueda como atributo
            request.setAttribute("usuarioBuscado", usuarioEncontrado);
            request.setAttribute("busquedaRealizada", true);
        }
        
        // Redirigimos a la página de consulta
        request.getRequestDispatcher("/consulta.jsp").forward(request, response);
    }
}
