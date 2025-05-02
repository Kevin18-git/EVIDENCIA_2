<%-- 
    Document   : registro
    Created on : 2/05/2025, 8:53:46 a. m.
    Author     : keidi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Usuario</title>
        <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f9fc;
            color: #222;
            line-height: 1.6;
          }
          .container {
            max-width: 600px;
            margin: 40px auto;
            padding: 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
          }
          h1 {
            color: 
          #2c3e50;
            text-align: center;
            margin-bottom: 30px;
            font-weight: 600;
            border-bottom: 2px solid 
          #f1f1f1;
            padding-bottom: 15px;
          }
          .form-group {
            margin-bottom: 25px;
            position: relative;
          }
          .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #555;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
          }
          .form-group input {
            width: 100%;
            padding: 12px 15px;
            box-sizing: border-box;
            border: 1px solid 
          #e0e0e0;
            border-radius: 6px;
            font-size: 16px;
            transition: border 0.3s, box-shadow 0.3s;
            background-color: 
          #f9f9f9;
          }
          .form-group input:focus {
            border-color: 
          #3498db;
            outline: none;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
            background-color: white;
          }
          .btn {
            width: 100%;
            padding: 14px;
            background-color: 
          #3498db;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: background-color 0.3s, transform 0.2s;
          }
          .btn:hover {
            background-color: 
          #2980b9;
            transform: translateY(-2px);
          }
          .btn:active {
            transform: translateY(0);
          }
          .message {
            padding: 15px;
            margin: 20px 0;
            border-radius: 6px;
            background-color: 
          #d4edda;
            border-left: 4px solid 
          #28a745;
            color: 
          #155724;
          }
          .message.error {
            background-color: 
          #f8d7da;
            border-left-color: 
          #dc3545;
            color: 
          #721c24;
          }
          .menu {
            margin-top: 30px;
            text-align: center;
            padding-top: 20px;
            border-top: 1px solid #eee;
          }
          .menu a {
            color: 
          #3498db;
            text-decoration: none;
            margin: 0 10px;
            font-weight: 500;
            transition: color 0.3s;
          }
          .menu a:hover {
            color: 
          #2980b9;
            text-decoration: underline;
          }

          @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
          }
          .form-group {
            animation: fadeIn 0.5s ease-out forwards;
            opacity: 0;
          }
          .form-group:nth-child(1) { animation-delay: 0.1s; }
          .form-group:nth-child(2) { animation-delay: 0.2s; }
          .form-group:nth-child(3) { animation-delay: 0.3s; }
          .form-group:nth-child(4) { animation-delay: 0.4s; }
          .form-group:nth-child(5) { animation-delay: 0.5s; }


          @media (max-width: 768px) {
            .container {
              margin: 20px;
              padding: 20px;
            }

            .form-group input {
              padding: 10px;
            }

            h1 {
              font-size: 24px;
            }
          }
        </style>
    </head>
    <body>
        <div class ="container">
        <h1>Registro de Usuario</h1>
        
        <% if (request.getAttribute("mensaje")!=null){ %>
        <div class ="message">
            <%= request.getAttribute("mensaje")%>
        </div>
        <% } %>
        
        <form action ="registro" method="POST">
            <div class ="form-group">
                <label for ="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" required>
            </div>
            
            <div class="form-group">
                <label for ="apellido">Apellido:</label>
                <input type="text" id="apellido" name="apellido" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            
            <div class="form-group">
                <label for="password">Contraseña:</label>
                <input type="password" id="password" name="password" required>
            </div>
            
            <div class="form-group">
                <button type="submit" class="btn">Registrar</button>
            </div>
        </form>
        
        <div class="menu">
            <a href="index.jsp">Volver a Inicio</a> | 
            <a href="consulta">Consultar Usuarios</a>
        </div>
    </div>
    </body>
</html>
