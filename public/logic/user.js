var roles = [{
    "value": 1,
    "text": "Usuario"
}, {
    "value": 2,
    "text": "Administrador"
}];

var states = [{
    "value": 0,
    "text": "Inactivo"
}, {
    "value": 1,
    "text": "Activo"
}];




kendo.culture("es-ES");
$(document).ready(function () {

    dataSource = new kendo.data.DataSource({
        transport: {
            read: { url: "/user/read", dataType: "json" },
            update: { url: "/user/update", type: "POST", dataType: "json" },
            destroy: { url: "/user/delete", type: "POST", dataType: "json" },
            create: { url: "/user/create", type: "POST", dataType: "json" },
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
        schema: {
            model: {
                id: "id",
                fields: {
                    id: { editable: true, nullable: false },
                    name: { validation: { required: true, }, type: 'string' },
                    lastname: { validation: { required: true, }, type: 'string' },
                    username: { validation: { required: true, }, type: 'string' },
                    email: { validation: { required: true, }, type: 'string' },
                    status:{validation:{required:true}, type:'string'},
                    rol: { validation: { required: true, }, type: 'string' },
                }
            }
        }
    },
    );

   
    $("#grid").kendoGrid({
        dataSource: dataSource,
        height: 475,
        filterable: true,
        resizable: true,
        pageable: { refresh: true, pageSizes: true, },
        toolbar: ['create','excel'],
        excel: {
            allPages: true,
            fileName: "usuarios.xlsx"
        },
        columns: [
            { field: "name", title: "Nombre", filterable: { multi: true, search: true, search: true } },
            { field: "lastname", title: "Apellido", filterable: { multi: true, search: true, search: true } },
            { field: "username", title: "Username", filterable: { multi: true, search: true, search: true } },
            { field: "email", title: "Correo electronico", filterable: {search: true, multi:true } },
            {field: "status", title:"Estado", values:states,filterable: { search: true, multi:true }},
            { field: "rol", values: roles, title: "Rol", filterable: { multi: true, search: true, search: true } },
            { command: ["edit", "destroy", { text: "Reest contraseña", click: showDetails, iconClass: 'icon icon-chart-column' }], title: "Acciones" }],
        editable: "popup"
    })

    function showDetails(e) {
        e.preventDefault();
        var dataItem = this.dataItem($(e.currentTarget).closest("tr"));
        var confirmacion = confirm('¿Desea reestablecer la contraseña del usuario '+ dataItem.username+'?')

        if (confirmacion) {
            $.post( "/user/updatepassword",{id:dataItem.id}, function( data ) {
                if (data==true) {
                    alert('La contraseña del usuario '+dataItem.username+' ha sido reestablecida correctamente')
                } else {
                    
                }
              });
        }
    }

    
   
    
});
