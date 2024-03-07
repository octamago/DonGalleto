<%-- 
    Document   : index
    Created on : 16 sep. 2023, 23:39:32
    Author     : Jessica Delgado
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="resources/js/index.js"></script>
        <link rel="stylesheet" type="text/css" href="resources/css/estilosIndex.css">
        <script src="resources/js/Ventas.js"></script>
        <title>Ventas</title>
        
        <!-- Fuentes -->
        <link href='https://fonts.googleapis.com/css?family=Open Sans' rel='stylesheet'>    
        <!-- Bootstrap CSS -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css">
        
    </head>
    <body id="contenedorIndex">  
        <nav class="navbar navbar-light bg-light">
            <div class="containerNav">
                <a class="navbar-brand" href="index.jsp">
                    <img src="resources/img/logoPequeñoDonGalleto.png" alt="" height="60" style="margin-left: 10%;">
                    <span>Venta Galletas</span>
                </a>
            </div>
        </nav>
            
        <div class="container">
            <div class="row">
                <p id="msjVenta">TIPO DE GALLETA</p>
                <div class="col-6"> 
                    
                    <!-- INICIA ÁREA DE GALLETAS --> 
                    <div class="row">
                        <div class="col" >
                            <button class="btn btn-light btnGalletas" id="btnGalletas1" onclick="desactivarGalletas('#btnGalletas1')" >
                                <img src="resources/img/galletas/galleta1.png" >
                                <div id="datosGalletas1">
                                    <p id="nombreGalleta">galletita</p>
                                    <p id="existenciaGalleta">$10.00</p>
                                </div>
                            </button>
                            <button class="btn btn-light btnGalletas" id="btnGalletas2" onclick="desactivarGalletas('#btnGalletas2')" >
                                <img src="resources/img/galletas/galleta2.png" >
                                <div id="datosGalletas2">
                                    <p id="nombreGalleta">galletita</p>
                                    <p id="existenciaGalleta">$10.00</p>
                                </div>
                            </button>
                            <button class="btn btn-light btnGalletas" id="btnGalletas3" onclick="desactivarGalletas('#btnGalletas3')" >
                                <img src="resources/img/galletas/galleta3.png" >
                                <div id="datosGalletas3">
                                    <p id="nombreGalleta">galletita</p>
                                    <p id="existenciaGalleta">$10.00</p>
                                </div>
                            </button>
                            <button class="btn btn-light btnGalletas" id="btnGalletas4" onclick="desactivarGalletas('#btnGalletas4')" >
                                <img src="resources/img/galletas/galleta4.png" >
                                <div id="datosGalletas4">
                                    <p id="nombreGalleta">galletita</p>
                                    <p id="existenciaGalleta">$10.00</p>
                                </div>
                            </button>
                            <button class="btn btn-light btnGalletas" id="btnGalletas5" onclick="desactivarGalletas('#btnGalletas5')" >
                                <img src="resources/img/galletas/galleta5.png" >
                                <div id="datosGalletas5">
                                    <p id="nombreGalleta">galletita</p>
                                    <p id="existenciaGalleta">$10.00</p>
                                </div>
                            </button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col" >                            
                            <button class="btn btn-light btnGalletas" id="btnGalletas6" onclick="desactivarGalletas('#btnGalletas6')" >
                                <img src="resources/img/galletas/galleta6.png" >
                                <div id="datosGalletas6">
                                    <p id="nombreGalleta">galletita</p>
                                    <p id="existenciaGalleta">$10.00</p>
                                </div>
                            </button>
                            <button class="btn btn-light btnGalletas" id="btnGalletas7" onclick="desactivarGalletas('#btnGalletas7')" >
                                <img src="resources/img/galletas/galleta7.png" >
                                <div id="datosGalletas7">
                                    <p id="nombreGalleta">galletita</p>
                                    <p id="existenciaGalleta">$10.00</p>
                                </div>                                
                            </button>
                            <button class="btn btn-light btnGalletas" id="btnGalletas8" onclick="desactivarGalletas('#btnGalletas8')" >
                                <img src="resources/img/galletas/galleta8.png" >
                                <div id="datosGalletas8">
                                    <p id="nombreGalleta">galletita</p>
                                    <p id="existenciaGalleta">$10.00</p>
                                </div>
                            </button>
                            <button class="btn btn-light btnGalletas" id="btnGalletas9" onclick="desactivarGalletas('#btnGalletas9')" >
                                <img src="resources/img/galletas/galleta9.png" >
                                <div id="datosGalletas9">
                                    <p id="nombreGalleta">galletita</p>
                                    <p id="existenciaGalleta">$10.00</p>
                                </div>
                            </button>
                            <button class="btn btn-light btnGalletas" id="btnGalletas10"  onclick="desactivarGalletas('#btnGalletas10')" >
                                <img src="resources/img/galletas/galleta10.png" >
                                <div id="datosGalletas10">
                                    <p id="nombreGalleta">galletita</p>
                                    <p id="existenciaGalleta">$10.00</p>
                                </div>
                            </button>
                        </div>
                    </div>
                    <!-- TERMINA ÁREA DE GALLETAS -->
                    
                    <!-- INICIA ESPECIFICACIÓN COMPRA -->
                    <div class="row">
                        
                        <div class="col" id="formularioTipoVenta" >                            
                        <p id="msjVenta">SELECCIONA EL TIPO DE VENTA</p>
                            <button class="btn btn-light btnTipoVenta" id="btnTipoVenta1" onclick="desactivarTipoVenta('#btnTipoVenta1','#formulariosVentaPieza')">
                                <img src="resources/img/iconoPieza.png" >PIEZA
                            </button>
                            <button class="btn btn-light btnTipoVenta" id="btnTipoVenta2" onclick="desactivarTipoVenta('#btnTipoVenta2','#formulariosVentaCaja')">
                                <img src="resources/img/iconoCaja.png" >CAJA
                            </button>
                            <button class="btn btn-light btnTipoVenta" id="btnTipoVenta3" onclick="desactivarTipoVenta('#btnTipoVenta3','#formulariosVentaGramaje')">
                                <img src="resources/img/iconoGranaje.png" >GRAMAJE
                            </button>                            
                        </div>
                    </div>
                    <!-- TERMINA ESPECIFICACIÓN COMPRA -->
                    
                </div>
                
                <div class="col">
                    
                    <!-- FORMULARIO POR PIEZA-->
                    <div id="formulariosVentaPieza" >
                        
                        <div class="input-group mb-3"">
                            <span class="input-group-text" >Cantidad: </span>
                            <input type="number" class="form-control" placeholder="0" id="formPieza" name="formPieza" min="1">
                            <span class="input-group-text" >PIEZA</span>
                        </div>
                        
                        <button class="btn btn-light" id="btnAgregar" onclick="agregar('formulariosVentaPieza')">AGREGAR</button>
                        <button class="btn btn-light" id="btnCancel" onclick="reiniciarTodo()">CANCELAR</button>
                    </div>
                    
                    <!-- FORMULARIO POR CAJA-->
                    <div id="formulariosVentaCaja" >
                        <div class="input-group mb-3">
                            <span class="input-group-text" >Cantidad: </span>
                            <input type="number" class="form-control" placeholder="0" id="formCaja" name="formCaja">
                            <span class="input-group-text">CAJA(S)</span>
                        </div>
                                                
                        <button class="btn btn-light" id="btnAgregar" onclick="agregar('formulariosVentaCaja')">AGREGAR</button>
                        <button class="btn btn-light" id="btnCancel" onclick="reiniciarTodo()">CANCELAR</button>
                    </div>
                    
                    <!-- FORMULARIO POR CANTIDAD-->
                    <div id="formulariosVentaGramaje" >
                        
                        <div class="form-check">
                            
                            <input class="form-check-input" type="radio" name="frmRadio" id="radioPrecio" value="option1" checked>
                            <label class="form-check-label" for="lblRadioPrecio">
                                $
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="frmRadio" id="radioGramos" value="option2">
                            <label class="form-check-label" for="lblRadioGramos">
                                Gramos
                            </label>
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text" >Cantidad: </span>
                            <input type="text" class="form-control" placeholder="0" id="formCantidad" name="formCantidad" >
                        </div>                        
                        
                        <button class="btn btn-light" id="btnAgregar" onclick="agregar('formulariosVentaGramaje')">AGREGAR</button>
                        <button class="btn btn-light" id="btnCancel" onclick="reiniciarTodo()">CANCELAR</button>
                    </div>
                </div>
                <div class="col">
                    <table id="tablaProductos" class="table table-bordered table-hover" >
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>No.</th>
                                <th>Unidad</th>
                                <th>Total</th> 
                            </tr>
                        </thead>
                        <tbody>
                            
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    
    
   
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.4.2/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.print.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", datosGalletas);
        $(document).ready(function () {
            obtenerPrecioCaja();
            obtenerPrecioGramaje();

            // Inicializar la tabla
            var table = $('#tablaProductos').DataTable({
                info: false,
                ordering: true,
                scrollY: true,
                paging: false,
                searching: false,
                select: true,
                dom: 'Bfrtip',
                language: {
                    emptyTable: "No hay galletas agregadas.",
                    infoEmpty: "Mostrando 0 a 0 de 0 entradas"
                },
                buttons: [
                    {
                        extend: 'print',
                        text: 'Finalizar Venta',
                        title: '<h2><img src="resources/img/logoPequeñoDonGalleto.png" style="width: 20%;" /> ¡Gracias por su compra!</h2>',
                        messageTop: '¡Provechito!',
                        className: 'btn-imprimir',
                        action: function (e, dt, button, config) {
                            console.log("entro aquí finalizar Compra");
                            var data = table.rows().data().toArray(); // Obtener los datos de las filas
                            
                            
                            //return;
                            var counter = 0;
                            var totalAjaxCalls = data.length;
                            data.forEach(function(rowData) {
                                var datos = {
                                    nombreGalleta: rowData[0], //nombre
                                    cantidad: rowData[1], //cantidad
                                    tipoVenta: rowData[2], //tipoVenta
                                    totalHistoricoVenta: rowData[3] //total
                                };                               
                                
                                $.ajax({
                                    type: "POST",
                                    url: "ServletVentas?accion=insertarVenta", // URL para la inserción
                                    contentType: "application/json",
                                    data: JSON.stringify(datos),
                                    success: function(response) {
                                        console.log("Mensaje del servlet:", response);
                                        counter++;
                                        // Si todas las llamadas AJAX han finalizado
                                        if (counter === totalAjaxCalls) {
                                            var sumaTotal = 0;
                                            table.rows().every(function () {
                                                var rowData = this.data();
                                                sumaTotal += parseInt(rowData[3]);
                                            });
                                            console.log("Total Venta: " + sumaTotal);
                                            insertarVentasTotales(sumaTotal);
                                        }
                                    },
                                    error: function(xhr, status, error) {
                                        console.error("Error:", error);
                                    }
                                });
                            });                            
                            
                            Swal.fire({
                                title: '¿Desea imprimir el ticket?',
                                text: 'Por favor, confirme para continuar',
                                icon: 'question',
                                showCancelButton: true,
                                confirmButtonColor: '#3085d6',
                                cancelButtonColor: '#d33',
                                confirmButtonText: 'Sí, imprimir'
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    $.fn.dataTable.ext.buttons.print.action(e, dt, button, config);
                                    table.clear().draw();
                                }else{
                                    table.clear().draw();
                                }
                            });
                            
                        }
                    }
                ]
            });

            // Evento de doble clic para eliminar una fila
            $('#tablaProductos tbody').on('dblclick', 'tr', function () {
                var data = table.row(this).data(); // Obtener datos de la fila

                // Mostrar el diálogo de SweetAlert2 para confirmar la eliminación
                Swal.fire({
                    title: '¿Estás seguro?',
                    text: '¿Quieres eliminar esta fila?',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Sí, eliminar'
                }).then((result) => {
                    if (result.isConfirmed) {
                        table.row(this).remove().draw(); // Eliminar la fila si se confirma
                        Swal.fire('¡Eliminado!', 'La fila ha sido eliminada.', 'success');
                    }
                });
            });
        });
    </script>
    

    </body>
</html>
