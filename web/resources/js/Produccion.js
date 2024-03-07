var nombreGalletaG;
var precioPiezaGalletaG = 10;
var precioCajaGalletaG;
var precioGramajeGalletaG;
var tipoVentaG;
var idGalletaG;
var existenciaGalletaG = "";

//Permite llenar los datos de nombre y precio de las galletas. Jessica Delgado 03/12/2023
function datosGalletas(){
    var accion = "datosGalletas";
    var urlBusqueda = "ServletVentas?accion="+accion;
    
    $.ajax({
        type: "POST",
        url: urlBusqueda,
        contentType: "application/json", // Especificar el tipo de contenido como JSON
        success: function(response) {
            console.log("Mensaje del servlet:", response);
            for (var i = 0; i < response.length; i++) {
                var galleta = response[i];
                var idGalletaFor = i + 1;
                
                var contenedor = $("#datosGalletas" + idGalletaFor);
                contenedor.find("#nombreGalleta").text(galleta.nombre);
                contenedor.find("#existenciaGalleta").text(galleta.existencia+" galleta(s)");
                contenedor.find("#idGalleta").text(galleta.idGalleta);
                
            }
        },
        error: function(xhr, status, error) {
          // Manejar errores
          console.error("Error:", error);
        }
    });   
}

function consultarExistenciaGalletas(){
    console.log(idGalletaG);
    
    var accion = "consultarExistenciaGalletas";
    var urlBusqueda = "ServletVentas?accion="+accion;   
    var datos = {
        idGalletaG: idGalletaG
    };
    $.ajax({
        type: "POST",
        url: urlBusqueda,
        contentType: "application/json",
        data: JSON.stringify(datos),
        success: function(response) {
            console.log("Respuesta Totales Servlet:", response);
            existenciaGalletaG = parseInt(response);
            console.log(existenciaGalletaG);
            // Haz lo que necesites con la respuesta del servlet
        },
        error: function(xhr, status, error) {
          console.error("Error:", error);
        }
    });   
}
function agregarTandaGalletas(){
    consultarExistenciaGalletas();    
    setTimeout(function() {
        console.log(existenciaGalletaG);
        var existenciaNueva = existenciaGalletaG + 120;
        
        var accion = "actualizarExistenciaGalletas";
        var urlBusqueda = "ServletVentas?accion="+accion;   
        var datos = {
            idGalletaG: idGalletaG,
            existenciaNueva: existenciaNueva
        };
        $.ajax({
            type: "POST",
            url: urlBusqueda,
            contentType: "application/json",
            data: JSON.stringify(datos),
            success: function(response) {
                console.log("Respuesta Totales Servlet:", response);
                Swal.fire({
                    title: 'Tanda Agregada Correctamente',
                    text: response, // Mostrar la respuesta del servlet
                    icon: 'success',
                    confirmButtonText: 'OK'
                }).then((result) => {
                    if (result.isConfirmed) {
                        // Recargar la página después de confirmar
                        location.reload();
                    }
                });
            },
            error: function(xhr, status, error) {
              console.error("Error:", error);
            }
        });
        
    }, 2000);
}

function activarFormulariosCantidadEliminar(){
    console.log("entro a activar formulario");
    $("#formulariosCantidadEliminar").show(); 
}
function desactivarFormulariosCantidadEliminar(){
    $("#formulariosCantidadEliminar").hide();
    location.reload();
}


function eliminarGalletas() {
    consultarExistenciaGalletas();
    var cantidadEliminar = 0;
    var existenciaNueva = 0;
    setTimeout(function() {
        cantidadEliminar = parseInt($("#cantidadEliminar").val());
        var motivoEliminar = $("#motivoEliminar").val();        
        existenciaNueva = existenciaGalletaG - cantidadEliminar;

        if (cantidadEliminar > existenciaGalletaG) {
            // Mostrar mensaje de error si la cantidad a eliminar es mayor que la existencia
            Swal.fire({
                title: 'Error',
                text: 'No puedes eliminar más de la cantidad existente',
                icon: 'error',
                confirmButtonText: 'OK'
            });
        } else {
            var accion = "insertarGalletasEliminadas";
            var urlBusqueda = "ServletVentas?accion="+accion;
            var datos = {
                nombre: nombreGalletaG,
                cantidad: cantidadEliminar,
                motivo: motivoEliminar,
                idGalletaG: idGalletaG,
                existenciaNueva: existenciaNueva
            };

            $.ajax({
                type: "POST",
                url: urlBusqueda,
                contentType: "application/json",
                data: JSON.stringify(datos),
                success: function(response) {
                    console.log("Respuesta Totales Servlet:", response);
                    Swal.fire({
                        title: 'Eliminación Correcta',
                        text: response, // Mostrar la respuesta del servlet
                        icon: 'success',
                        confirmButtonText: 'OK'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            location.reload();
                        }
                    });
                },
                error: function(xhr, status, error) {
                    console.error("Error:", error);
                }
            });
        }
    }, 2000);
}


function desactivarGalletas(btnId) {
    
    nombreGalletaG = $(btnId).find("#nombreGalleta").text();
    precioPiezaGalletaG = $(btnId).find("#costoGalleta").text();
    idGalletaG = parseInt($(btnId).find("#idGalleta").text());
    console.log("idGalleta: "+idGalletaG);
    console.log("Nombre Galleta: "+nombreGalletaG);
    console.log("Precio Galleta: "+precioPiezaGalletaG);
    
    // Deshabilitar el botón y cambiar el color
    for (var i = 0; i < 10; i++) {
        var galleta = '#btnGalletas';
        var idBtn = i + 1;
        

        var botonesGalletas = (galleta+idBtn);        
        
        if(botonesGalletas!==btnId){
            
            var esDeshabilitado = $(botonesGalletas).prop("disabled");
            if(!esDeshabilitado){
                $(botonesGalletas).prop("disabled", true);
                $(botonesGalletas).css("background-color", "#555"); 
                document.getElementById("btnAgregar").removeAttribute("disabled"); 
                document.getElementById("btnCancel").removeAttribute("disabled"); 
            }else{
                $(botonesGalletas).prop("disabled", false);
                $(botonesGalletas).css("background-color", "#FFFFFF");
                document.getElementById("btnAgregar").setAttribute("disabled", "disabled");
                document.getElementById("btnCancel").setAttribute("disabled", "disabled");
            }
            
        } 
    }    
}
