package logica;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import persistencia.ConexionBD;


public class Transaccion {

    private int estado;
    private String descEstado;
    private String placa;
    private int tipoVehiculo;
    private String descVehiculo;
    private String timeIn;
    private String timeOut;
    private int idUserIn;
    private String aliasIn;
    private int idUserOut;
    private String aliasOut;
    private double tPagado;

    public Transaccion() {
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public String getDescEstado() {
        return descEstado;
    }

    public void setDescEstado(String descEstado) {
        this.descEstado = descEstado;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public int getTipoVehiculo() {
        return tipoVehiculo;
    }

    public void setTipoVehiculo(int tipoVehiculo) {
        this.tipoVehiculo = tipoVehiculo;
    }

    public String getDescVehiculo() {
        return descVehiculo;
    }

    public void setDescVehiculo(String descVehiculo) {
        this.descVehiculo = descVehiculo;
    }

    public String getTimeIn() {
        return timeIn;
    }

    public void setTimeIn(String timeIn) {
        this.timeIn = timeIn;
    }

    public String getTimeOut() {
        return timeOut;
    }

    public void setTimeOut(String timeOut) {
        this.timeOut = timeOut;
    }

    public int getIdUserIn() {
        return idUserIn;
    }

    public void setIdUserIn(int idUserIn) {
        this.idUserIn = idUserIn;
    }

    public String getAliasIn() {
        return aliasIn;
    }

    public void setAliasIn(String aliasIn) {
        this.aliasIn = aliasIn;
    }

    public int getIdUserOut() {
        return idUserOut;
    }

    public void setIdUserOut(int idUserOut) {
        this.idUserOut = idUserOut;
    }

    public String getAliasOut() {
        return aliasOut;
    }

    public void setAliasOut(String aliasOut) {
        this.aliasOut = aliasOut;
    }

    public double gettPagado() {
        return tPagado;
    }

    public void settPagado(double tPagado) {
        this.tPagado = tPagado;
    }
    
    public int contarPlacas(String BD)throws SQLException {
        int i = 0;  
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM "+BD+" WHERE placa='"+this.placa+"';";

        ResultSet rs = conexion.consultarBD(sql);
        if (rs.next()) {
           
            i++;

        } else {
            conexion.cerrarConexion();
            
        }
        
        return i;
    }

    public boolean ingresoVehiculo() throws SQLException  {
        
        if( this.placa== null){
           
           return false;
        }
        
        else{
        
            int i;
            i=contarPlacas("ingresos");
            
            if (i==0){
                                     
                LocalDateTime dateTime = LocalDateTime.now();
                String horaAhora = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm").format(dateTime);
                setTimeIn(horaAhora);
                ConexionBD conexion = new ConexionBD();
                String sql = "INSERT INTO ingresos (placa, idTipoVehiculoFK, timeIn, idUserInFK)"+
                "VALUES ('"+this.placa+"',"+this.tipoVehiculo+",'"+this.timeIn+"','"+this.idUserIn+"');";
        
                if (conexion.setAutoCommitBD(false)) {
               
                    if (conexion.insertarBD(sql)) {
                        conexion.commitBD();
                        conexion.cerrarConexion();
                        return true;
                    }
                    else {
                        conexion.rollbackBD();
                        conexion.cerrarConexion();
                        return false;
                    }
                }
           
                else{
                    conexion.cerrarConexion();
                    return false;
                }
            }
        }

    return false;    
    }
    public boolean eliminarIngreso(String placa) {
        ConexionBD conexion = new ConexionBD();
        String sql = "DELETE FROM ingresos WHERE placa = '"+this.placa+"';";
        if (conexion.setAutoCommitBD(false)) {
            if (conexion.actualizarBD(sql)) {
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            }
            else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }
        }
        else {
            conexion.cerrarConexion();
            return false;
        }
    }

    public boolean salidaVehiculo(String placaFE, int idUserOutFE) throws SQLException, ParseException {
        
        if( placaFE== null){
            return false;
        }
        else{
        
        Transaccion tSalida = getTransaccionIngreso(placaFE);
                
        LocalDateTime dateTime = LocalDateTime.now();
        String horaAhora = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm").format(dateTime);
        tSalida.setTimeOut(horaAhora);
        tSalida.settPagado(calcularPago(placaFE));
        tSalida.setEstado(1);
        tSalida.setIdUserOut(idUserOutFE);
        
        
        ConexionBD conexion = new ConexionBD();
        String sql = "INSERT INTO historico"+
                "(placa, idTipoVehiculoFK, timeIn, timeOut, idUserInFK, idUserOutFK, idEstadoFK, tPagado)"+
                "VALUES ('"+this.placa+"',"+this.tipoVehiculo+",'"+this.timeIn+"','"+this.timeOut+
                "','"+this.idUserIn+"','"+this.idUserOut+"',"+this.estado+","+this.tPagado+");";
       
        if (conexion.setAutoCommitBD(false)) {
            if (conexion.actualizarBD(sql)) {
                conexion.commitBD();
                conexion.cerrarConexion();
                eliminarIngreso(this.placa);
                return true;
            }
            else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }
        }
        else {
            conexion.cerrarConexion();
            return false;
        }
    }
    }

    public boolean anularTransaccion(String placaFE, int idUserOutFE) throws SQLException, ParseException {
        
        if( placaFE== null){
             return false   ;
        }
         
        else{
        Transaccion tSalida = getTransaccionIngreso(placaFE);
                
        LocalDateTime dateTime = LocalDateTime.now();
        String horaAhora = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm").format(dateTime);
        tSalida.setTimeOut(horaAhora);
        tSalida.settPagado(calcularPago(placaFE));
        tSalida.setEstado(2);
        tSalida.setIdUserOut(idUserOutFE);
        
        
        ConexionBD conexion = new ConexionBD();
        String sql = "INSERT INTO historico"+
                "(placa, idTipoVehiculoFK, timeIn, timeOut, idUserInFK, idUserOutFK, idEstadoFK, tPagado)"+
                "VALUES ('"+this.placa+"',"+this.tipoVehiculo+",'"+this.timeIn+"','"+this.timeOut+
                "','"+this.idUserIn+"','"+this.idUserOut+"',"+this.estado+","+this.tPagado+");";
        
        if (conexion.setAutoCommitBD(false)) {
            if (conexion.actualizarBD(sql)) {
                conexion.commitBD();
                conexion.cerrarConexion();
                eliminarIngreso(this.placa);
                return true;
            }
            else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }
        }
        else {
            conexion.cerrarConexion();
            return false;
        }
    }
     }

    public List<Transaccion> listarIngresos() throws SQLException {
        ConexionBD conexion = new ConexionBD();
        List<Transaccion> listarTransacciones = new ArrayList<>();
        String sql = "SELECT * FROM ingresos "
                + "INNER JOIN tipovehiculo ON ingresos.idTipoVehiculoFK = tipovehiculo.idTipoVehiculo "
                + "INNER JOIN usuariosregistrados ON ingresos.idUserInFK = usuariosregistrados.idusuarios "
                + "ORDER BY ingresos.timeIn DESC";
        ResultSet rs = conexion.consultarBD(sql);
        Transaccion t;
        while (rs.next()) {
            t = new Transaccion();
            //t.setEstado(rs.getInt("estado")); //esta columna no está en la tabla ingresos
            t.setPlaca(rs.getString("placa"));
            t.setDescVehiculo(rs.getString("descVehiculo"));
            t.setTimeIn(rs.getString("timeIn"));
            //t.setTimeOut(rs.getString("timeOut"));
            t.setAliasIn(rs.getString("alias"));
            //t.setIdUserOut(rs.getString("idUserOut"));
            //t.settPagado(rs.getDouble("tPagado"));
            listarTransacciones.add(t);

        }
        conexion.cerrarConexion();
        return listarTransacciones;
    }
    
    public List<Transaccion> listarHistorico() throws SQLException {
        ConexionBD conexion = new ConexionBD();
        List<Transaccion> listarTransacciones = new ArrayList<>();
        

        String sql = "SELECT placa, t.descVehiculo, timeIn, timeOut, u.alias 'aliasIn', u2.alias 'aliasOut', estado, tPagado"+ 
        " from historico h  inner join  tipovehiculo t ON h.idTipoVehiculoFK = t.idTipoVehiculo"+
        " inner join usuariosregistrados u on h.idUserInFK = u.idusuarios inner join usuariosregistrados u2 on u2.idusuarios = h.idUserOutFK"+
        " inner join estadovehiculo e on h.idEstadoFK = e.idEstado"+
        " ORDER BY h.timeOut DESC";
        
       

        ResultSet rs = conexion.consultarBD(sql);
        Transaccion t;
        while (rs.next()) {
            t = new Transaccion();
            t.setPlaca(rs.getString("placa"));
            t.setDescVehiculo(rs.getString("descVehiculo"));
            t.setTimeIn(rs.getString("timeIn"));
            t.setTimeOut(rs.getString("timeOut"));
            t.setAliasIn(rs.getString("aliasIn"));
            t.setAliasOut(rs.getString("aliasOut"));
            t.setDescEstado(rs.getString("estado"));
            t.settPagado(rs.getDouble("tPagado"));
            listarTransacciones.add(t);

        }
        conexion.cerrarConexion();
        return listarTransacciones;
    }
    
    public long calcularPago(String placaCalcular) throws SQLException, ParseException {
        
        if( placaCalcular== null){
            return 00;
        }
        else{
        Transaccion tSalida; 
        tSalida = getTransaccionIngreso(placaCalcular);
        
        
        
        LocalDateTime dateTime = LocalDateTime.now();
        String horaAhora = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm").format(dateTime);
        tSalida.timeOut = horaAhora;
        
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        java.util.Date salida = df.parse(tSalida.timeOut);
        java.util.Date ingreso=df.parse(tSalida.timeIn);
        long l=salida.getTime()-ingreso.getTime();
        this.tPagado=(l/60000)*200;
        
        return (l/60000)*200;
        
    }
    }
    
    public Transaccion getTransaccionIngreso(String placaIn) throws SQLException {
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM ingresos WHERE placa='"+placaIn+"';";
        
        
        ResultSet rs = conexion.consultarBD(sql);
        if (rs.next()) {
            //this.estado = rs.getInt("estado"); //esta columna no está en la tabla ingresos
            this.placa = rs.getString("placa");
            this.tipoVehiculo = rs.getInt("idTipoVehiculoFK");
            this.timeIn = rs.getString("timeIn");
            this.idUserIn = rs.getInt("idUserInFK");
            conexion.cerrarConexion();
            return this;

        } else {
            conexion.cerrarConexion();
            return null;
        }
       
    }
    
    public Transaccion getTransaccionHistorico() throws SQLException {
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM historico;";
        ResultSet rs = conexion.consultarBD(sql);
        if (rs.next()) {
            this.placa = rs.getString("placa");
            this.tipoVehiculo = rs.getInt("idTipoVehiculoFK");
            this.timeIn = rs.getString("timeIn");
            this.timeOut = rs.getString("timeOut");
            this.idUserIn = rs.getInt("idUserInFK");
            this.idUserOut = rs.getInt("idUserOutFK");
            this.estado = rs.getInt("idEstadoFK");
            this.tPagado = rs.getDouble("tPagado");
            conexion.cerrarConexion();
            return this;

        } else {
            conexion.cerrarConexion();
            return null;
        }
    }


    @Override
    public String toString() {
        return "Transaccion{" + "Estado=" + estado + ", Placa=" + placa + ", Tipo Vehiculo=" + tipoVehiculo + ", Hora Ingreso=" + timeIn + ", Hora Salida=" + timeOut + ", Usuario Ingreso=" + idUserIn + ", Usuario Salida=" + idUserOut + ", Total Pagado=" + tPagado + '}';
    }
}
