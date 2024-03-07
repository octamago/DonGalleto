var nombreGalletaG;
var precioPiezaGalletaG = 10;
var precioCajaGalletaG;
var precioGramajeGalletaG;
var tipoVentaG;

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
                var idGalleta = i + 1;
                
                var contenedor = $("#datosGalletas" + idGalleta);
                contenedor.find("#nombreGalleta").text(galleta.nombre);
                contenedor.find("#costoGalleta").text("$" + galleta.precio);
            }
        },
        error: function(xhr, status, error) {
          // Manejar errores
          console.error("Error:", error);
        }
    });   
}

function obtenerPrecioCaja(){
    var accion = "precioCaja";
    var urlBusqueda = "ServletVentas?accion="+accion;   
    $.ajax({
        type: "POST",
        url: urlBusqueda,
        contentType: "application/json",
        success: function(response) {
            console.log("Mensaje del servlet:", response);
            precioCajaGalletaG = parseInt(response);
        },
        error: function(xhr, status, error) {
          console.error("Error:", error);
        }
    });   
}
function obtenerPrecioGramaje(){
    var accion = "precioGranaje";
    var urlBusqueda = "ServletVentas?accion="+accion;   
    $.ajax({
        type: "POST",
        url: urlBusqueda,
        contentType: "application/json",
        success: function(response) {
            console.log("Mensaje del servlet:", response);  
            precioGramajeGalletaG = parseInt(response);
        },
        error: function(xhr, status, error) {
          console.error("Error:", error);
        }
    });   
}

function insertarVentasTotales(totalVenta){
    var accion = "insertarVentaTotal";
    var urlBusqueda = "ServletVentas?accion="+accion;   
    var datos = {
        totalHistoricoVenta: totalVenta
    };
    $.ajax({
        type: "POST",
        url: urlBusqueda,
        contentType: "application/json",
        data: JSON.stringify(datos),
        success: function(response) {
            console.log("Respuesta Totales Servlet:", response);
            // Haz lo que necesites con la respuesta del servlet
        },
        error: function(xhr, status, error) {
          console.error("Error:", error);
        }
    });   
}

function desactivarGalletas(btnId) {
    
    nombreGalletaG = $(btnId).find("#nombreGalleta").text();
    precioPiezaGalletaG = $(btnId).find("#costoGalleta").text();
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
                $("#formularioTipoVenta").show();    
            }else{
                $(botonesGalletas).prop("disabled", false);
                $(botonesGalletas).css("background-color", "#FFFFFF");
                $("#formularioTipoVenta").hide();
            }
            
        } 
    }    
}
function desactivarTipoVenta(btnId,idForm) {
    // Deshabilitar el botón y cambiar el color
    for (var i = 0; i < 3; i++) {
        var galleta = '#btnTipoVenta';
        var idBtn = i + 1;

        var botonesGalletas = (galleta+idBtn);
        if(botonesGalletas!==btnId){
            
            var esDeshabilitado = $(botonesGalletas).prop("disabled");
            if(!esDeshabilitado){
                $(botonesGalletas).prop("disabled", true);
                $(botonesGalletas).css("background-color", "#555"); // Cambia el color a un tono más oscuro
                $(idForm).show();
            }else{
                $(botonesGalletas).prop("disabled", false);
                $(botonesGalletas).css("background-color", "#FFFFFF");
                $(idForm).hide();
            }
            
        } 
    }    
}

function reiniciarTodo(){
    //Limpiar Cajas
    $("#formPieza").value = '';
    $("#formCaja").value = '';
    $("#formCantidad").value = '';
    //OcultarFormularios
    $("#formulariosVentaPieza").hide();
    $("#formulariosVentaCaja").hide();
    $("#formulariosVentaGramaje").hide();
    //Regresar a la normalidad el formulario de tipoVenta
    for (var i = 0; i < 3; i++) {
        var galleta = '#btnTipoVenta';
        var idBtn = i + 1;
        var botonesGalletas = (galleta+idBtn);        
        $(botonesGalletas).prop("disabled", false);
        $(botonesGalletas).css("background-color", "#FFFFFF");
    }
    //Oculta el formulario TipoVenta y Habilita todas las galletas
    for (var i = 0; i < 10; i++) {
        var galleta = '#btnGalletas';
        var idBtn = i + 1;        

        var botonesGalletas = (galleta+idBtn);
        $(botonesGalletas).prop("disabled", false);
        $(botonesGalletas).css("background-color", "#FFFFFF");
        $("#formularioTipoVenta").hide();
    }
}

function agregar(idForm) {
    // Obtener los valores del formulario
    
    var nombreProducto; 
    var cantidad; 
    var total;
    var unidad;
    //Tomando en cuenta que una galleta pesa 10 gramos
    if(idForm==="formulariosVentaPieza"){
        //PIEZA
        nombreProducto = nombreGalletaG; 
        cantidad = parseInt($("#formPieza").val()); 
        total = (cantidad*10);
        unidad = "PZ";
    }else if(idForm==="formulariosVentaCaja"){
        //CAJA
        nombreProducto = nombreGalletaG;  
        cantidad = parseInt($("#formCaja").val()); 
        total = (cantidad*precioCajaGalletaG);
        unidad = "CAJA";
    }else if(idForm==="formulariosVentaGramaje"){
        //GRAMAJE
        
        var radios = document.querySelectorAll('input[name="frmRadio"]');
        var radioSeleccionado;
        for (var i = 0; i < radios.length; i++) {
            if (radios[i].checked) {
                radioSeleccionado = radios[i].value;
                break;
            }
        }
        //Se definen valores según el botón seleccionado
        nombreProducto = nombreGalletaG;
        if(radioSeleccionado === "option1"){
            //Cantidad $
            total = parseInt($("#formCantidad").val());
            cantidad = (total/precioGramajeGalletaG); 
            unidad = "$";
        }else if(radioSeleccionado==="option2"){
            //Gramos %
            cantidad = (parseInt($("#formCantidad").val()))/10;
            var costoXgramo = precioGramajeGalletaG/10;
            total = costoXgramo*parseInt($("#formCantidad").val());
            unidad = "GRAMOS";
        }       
    }
    console.log(idForm);
    console.log("Nombre: "+nombreProducto);
    console.log("Cantidad: "+cantidad);
    console.log("Total: "+total);
    
    
    console.log("Costo por caja: "+precioCajaGalletaG);
    console.log("Costo por grsmaje: "+precioGramajeGalletaG);
    

    // Validar si la cantidad es mayor que cero antes de agregar la fila
    if (parseInt(cantidad) > 0) {
        // Agregar una nueva fila a la tabla
        var table = $("#tablaProductos").DataTable();
        table.row.add([nombreProducto, cantidad,unidad, total]).draw();

        // Limpiar el formulario        
        reiniciarTodo();
    } else {
        alert("La cantidad debe ser mayor que cero");
    }
}


