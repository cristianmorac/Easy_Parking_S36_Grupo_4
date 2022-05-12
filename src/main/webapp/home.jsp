<%-- 
    Document   : home.jsp
    Created on : 30/09/2021, 12:23:55 AM
    Author     : infometrika
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- CSS only -->
        <!-- GOOGLE FONT -->
        <link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet" />
        <!-- BOOTSTRAP 4 -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
        <!-- SCROOLL REVEAL JS LIBRARY CDN -->
        <script src="https://unpkg.com/scrollreveal/dist/scrollreveal.min.js"></script>
        <!-- CUSTOM CSS -->
        <link rel="stylesheet" href="css/main.css">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
            <a class="navbar-brand" href="#">Easy Parking G4 - S36</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav ml-auto">
                    <a class="nav-item nav-link" href="#header">Ingresos</a>
                    <a class="nav-item nav-link" href="#info-one">Activos</a>
                    <a class="nav-item nav-link" href="#contact">Contacto</a>
                </div>
            </div>
        </nav>

        <!-- SECTION -->
        <section id="header">
            <div class="container mt-5">
                <div class="row">
                    <div class="col-md-4 col-sm-6">
                        <div class="header-content-left">
                            <img src="img/image1.png" style="width: 75%;">
                        </div>
                        <h1>Ingreso de vehiculos</h1>
                    </div>

                    <div class="col-md-4 col-sm-6">
                        <div class="header-content-right">
                            <div class="row">

                                <div class="col-md-8">
                                    <h4>Ingreso de vehiculos</h4>
                                    <form class="card mt-5">
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label >Placa</label>
                                                <input class="form-control" type="text" min="0" ng-model="cn.placa" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Usuario Ingreso</label>
                                                <select class="form-control"  ng-model="cn.idUserIn" required>
                                                    <option>1</option>
                                                    <option>2</option>
                                                    <Option>3</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label>Tipo Vehiculo</label>
                                                <select class="form-control" ng-model="cn.tipoVehiculo" required>
                                                    <option>1</option>
                                                    <option>2</option>
                                                    <option>3</option>
                                                </select>
                                            </div>
                                            <button class="btn btn-outline-secondary btn-block" ng-click="cn.ingresoVehiculo()">
                                                Ingresar
                                            </button>
                                            <button class="btn btn-outline-secondary btn-block" ng-click="cn.anularTransaccion()">
                                                Anular
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6 mt-4">
                        <div class="row">
                            <h4>Salida de vehiculos</h4>
                            <br>                            
                            <form class="card mt-4">

                                <div class="card-body">

                                    <div class="row">
                                        <div class="col-6 mb-3">
                                            <label>Hora Ingreso</label>
<<<<<<< HEAD
                                            <input class="form-control" type="text" value="{{cn.timeIn}}" disabled="">
=======
                                            <input class="form-control" type="text" value="{{cn.tCalcular.timeIn}}" disabled="">
>>>>>>> e422efbf8f61576953787d0881d7e1776f052009
                                            <label >Placa</label>
                                            <input class="form-control" type="text" min="0" ng-model="cn.placaOut" required>
                                        </div>
                                        <div class="col-6 mb-3">
                                            <label>Usuario Ingreso</label>
<<<<<<< HEAD
                                            <input class="form-control" type="text" value="{{cn.idUserIn}}" disabled="">
                                            <label>Tipo Vehículo</label>
                                            <input class="form-control" type="text" value="{{cn.tipoVehiculo}}" disabled="">
=======
                                            <input class="form-control" type="text" value="{{cn.tCalcular.idUserIn}}" disabled="">
                                            <label>Tipo Vehículo</label>
                                            <input class="form-control" type="text" value="{{cn.tCalcular.tipoVehiculo}}" disabled="">
>>>>>>> e422efbf8f61576953787d0881d7e1776f052009
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-6 mb-3">
                                            <label>Hora Salida</label>
<<<<<<< HEAD
                                            <input class="form-control" type="text" value="{{cn.timeOut}}" disabled="">
=======
                                            <input class="form-control" type="text" value="{{cn.tCalcular.timeOut}}" disabled="">
>>>>>>> e422efbf8f61576953787d0881d7e1776f052009
                                        </div>
                                        <div class="col-6 mb-3">
                                            <label>Usuario Salida</label>
                                            <select class="form-control"  ng-model="cn.idUserOut" required>
                                                <option>1</option>
                                                <option>2</option>
                                                <Option>3</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-6">
                                            <label>Total Pagado</label>
<<<<<<< HEAD
                                            <input class="form-control" type="text" value={{cn.tPagado}} disabled="">
=======
                                            <input class="form-control" type="text" value={{cn.tCalcular.tPagado}} disabled="">
>>>>>>> e422efbf8f61576953787d0881d7e1776f052009
                                        </div>
                                    </div>
                                    <br>
                                    <button class="btn btn-outline-secondary btn-block" ng-click="cn.ingresoVehiculo()">
                                        Ingresar
                                    </button>
                                    <button class="btn btn-outline-secondary btn-block" ng-click="cn.anularTransaccion()">
                                        Anular
                                    </button>
                                </div>
                            </form>


                        </div>
                    </div>
                </div>
        </section>

        <section id="testimonial">
            <div class="container">

                <p class="h4">- Tablas de resultatos</p>
            </div>
        </section>

        <section id="info-one">
            <div class="container ">
                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4"" >
                    <div class="col-6 table-responsive-xl">
                        <h3><br>Vehiculos activos</h3>
                        <div col-lg-1>
                            <table class="table table-striped table-hover">  
                                <thead class="thead-dark">
                                    <tr>  
                                        <th>Placa</th>  
                                        <th>Hora Ingreso</th>  
                                        <th>Usuario Ingreso</th>  
                                        <th>Tipo Vehiculo</th>
                                        <th>Acciones</th>
                                    </tr>  
                                </thead>

                                <tr ng-repeat = "transaccion in cn.ingresos">  
                                    <td>{{ transaccion.placa}}</td>  
                                    <td>{{ transaccion.timeIn}}</td>
                                    <td>{{ transaccion.idUserIn}}</td> 
                                    <td>{{ transaccion.tipoVehiculo}}</td>
                                    <td><button  class="btn btn-outline-success " ng-click="cn.listarHistorico()">Actualizar</button></td>
                                </tr>  
                            </table> 
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section id="info-two">
            <div class="container ">
                <div class="row">
                    <div class="col-6 ">
                        <br><h3>Histórico Vehiculos</h3>
                    </div>
                    <div class="col-6">
                        <br><button  class="btn btn-outline-success " ng-click="cn.listarHistorico()">Actualizar</button>
                    </div>
                    <div class="col-12 table-responsive-xl">
                        <table class="table table-striped table-hover table table-responsive letra">
                            <thead class="thead-dark">
                                <tr>
                                    <th style="text-align: center;">Placa</th></center>
                                    <th style="text-align: center;">Tipo Vehiculo</th>
                                    <th style="text-align: center;">Usuario Ingreso</th>
                                    <th style="text-align: center;">Hora Ingreso</th>
                                    <th style="text-align: center;">Usuario Salida</th>
                                    <th style="text-align: center;">Hora Salida</th>
                                    <th style="text-align: center;">Total Pagado</th>
                                    <th style="text-align: center;">Estado Transacción</th>
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
        </section>

        <footer id="contact">
            <div class="container">
                <div class="row">
                    <div class="col-md-5">
                        <form class="card mt-4">
                            <div class="card-body">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Name">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Email">
                                </div>
                                <div class="form-group">
                                    <textarea cols="30" rows="10" placeholder="Message" class="form-control"></textarea>
                                </div>
                                <button class="btn btn-outline-secondary btn-block">
                                    Send
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </footer>

        <!-- SCRIPTS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
        <!-- SCROOLL REVEAL SCRIPT -->
        <script>
                                    window.sr = ScrollReveal();

                                    sr.reveal('.navbar', {
                                        duration: 2000,
                                        origin: 'bottom'
                                    });

                                    sr.reveal('.header-content-left', {
                                        duration: 2000,
                                        origin: 'top',
                                        distance: '300px'
                                    });

                                    sr.reveal('.header-content-right', {
                                        duration: 2000,
                                        origin: 'right',
                                        distance: '300px'
                                    });

                                    sr.reveal('.header-btn', {
                                        duration: 2000,
                                        delay: 1000,
                                        origin: 'bottom'
                                    });

                                    sr.reveal('#testimonial div', {
                                        duration: 2000,
                                        origin: 'left',
                                        distance: '300px',
                                        viewFactor: 0.2
                                    });

                                    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                                        anchor.addEventListener('click', function (e) {
                                            e.preventDefault();

                                            document.querySelector(this.getAttribute('href')).scrollIntoView({
                                                behavior: 'smooth'
                                            });
                                        });
                                    });
        </script>
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
                }

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
                                alert("Guardado con éxito");
                                cn.listarIngresos();
                                cn.listarHistorico();
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
            }
        </script> 
    </body>
</html>
