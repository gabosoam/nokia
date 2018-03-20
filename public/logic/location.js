var roles = [{
    "value": 1,
    "text": "Usuario"
}, {
    "value": 2,
    "text": "Administrador"
}];



kendo.culture("es-ES");
$(document).ready(function () {

    dataSource = new kendo.data.DataSource({
        transport: {
            read: { url: "/location/read", dataType: "json" },
            update: { url: "/location/update", type: "POST", dataType: "json" },
            destroy: { url: "/location/delete", type: "POST", dataType: "json" },
            create: { url: "/location/create", type: "POST", dataType: "json" },
            parameterMap: function (options, operation) {
                if (operation !== "read" && options.models) {
                    var datos = options.models[0]
                    return datos;
                }
            }
        },
        batch: true,
        pageSize: 10,
        serverFiltering: false,
        requestEnd: function (e) {
            if (e.type != "read") {
                // refresh the grid
                e.sender.read();
            }
        },
        schema: {
            model: {
                id: "id",
                fields: {
                    name: { validation: { required: true, }, type: 'string' }
                }
            }
        }
    },
    );

    
    $("#grid").kendoGrid({
        dataSource: dataSource,
        height: 475,
        filterable: true,
        sortable: true,

        resizable: true,
        pageable: { refresh: true, pageSizes: true, },
        toolbar: ['create','excel'],
        excel: {
            allPages: true,
            fileName: "ubicaciones.xlsx"
        },
        columns: [
            { field: "name", title: "Ubicación", filterable: { multi: true, search: true, search: true } },
            { command: ["edit", "destroy"], title: "Acciones" }],
        editable: "inline"
    });
});
function redirect(location) {
    window.location.href = location;
}


/* sdsc
Se completó el desarrollo de la versión 1.0 del sistema de automatización de control de inventario "NOKIA", con las siguientes funcionalidades.

Inicio
Control de existencias
En este módulo el usuario puede visualizar el número de veces que un producto ha ingresado, el número de veces que ha sido entegado y el total que se encuentra en bodeda.
El usuario puede fitrar por: código, nombre, número de serie, tipo y marca, además puede exportar los resultados en formato excel.

Historial 
En este módulo el usuario puede realizar seguimiento de cada uno de los productos, visualizando el detalle de cada ingreso y entrega.
El usuario puede filtrar por: código, FDR, tipo, contrato, número de serie, CSO y WBS. Además puede exportar los resultados en formato excel.

Productos
Tipos
En este módulo el usuario puede crear, modificar, editar y eliminar tipos que clasificarán a los productos según un criterio o jerarquía.
Además el usuario puede exportar los tipos a formato excel.

Marcas
En este módulo el usuario puede crear, modificar, editar y eliminar marcas que identifican los productos de un proveedor y distinguirlos de los competidores
Además el usuario puede exportar las marcas a formato excel.

Códigos
En este módulo el usuario puede crear, modificar, editar y eliminar códigos de cada uno de los productos.
Además el usuario puede exportar los códigos a formato excel.

Números de serie
En este módulo el usuario puede crear, modificar, editar y eliminar números de serie de cada uno de los productos.
Además el usuario puede exportar los números de serie a formato excel.

Ingresos 
En este módulo el usuario puede gestionar actas de ingreso con la siguiente información: proveedor, fecha, tipo de documento y referencía, automaticamente el sistema asignará un número al acta.

Detalle de ingreso
En este módulo el usuario puede realizar el ingreso de productos a bodega de forma individual o por lotes, con la siguiente información: código, número de serie, FDR, CSO, WBS, contrato, área, comentario y ubicación.

Etiquetas
En este módulo el usuario puede imprimir etiquetas de los productos que se encuentran en bodega con la siguiente información: código, nombre, número de serie, ubicación y cantidad.

Entregas
En este módulo el usuario puede gestionar actas de entrega con la siguiente información: cliente, fecha y referencía, automaticamente el sistema asignará un número al acta.

Detalle de entrega
En este módulo el usuario puede realizar la entrega de productos  de forma individual, con la siguiente información: código, número de serie, FDR, CSO, WBS, contrato, área y comentario.

Cliente
En este módulo el usuario puede crear, modificar y eliminar clientes del sistema, la información de los clientes se utilizará para registrar las entregas.

Proveedores
En este módulo el usuario puede crear, modificar y eliminar proveedores del sistema, la información de los proveedores se utilizará para registrar los ingresos.

Configuración
En este módulo el usuario puede modificar su contraseña.

Administrador

Control de existencias
En este módulo el administrador puede visualizar el número de veces que un producto ha ingresado, el número de veces que ha sido entegado y el total que se encuentra en bodeda.
El administrador puede fitrar por: código, nombre, número de serie, tipo y marca, además puede exportar los resultados en formato excel.

Detalle de ingresos 
En este módulo el administrador puede editar actas de ingreso.

Detalle de entregas 
En este módulo el administrador puede editar actas de entrega.

Usuarios
En este módulo el administrador puede crear, editar, eliminar usuarios que tienen acceso al sistema, además permite reestablecer la contraseña de los usuarios registrados.



sdcsdc */