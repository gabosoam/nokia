var types = [{
    "value": 1,
    "text": "FACTURA"
}, {
    "value": 2,
    "text": "ACTA"
}];

var states = [{
    "value": 0,
    "text": "ABIERTA"
}, {
    "value": 1,
    "text": "CERRADA"
}];


kendo.culture("es-ES");
$(document).ready(function () {

    dataSourceCombo = new kendo.data.DataSource({
        transport: {
            read: {
                url: "/client/read",
                dataType: "json"
            }
        }
    });

    function userNameComboBoxEditor(container, options) {
        $('<input required data-bind="value:' + options.field + '"/>')
            .appendTo(container)
            .kendoComboBox({
                dataSource: dataSourceCombo,
                dataTextField: "name",
                dataValueField: "id",
                filter: "contains",
                minLength: 1
            });
    }

    dataSource = new kendo.data.DataSource({
        transport: {
            read: { url: "/voucher/", type: "GET", dataType: "json" },
            update: { url: "/voucher/update", type: "POST", dataType: "json" },
            destroy: { url: "/voucher/delete", type: "POST", dataType: "json" },
            create: { url: "/voucher/create", type: "POST", dataType: "json" },
            parameterMap: function (options, operation) {
                if (operation !== "read" && options.models) {
                    var datos = options.models[0]
                    return datos;
                }
            }
        },
        batch: true,
        pageSize: 10000,
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
                    id: {editable:false},
                    codigo: {editable:false},
                    client: { validation: { required: true, }, type: 'number' },
                    date: { validation: { type: 'date' },type:'date', },
                    reference: { type: 'string' },
                    user: { type: 'string', defaultValue: user, editable: false, visible: false },
                    state: { type: 'string', editable: false }
                }
            }
        }
    },
    );

    $.get("/client/read2", function (clients) {

        $.get("/user/read2", function (users) {

            $("#grid").kendoGrid({
                dataSource: dataSource,
                height: 475,
                filterable: true,
                sortable: true,
                resizable: true,
                pageable: { refresh: true, pageSizes: true, },
                toolbar: ['create', 'excel'],
                excel: {
                    allPages: true,
                    fileName: "actasEntrega.xlsx"
                },
                columns: [
                    {field: 'id', hidden:true, title: 'Código', filterable: { search: true, multi:true } },
                    {field: 'codigo', title: 'Código', filterable: { search: true, multi:true } },
                    { field: "client", values: clients, editor: userNameComboBoxEditor, title: "Cliente", filterable: { search: true, multi:true } },
                    { field: "date", title: "Fecha",  format: "{0:dd/MM/yyyy}" },
                    { field: "reference", title: "Referencia", filterable: { search: true,multi:true } },
                    { field: "user", values: users, title: "Creado por", filterable: { search: true, multi:true } },
                    { field: "state", values: states, title: "Estado",filterable: { multi: true,search: true } },
                    { command: ["edit", "destroy", { text: "Ver detalles", click: showDetails, iconClass: 'icon icon-chart-column' }], title: "Acciones" }],
                editable: "inline"
            });

        });

    });

    function onchange(e) {
        alert('');
    }


    function showDetails(e) {
        e.preventDefault();

        var dataItem = this.dataItem($(e.currentTarget).closest("tr"));
        location.href = "/voucher/" + dataItem.id;
    }


});
