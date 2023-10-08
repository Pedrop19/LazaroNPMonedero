<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../CSS/resp.css">
        <title>CambioJSP</title>
    </head>
    <body>
        <div class="main-container">
            <div class="respuesta">

                <%
                    // Variables
                    double precio = Double.parseDouble(request.getParameter("precio")); // String a Double
                    double entregado = Double.parseDouble(request.getParameter("entregado")); // String a Double
                    DecimalFormat df = new DecimalFormat("#.##");
                    double cambioTotal = entregado - precio; //Calculo del cambio Total
                    cambioTotal = Math.round(cambioTotal * 100.0) / 100.0; //Redondeo a 2 decimales
                    if(cambioTotal > 0){
                    %>
                        <p>Total a devolver: <%=df.format(cambioTotal)%></p>
                    <%}%>
                <div class="billetes">
                    <%
                        
                        //Operaciones
                        double billete = 500;
                        int contador;

                        if (cambioTotal > 0) {
                            while (billete >= 0.01) {
                                contador = 0;
                                while (cambioTotal >= billete) {
                                    cambioTotal -= billete;
                                    contador++;
                                }
                                if (contador > 0) {
                    %>
                    <img src="../IMG/<%= df.format(billete)%>.png" width="100px"><%= contador%></img>

                    <%
                            }
                            billete = df.format(billete).contains("5") ? billete / 2.5 : billete / 2; //Patron a seguir
                        }
                    } else if (cambioTotal == 0) {
                    %>
                    <p>Lo entregado es justo el precio</p>
                    <%
                    } else {
                    %>
                    <p>No tienes suficiente dinero</p>
                    <%}%> 
                        <br>
                    <a class="center" type="button" href="../index.html"'>Otra operación</a>
                </div>
            </div>
        </div>
    </body>
</html>
