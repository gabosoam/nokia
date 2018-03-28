

kendo.culture("es-ES");
$(document).ready(function () {

    
   

    dataSourceCombo = new kendo.data.DataSource({
        transport: {
            read: {
                url: "/model/read",
                dataType: "json"
            }
        }
    });

    function comboCodigos(container, options) {
        $('<input required data-bind="value:' + options.field + '"/>')
            .appendTo(container)
            .kendoComboBox({
                dataSource: dataSourceCombo,
                dataTextField: "code",
                dataValueField: "id",
                filter: "contains",
                minLength: 1
            });
    }

    function buscador(sql) {
        alert(sql)
    }





    var socket = io.connect();

    socket.emit('getDates', function (category, brand) {
    dataSource = new kendo.data.DataSource({
        transport:{
            read: {url:"/product/read", dataType: "json"},
            
            create: {url:"/product/create",type:"POST", dataType: "json"},
            
            destroy: { url: "/product/delete", type: "POST", dataType: "json" },
            update: { url: "/product/update", type: "POST", dataType: "json" },
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
                    code: { validation: { required: true, size:13 }, type: 'string' },
                    description: { validation: { required: true, size:13 }, type: 'string' , editable:false},
    
                   
                    brand: { validation: { required: true, }, type: 'string', editable:false },
                    category: { validation: { required: true, }, type: 'string', editable:false },
                  
                }
            }
        }
    },
    );

    

    $.get( "/model/readmodel", function( codes ) {
        $("#grid").kendoGrid({
            dataSource: dataSource,
            height: 475,
            filterable: true,
            columnMenu: true,
            groupable: true,
            resizable: true,
            
            pageable: { refresh: true, pageSizes: true, },
     
            columns: [
              { field: "description", title: "Producto",filterable: { search: true, multi:true } },
                { field: "brand", title: "Marca", filterable: {search: true, multi: true } },
                { field: "category", editable: false, title: "Tipo", filterable: {search: true, multi: true } },
                { field: "code", values: codes, editor: comboCodigos, title: "Código", filterable: {search: true,multi:true } },
                { field: "barcode", title: "Número de serie", filterable: {search: true,multi:true } },
                { command: [{ text: "Historial", click: showDetails, iconClass: 'icon icon-chart-column' }], title: "Acciones" }],
            editable: "popup"
        });
      });
    
   

      function showDetails(e) {
        e.preventDefault();
        var dataItem = this.dataItem($(e.currentTarget).closest("tr"));
        location.href = "/history/" + dataItem.id;
    }

    })


});

function buscar() {
    var code = { text: 'code', value: $('#codigo').val().trim() };
    var barcode = { text: 'barcode', value: $('#serie').val().trim() };
    var fdr = { text: 'fdr', value: $('#fdr').val().trim() };
    var cso = { text: 'cso', value: $('#cso').val().trim() };
    var tipo = { text: 'categoryid', value: $('#Cat').val().trim() };
    var wbs = { text: 'wbs', value: $('#wbs').val().trim() };
    var contrato = { text: 'contrato', value: $('#contrato').val().trim() };
    var area = { text: 'area', value: $('#area').val().trim() };
    var comment = { text: 'comment', value: $('#comment').val().trim() };





    var data = []

    if (codigo.value.trim() != '') { data.push(code) }
    if (barcode.value.trim() != '') { data.push(barcode) }
    if (fdr.value.trim() != '') { data.push(fdr) }
    if (cso.value.trim() != '') { data.push(cso) }
    if (tipo.value.trim() != '') { data.push(tipo) }
    if (wbs.value.trim() != '') { data.push(wbs) }
    if (contrato.value.trim() != '') { data.push(contrato) }
    if (area.value.trim() != '') { data.push(area) }
    if (comment.value.trim() != '') { data.push(comment) }



    sql = "SELECT * FROM v_historico WHERE"
    sqlAll = "SELECT * FROM v_historico";



    for (let i = 0; i < data.length; i++) {
        if (i == 0) {
            sql = sql + " " + data[i].text + " LIKE '%" + data[i].value + "%' ";
        } else {
            sql = sql + " AND " + data[i].text + " LIKE '%" + data[i].value + "%'";
        }

    }
    




    if ($("#grid2").data("kendoGrid")) {
        $("#grid2").data("kendoGrid").destroy();
    }

    if (
        codigo.value.trim() == ''
        && barcode.value.trim() == ''
        && fdr.value.trim() == ''
        && cso.value.trim() == ''
        && tipo.value.trim() == ''
        && wbs.value.trim() == ''
        && contrato.value.trim() == ''
        && area.value.trim() == ''
        && comment.value.trim() == '') {
        sql = sqlAll;
    }



    $.post("/buscar", { sql: sql }, function (data) {


        dataSource = new kendo.data.DataSource({
            data: data,
            schema: {
                model: {
                    id: "id",
                    fields: {

                        date: { validation: { required: true, }, type: 'date' },
                        cant: { validation: { required: true, }, type: 'number' },

                    }
                }
            },
            pageSize: 1000,
        },

        );

        var exportFlag = false;

        $.get("/model/readmodel", function (codes) {
            $("#grid2").kendoGrid({
                dataSource: dataSource,
                height: 475,
                filterable: true,
                toolbar: ['excel'],
                excel: {
                    allPages: true,
                    fileName: "historico.xlsx"
                },
                scrollable: true,
                sortable: true,
                resizable: true,
                groupable:true,



                pageable: { refresh: true, pageSizes: true, },

                columns: [
                    { field: "type2", title: "Transacción", filterable: { search: true, multi: true } },
                    { field: "numero", title: "Número", filterable: { search: true, multi: true } },
                    { field: "date", title: "Fecha", filterable: { search: true, search: true }, format: "{0:dd/MM/yyyy}" },
                    { field: "description", title: "Nombre", filterable: { search: true, multi: true } },
                    { field: "code", title: "Código", filterable: { search: true, multi: true } },
                    { field: "barcode", title: "Serie", filterable: { search: true, multi: true } },
                    { field: "cant", title: "Cant.", filterable: { search: true, multi: false } },
                    { field: "category", editable: false, title: "Tipo", filterable: { search: true, multi: true } },
                    { field: "brand", editable: false, title: "Marca", filterable: { search: true, multi: true } },
                    { field: "fdr", title: "FDR", filterable: { search: true, multi: true } },
                    { field: "cso", title: "CSO", filterable: { search: true, multi: true } },
                    { field: "wbs", title: "WBS", filterable: { search: true, multi: true } },
                    { field: "contrato", title: "Contrato", filterable: { search: true, multi: true } },
                    { field: "location", hidden: false, title: "Ubicación", filterable: { search: true, multi: true } },
                    { field: "name", title: "Proveedor", filterable: { search: true, multi: true } },
                    { field: "company", title: "Empresa", filterable: { search: true, multi: true } },
                    { field: "client", title: "Cliente", filterable: { search: true, multi: true } },
                    { field: "clientcompany", title: "Empresa", filterable: { search: true, multi: true } },
                    { field: "user", hidden: true, title: "Realizado por", filterable: { search: true, multi: true } },
                    { field: "area", hidden: true, title: "Área", filterable: { search: true, multi: true } },
                    { field: "comment", hidden: true, title: "Comentario", filterable: { search: true, multi: true } },
                    { field: "reference", hidden: true, title: "Referencia", filterable: { search: true, multi: true } },
                    

                    { command: [{ text: "Historial", click: showDetails, iconClass: 'icon icon-chart-column' }], title: "Acciones" }],

                dataBound: function () {
                    // var grid = $("#grid2").data("kendoGrid");
                    // for (var i = 0; i < grid.columns.length; i++) {
                    //     grid.autoFitColumn(i);
                    // }
                },



                excelExport: exportExcel,
                editable: "popup"
            });
        });

        var exportFlag = false;

        function exportExcel(e) {

            if (!exportFlag) {
                e.sender.showColumn(17);
                e.sender.showColumn(18);
                e.sender.showColumn(19);
                e.sender.showColumn(20);
                e.preventDefault();
                exportFlag = true;
                setTimeout(function () {
                    e.sender.saveAsExcel();
                });
            } else {
                e.sender.hideColumn(17);
                e.sender.hideColumn(18);
                e.sender.showColumn(19);
                e.sender.showColumn(20);
                exportFlag = false;
            }
        }



        function showDetails(e) {
            e.preventDefault();
            var dataItem = this.dataItem($(e.currentTarget).closest("tr"));
            location.href = "/existence/" + dataItem.product;
        }
    });
}