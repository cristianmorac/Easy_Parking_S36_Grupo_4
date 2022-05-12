<%-- 

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Easy Parking G4 - S36</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

        <script src = "https://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>  



    </head>
    <body>
        <div class="container-fluid" ng-app = "S36G4" ng-controller = "transaccionesController as cn" >
            <div class="row">
                <div class="col-12 border border-dark rounded-pill p-1 mb-3 bg-dark text-white">
                    <center><h1>Easy Parking G4 - S36</h1></center> 
                </div>
            </div>
            <div class="row">
                
                <div class="col-6 border-right">
                    <center><h3 class="p-2 bg-success text-white rounded-pill">Ingresos</h3></center>
                    <div class="row">
                        <div class="col-6 mb-3">
                           
                            <label >Placa</label>
                            <input class="form-control" type="text" min="0" ng-model="cn.placa" required>
                            
                        </div>
                       <div class="col-6 mb-3">
                            <label>Tipo de vehículo</label>
                             <select class="form-control" ng-model="cn.tipoVehiculo" required>
                                <option value=1>CARRO</option>
                                <option value=2>MOTO</option>
                                <option value=3>BICICLETA</option>
                            </select>
                        
                          
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6 mb-3">
                            <label>Usuario de ingreso</label>
                            <select class="form-control"  ng-model="cn.idUserIn" required>
                                <option value="1">SHUR</option>
                                <option value="2">LIGL</option>
                                <Option value="3">CMOR</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-6 ">
                    <center><h3 class="p-2 bg-secondary text-white rounded-pill">Salidas</h3></center>
                    <form name="fSalida">
                    <div class="row">
                        <div class="col-6">
                            <label >Placa</label>
                            <input class="form-control" type="text" min="0" ng-model="cn.placaOut" required>
                        </div>
                        <div class="col-6 mb-3">
                            <label>Tipo de vehículo</label>
                            <input class="form-control" type="text" value="{{cn.tCalcular.tipoVehiculo}}" disabled="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6 mb-3">
                            <label>Hora de ingreso</label>
                            <input class="form-control" type="text" value="{{cn.tCalcular.timeIn}}" disabled="">
                        </div>
                        <div class="col-6 mb-3">
                            <label>Usuario de ingreso</label>
                            <input class="form-control" type="text" value="{{cn.tCalcular.idUserIn}}" disabled="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6 mb-3">
                            <label>Hora de salida</label>
                            <input class="form-control" type="text" value="{{cn.tCalcular.timeOut}}" disabled="">
                        </div>
                        <div class="col-6 mb-3">
                            <label>Usuario de salida</label>
                            <select class="form-control"  ng-model="cn.idUserOut" required>
                                <option value="1">SHUR</option>
                                <option value="2">LIGL</option>
                                <Option value="3">CMOR</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Total a pagar</label>
                            <input class="form-control" type="text"   ng-model="cn.tCalcular.tPagado" disabled="">
                        </div>
                    </div>
                    </form>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                </div>
            </div>

            <div class="row pt-4" id="mtop-5">
                <div class="col-3">
                    <center><button  class="btn btn-outline-success " ng-click="cn.ingresoVehiculo()">Ingresar vehiculo</button></center>
                </div>
                <div class="col-3">
                    <center><button  class="btn btn-outline-danger" ng-click="cn.anularTransaccion()">Anular transaccion</button></center>
                </div>
                <div class="col-3">
                    <center><button  class="btn btn-outline-primary " ng-click="cn.calcularPago()">Calcular pago</button></center>
                </div>
                <div class="col-3">
                    <center><button  class="btn btn-outline-warning" ng-click="cn.salidaVehiculo();">Salida vehiculo</button></center>
                </div>
            </div>

            <div class="row">
                <div class="col-6 ">
                    <br><h3>Vehiculos Activos</h3>
                </div>
<!--                <div class="col-6">
                    <br><button  class="btn btn-outline-success " ng-click="cn.listarIngresos()">Actualizar</button>
                </div>-->
                <div class="col-12 table-responsive-xl">
                    <table class="table  table-striped table-bordered table-hover">
                        <thead class="thead-dark">
                            <tr>
                                <th style="text-align: center;">Placa</th>
                                <th style="text-align: center;">Tipo de vehiculo</th>
                                <th style="text-align: center;">Usuario de ingreso</th>
                                <th style="text-align: center;">Hora de ingreso</th>
                            </tr>
                        </thead>
                        <tr ng-repeat = "transaccion in cn.ingresos">
                            <td style="text-align: center;">{{ transaccion.placa}}</td>
                            <td style="text-align: center;">{{ transaccion.descVehiculo}}</td>
                            <td style="text-align: center;">{{ transaccion.aliasIn}}</td>
                            <td style="text-align: center;">{{ transaccion.timeIn}}</td>

                        </tr>
                    </table>
                </div>
            </div>

            <div class="row">
                <div class="col-6 ">
                    <br><h3>Histórico Vehiculos</h3>
                </div>
<!--                <div class="col-6">
                    <br><button  class="btn btn-outline-success " ng-click="cn.listarHistorico()">Actualizar</button>
                </div>-->
                <div class="col-12 table-responsive-xl">
                    <table class="table table-striped table-hover">
                        <thead class="thead-dark" >
                            <tr>
                                <th style="text-align: center;">Placa</th></center>
                                <th style="text-align: center;">Tipo de vehiculo</th>
                                <th style="text-align: center;">Usuario de ingreso</th>
                                <th style="text-align: center;">Hora de ingreso</th>
                                <th style="text-align: center;">Usuario de salida</th>
                                <th style="text-align: center;">Hora de salida</th>
                                <th style="text-align: center;">Total pagado</th>
                                <th style="text-align: center;">Estado transacción</th>
                            </tr>
                        </thead>
                        <tr ng-repeat = "transaccion in cn.historico">
                            <td style="text-align: center;">{{transaccion.placa}}</td>
                            <td style="text-align: center;">{{transaccion.descVehiculo}}</td>
                            <td style="text-align: center;">{{transaccion.aliasIn}}</td>
                            <td style="text-align: center;">{{transaccion.timeIn}}</td>
                            <td style="text-align: center;">{{transaccion.aliasOut}}</td>
                            <td style="text-align: center;">{{transaccion.timeOut}}</td>
                            <td style="text-align: center;">{{transaccion.tPagado}}</td>
                            <td style="text-align: center;">{{transaccion.descEstado}}</td>
                        </tr>
                    </table>
                </div>
            </div>

        </div>

    </body>
    <script>
        var app = angular.module('S36G4', []);
        app.controller('transaccionesController', ['$http', controladorTransacciones]);

               
        function controladorTransacciones($http) {
            var cn = this;

            cn.listarIngresos = function () {
                var url = "Peticiones.jsp";
                var params = {
                    proceso: "listarIngresos"
                };
                $http({
                    method: 'POST',
                    url: 'Peticiones.jsp',
                    params: params
                }).then(function (res) {
                    cn.ingresos = res.data.ingresos;
                });
            };

            cn.listarHistorico = function () {
                var url = "Peticiones.jsp";
                var params = {
                    proceso: "listarHistorico"
                };
                $http({
                    method: 'POST',
                    url: 'Peticiones.jsp',
                    params: params
                }).then(function (res) {
                    cn.historico = res.data.historico;
                });

            };
            
            cn.ingresoVehiculo = function () {
                
                var transaccion = {
                    proceso: "ingresoVehiculo",
                    placa: cn.placa,
                    tipoVehiculo: cn.tipoVehiculo,
                    idUserIn: cn.idUserIn
                };
                console.log(transaccion);
                $http({
                    method: 'POST',
                    url: 'Peticiones.jsp',
                    params: transaccion
                }).then(function (res) {
                    if (res.data.ok === true) {
                        if (res.data[transaccion.proceso] === true) {
                            cn.listarIngresos();
                            cn.listarHistorico();
                            alert("Guardado con éxito");
                            
                            cn.placa='';
                            cn.tipoVehiculo='';
                            cn.idUserIn='';
                            
                        } else {
                            alert("No se guardo. Por favor vefifique sus datos");
                        }
                    } else {
                        alert(res.data.errorMsg);
                    }
                });
            };

            cn.anularTransaccion = function () {
                var transaccion = {
                    proceso: "anularTransaccion",
                    placa: cn.placaOut,
                    idUserOut: cn.idUserOut
                };
                $http({
                    method: 'POST',
                    url: 'Peticiones.jsp',
                    params: transaccion
                }).then(function (res) {
                    if (res.data.ok === true) {
                        if (res.data[transaccion.proceso] === true) {
                            alert("Anulado con éxito");
                            cn.placa='';
                            cn.tipoVehiculo='';
                            cn.idUserIn='';
                            cn.listarIngresos();
                            cn.listarHistorico();
                        } else {
                            alert("Por favor verifique sus datos");
                        }
                    } else {
                        alert(res.data.errorMsg);
                    }
                });
            };

            cn.salidaVehiculo = function () {
                cn.calcularPago();
                var transaccion = {
                    proceso: "salidaVehiculo",
                    placa: cn.placaOut,
                    idUserOut: cn.idUserOut
                };
                $http({
                    method: 'POST',
                    url: 'Peticiones.jsp',
                    params: transaccion
                }).then(function (res) {
                    if (res.data.ok === true) {
                        if (res.data[transaccion.proceso] === true) {
                            alert("Salida del vehiculo con éxito");
                            cn.listarIngresos();
                            cn.listarHistorico();
                            cn.placaOut='';
                            cn.tipoVehiculo='';
                            cn.idUserOut='';
                            cn.tCalcular.tPagado='';
                            cn.tCalcular.tipoVehiculo='';
                            cn.tCalcular.timeIn='';
                            cn.tCalcular.idUserIn='';
                            cn.tCalcular.timeOut='';
                            cn.tCalcular.idUserOut='';
                            
                            
                        } else {
                            alert("Por favor verifique sus datos");
                        }
                    } else {
                        alert(res.data.errorMsg);
                    }
                });
            };

            cn.calcularPago = function () {
                var url = "Peticiones.jsp";
                var params = {
                    proceso: "calcularPago",
                    placa: cn.placaOut
                };
                $http({
                    method: 'POST',
                    url: 'Peticiones.jsp',
                    params: params
                }).then(function (res) {

                    if (res.data.ok === true) {
                        if (res.data[params.proceso] === true) {
                            cn.tCalcular = res.data.pago;
                            cn.listarIngresos();
                            cn.listarHistorico();
                        } else {
                            alert("Por favor verifique los datos");
                        }
                    } else {
                        alert(res.data.errorMsg);
                    }
                });
            };
            cn.listarHistorico();
            cn.listarIngresos();
        }
    </script>  
</html>
