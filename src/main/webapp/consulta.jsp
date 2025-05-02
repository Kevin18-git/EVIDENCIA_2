<%@page import="java.util.List"%>
<%@page import="miproyecto.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Consulta de Usuarios</title>
    <style>
        :root {
            --primary-color: #3498db;
            --primary-dark: #2980b9;
            --secondary-color: #f8f9fa;
            --accent-color: #2ecc71;
            --error-color: #e74c3c;
            --text-color: #333;
            --border-color: #ddd;
            --shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            --border-radius: 8px;
        }
        
        /* Estilos generales */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fa;
            color: var(--text-color);
            line-height: 1.6;
        }
        
        .container {
            max-width: 1000px;
            margin: 2rem auto;
            padding: 2rem;
            background-color: white;
            border-radius: var(--border-radius);
            box-shadow: var(--shadow);
        }
        
        h1, h2 {
            margin-bottom: 1.5rem;
            color: var(--primary-dark);
        }
        
        h1 {
            text-align: center;
            padding-bottom: 1rem;
            border-bottom: 2px solid var(--primary-color);
        }
        

        form {
            margin-bottom: 2rem;
            padding: 1.5rem;
            background-color: var(--secondary-color);
            border-radius: var(--border-radius);
        }
        
        .form-group {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            gap: 1rem;
        }
        
        label {
            font-weight: 600;
            flex: 1 0 100%;
        }
        
        @media (min-width: 768px) {
            label {
                flex: 0 0 auto;
            }
        }
        
        input[type="email"] {
            flex: 1;
            min-width: 200px;
            padding: 0.8rem;
            border: 1px solid var(--border-color);
            border-radius: var(--border-radius);
            font-size: 1rem;
        }
        
        input[type="email"]:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
        }
        
        .btn {
            background-color: var(--primary-color);
            color: white;
            border: none;
            padding: 0.8rem 1.5rem;
            border-radius: var(--border-radius);
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }
        
        .btn:hover {
            background-color: var(--primary-dark);
        }
        
        /* Estilos para los resultados */
        .results {
            margin-bottom: 2rem;
            padding: 1.5rem;
            background-color: var(--secondary-color);
            border-radius: var(--border-radius);
            border-left: 4px solid var(--primary-color);
        }
        
        .not-found {
            padding: 1rem;
            background-color: rgba(231, 76, 60, 0.1);
            border-radius: var(--border-radius);
            color: var(--error-color);
            font-weight: 600;
        }
        
        /* Estilos para tablas */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 1rem 0;
            overflow: hidden;
            border-radius: var(--border-radius);
            box-shadow: var(--shadow);
        }
        
        th {
            background-color: var(--primary-color);
            color: white;
            text-align: left;
            padding: 1rem;
        }
        
        td {
            padding: 1rem;
            border-bottom: 1px solid var(--border-color);
        }
        
        tr:nth-child(even) {
            background-color: var(--secondary-color);
        }
        
        tr:last-child td {
            border-bottom: none;
        }
        
        tr:hover {
            background-color: rgba(52, 152, 219, 0.1);
        }
        
        /* Estilos para el menú */
        .menu {
            margin-top: 2rem;
            padding-top: 1.5rem;
            border-top: 2px solid var(--border-color);
            text-align: center;
        }
        
        .menu a {
            text-decoration: none;
            color: var(--primary-color);
            font-weight: 600;
            padding: 0.5rem 1rem;
            border-radius: var(--border-radius);
            transition: background-color 0.2s ease;
        }
        
        .menu a:hover {
            background-color: var(--secondary-color);
            color: var(--primary-dark);
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .container {
                padding: 1rem;
                margin: 1rem;
            }
            
            .form-group {
                flex-direction: column;
                align-items: stretch;
            }
            
            input[type="email"], .btn {
                width: 100%;
            }
            
            table, th, td {
                font-size: 0.9rem;
            }
            
            th, td {
                padding: 0.8rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Consulta de Usuarios</h1>
        
        <%-- Formulario de búsqueda que usa método GET --%>
        <form action="consulta" method="GET">
            <div class="form-group">
                <label for="email">Buscar usuario por email:</label>
                <input type="email" id="email" name="email" required>
                <button type="submit" class="btn">Buscar</button>
            </div>
        </form>
        
        <%-- Resultados de la búsqueda --%>
        <% if (request.getAttribute("busquedaRealizada") != null) { %>
            <div class="results">
                <h2>Resultado de la búsqueda</h2>
                
                <% if (request.getAttribute("usuarioBuscado") != null) { %>
                    <% Usuario usuario = (Usuario) request.getAttribute("usuarioBuscado"); %>
                    <table>
                        <tr>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Email</th>
                        </tr>
                        <tr>
                            <td><%= usuario.getNombre() %></td>
                            <td><%= usuario.getApellido() %></td>
                            <td><%= usuario.getEmail() %></td>
                        </tr>
                    </table>
                <% } else { %>
                    <div class="not-found">
                        No se encontró ningún usuario con el email especificado.
                    </div>
                <% } %>
            </div>
        <% } %>
        
        <%-- Lista de todos los usuarios --%>
        <h2>Lista de Usuarios Registrados</h2>
        
        <% 
            List<Usuario> listaUsuarios = (List<Usuario>) session.getAttribute("listaUsuarios");
            if (listaUsuarios != null && !listaUsuarios.isEmpty()) {
        %>
            <table>
                <tr>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Email</th>
                </tr>
                <% for (Usuario usuario : listaUsuarios) { %>
                    <tr>
                        <td><%= usuario.getNombre() %></td>
                        <td><%= usuario.getApellido() %></td>
                        <td><%= usuario.getEmail() %></td>
                    </tr>
                <% } %>
            </table>
        <% } else { %>
            <p>No hay usuarios registrados en el sistema.</p>
        <% } %>
        
        <div class="menu">
            <a href="index.html">Volver a Inicio</a> | 
            <a href="registro.jsp">Registrar Usuario</a>
        </div>
    </div>
</body>
</html>