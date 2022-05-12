<%-- 
    Document   : Archivo de peticiones
    Created on : dd/mm/yyyy, hh:mm: AM/PM
    Author     : nombre autor

--%>


<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="logica.Transaccion"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json;charset=iso-8859-1" language="java" pageEncoding="iso-8859-1" session="true"%>

<%    // Iniciando respuesta JSON.
    String respuesta = "{";

    //Lista de procesos o tareas a realizar 
    List<String> tareas = Arrays.asList(new String[]{
        "ingresoVehiculo",
        "eliminarIngreso",
        "salidaVehiculo",
        "anularTransaccion",
        "listarIngresos",
        "listarHistorico",
        "calcularPago"
    });
    
    String proceso = "" + request.getParameter("proceso");

    // Validación de parámetros utilizados en todos los procesos.
    if (tareas.contains(proceso)) {
        respuesta += "\"ok\": true,";
        // ------------------------------------------------------------------------------------- //
        // -----------------------------------INICIO PROCESOS----------------------------------- //
        // ------------------------------------------------------------------------------------- //
        if (proceso.equals("ingresoVehiculo")) {
            String placa = request.getParameter("placa");
            int tipoVehiculo = Integer.parseInt(request.getParameter("tipoVehiculo"));
            //String horaIn = request.getParameter("timeIn");
            int userIn = Integer.parseInt(request.getParameter("idUserIn"));
            
            
            Transaccion t= new Transaccion();
            t.setPlaca(placa);            
            t.setTipoVehiculo(tipoVehiculo);
            t.setIdUserIn(userIn);
            
            if (t.ingresoVehiculo()){
                    respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }            
        }
        
        else if (proceso.equals("eliminarIngreso")) {
            
            String placa = request.getParameter("placa");
            
            Transaccion t= new Transaccion();
            if (t.eliminarIngreso(placa)){
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
        }
        
        else if (proceso.equals("listarIngresos")) {
            
            Transaccion t= new Transaccion();
            try {
                List<Transaccion> lista = t.listarIngresos();
                respuesta += "\"" + proceso + "\": true,\"ingresos\":" + new Gson().toJson(lista);
            } catch (SQLException ex) {
                respuesta += "\"" + proceso + "\": true,\"ingresos\":[]";
                Logger.getLogger(Transaccion.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        else if (proceso.equals("listarHistorico")){
            Transaccion t= new Transaccion();
            try {
                List<Transaccion> lista = t.listarHistorico();
                respuesta += "\"" + proceso + "\": true,\"historico\":" + new Gson().toJson(lista);
            } catch (SQLException ex) {
                respuesta += "\"" + proceso + "\": true,\"historico\":[]";
                Logger.getLogger(Transaccion.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        else if (proceso.equals("salidaVehiculo")) {
            String placa = request.getParameter("placa");
            int userOut = Integer.parseInt(request.getParameter("idUserOut"));
            Transaccion t= new Transaccion(); 
            //t.setPlaca(placa); // sobra ya que nuestro metodo rquiere que s ele pase la placa como string  
            
            if (t.salidaVehiculo(placa, userOut)) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
        }
        
        else if (proceso.equals("anularTransaccion")) {
            String placa = request.getParameter("placa");
            int userOut = Integer.parseInt(request.getParameter("idUserOut"));
            Transaccion t= new Transaccion(); 
            //t.setPlaca(placa); // sobra ya que nuestro metodo rquiere que s ele pase la placa como string  
            
            if (t.anularTransaccion(placa, userOut)) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
        }
        
        else if (proceso.equals("calcularPago")) {
            
            String placa = request.getParameter("placa");
            
            Transaccion tCalcular= new Transaccion();
            String tPagado = String.valueOf(tCalcular.calcularPago(placa));
            
            
            if (tPagado.equals("00")) {
                
                respuesta += "\"" + proceso + "\": false";
                
            } 
            else {
                
                respuesta += "\"" + proceso + "\": true,\"pago\":" + new Gson().toJson(tCalcular);
            }
        }

        // ------------------------------------------------------------------------------------- //
        // -----------------------------------FIN PROCESOS-------------------------------------- //
        // ------------------------------------------------------------------------------------- //
        // Proceso desconocido.
    } else {
        respuesta += "\"ok\": false,";
        respuesta += "\"error\": \"INVALID\",";
        respuesta += "\"errorMsg\": \"Lo sentimos, los datos que ha enviado,"
                + " son inválidos. Corrijalos y vuelva a intentar por favor.\"";
    }
    // Usuario sin sesión.
    // Responder como objeto JSON codificación ISO 8859-1.
    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);
%>
