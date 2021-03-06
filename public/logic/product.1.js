
$('#btnPrint').hide();
$('#btnPrint2').hide();

var validator = $("#formsave").kendoValidator().data("kendoValidator");
var validatorModel = $("#formSaveModel").kendoValidator().data("kendoValidator");
$("#save").on("click", function () {
    if (validator.validate()) {
        save();
    }
});

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


dataSourceCategorias = new kendo.data.DataSource({
    transport: {
        read: {
            url: "/category/read",
            dataType: "json"
        }
    }
});

function comboCategorias(container, options) {


    $('<input required data-bind="value:' + options.field + '"/>')
        .appendTo(container)
        .kendoComboBox({
            dataSource: dataSourceCategorias,
            dataTextField: "name",
            dataValueField: "id",
            filter: "contains",
            minLength: 1
        });
}


function generateBarcode() {
    $.get("/generateBarcode", function (data) {

        $('#barcode').val(data[0].barcode);

    });
}

$("#saveModel").on("click", function () {
    if (validatorModel.validate()) {
        saveModel();
    }
});

$("#closeBill").on("click", function () {


    if (userBill == userSession) {
        const confirmation = confirm('Al cerrar el ingreso ya no se podrá agregar ni eliminar productos a esta orden \n ¿Desea continuar?');
        if (confirmation) {
            $.post("/bill/close", { code: bill }, function (data) {
                if (data.affectedRows > 0) {
                    location.href = "/bill/" + bill;

                } else {

                }
            });
        } else {

        }
    } else {
        alert('Sólo el usuario ' + user + ' puede cerrar el ingreso');
    }


});

$('#barcode').keypress(function (e) {
    if (e.which == 13) {
        if ($(this).val() != '') {
            save();

        } else {

        }

    }
});

$('#code2').keypress(function (e) {

    if (e.which == 13) {

        if ($('#code2').val() != '') {
            var valor = $(this).val().replace("#", "%26");

            $.ajax({
                type: 'GET',
                url: '/model/' + valor,
                success: sendData
            });
        }
    }
});

function sendData(data) {

    if (data.length > 0) {


        $("#txtSerie").data("kendoComboBox").value("");


        dataSourceSeries = new kendo.data.DataSource({
            transport: {
                read: {
                    url: "/product/read/" + data[0].id,
                    dataType: "json"
                }
            }
        });

        $("#txtSerie").kendoComboBox({
            dataSource: dataSourceSeries,
            filter: "contains",
            dataTextField: "barcode",
            dataValueField: "id",
            placeholder: "Buscar serie...",
            minLength: 1,
        });






    } else {
        $('#txtCodigo').data('kendoComboBox').value('');
    }

}

function sendData2(data) {
    if (data.length > 0) {
        $('#modelProduct').val(data[0].id)

    } else {
        var r = confirm("El producto con el código " + $('#code2').val() + " no existe \n ¿Desea agregarlo?");
        if (r == true) {
            $('#myModal').modal('show');
            $('#codeModal').val($('#code2').val());
        } else {
            alert('not okay');
        }
    }

}

function save() {
    var validator = $("#formsave").kendoValidator().data("kendoValidator");
    if (validator.validate()) {
        var data = $('#formsave').serialize();
        var data2 = $('#formsave').serializeArray();

        if (data2[4].value == 'S/N') {
            var x = prompt("Ingresar la cantidad ", "1");
            var cant = parseInt(x);
            data2.push({ name: "cant", value: cant });

            $.post("/product/createserial", data2, function (info) {

                if (info != 'Ya existe el producto') {
                    $('#grid2').data('kendoGrid').dataSource.read();
                    $('#grid2').data('kendoGrid').refresh();

                    $('#barcode').focus();
                } else {
                    alert('Ya existe el número de serie');
                    $('#barcode').focus();
                }

            });


        } else if (data2[4].value.toUpperCase() == 'A/S') {

            var x = prompt("Ingresar la cantidad ", "1");
            var cant = parseInt(x);
            data2.push({ name: "cant", value: cant });

            $.post("/product/createserialauto", data2, function (info) {
                alert(info)
                if (info == 'Ingreso correcto') {
                    $('#grid2').data('kendoGrid').dataSource.read();
                    $('#grid2').data('kendoGrid').refresh();

                    $('#barcode').focus();
                } else {
                    alert('Existio un error');
                    $('#barcode').focus();
                }

            });



        } else {
            var confirmation = confirm('Está seguro de guardar el número de serie: ' + data2[4].value);

            if (confirmation) {
                $.post("/product/create", data, function (info) {

                    if (info != 'Ya existe el producto') {
                        $('#grid2').data('kendoGrid').dataSource.read();
                        $('#grid2').data('kendoGrid').refresh();

                        $('#barcode').focus();
                    } else {
                        alert('Ya existe el número de serie');
                        $('#barcode').focus();
                    }

                });

            }
        }

    }

}

function saveModel() {

    var data = $('#formSaveModel').serialize();
    var data2 = $('#formSaveModel').serializeArray();


    $.post("/model/create", data, function (info) {

        if (info) {
            $('#nameProduct').data('kendoComboBox').dataSource.read();
            $('#nameProduct').data('kendoComboBox').refresh();

            $.ajax({
                type: 'GET',
                url: '/model/' + data2[0].value,
                success: sendData
            });
            $('#myModal').modal('toggle');
            $('#formSaveModel')[0].reset();

        } else {


        }



    });
}

$(document).ready(function () {

    dataSourceCombo = new kendo.data.DataSource({
        transport: {
            read: {
                url: "/model/read",
                dataType: "json"
            }
        }
    });

    $("#txtCodigo").kendoDropDownList({
        dataSource: dataSourceCombo,
        filter: "contains",
        dataTextField: "code",
        dataValueField: "id",
        optionLabel   : "Buscar un código",
        minLength: 1,
        change: onChange
    });



    dataSourceLocation = new kendo.data.DataSource({
        transport: {
            read: {
                url: "/location/read",
                dataType: "json"
            }
        }
    });

    $("#txtUbicacion").kendoDropDownList({
        dataSource: dataSourceLocation,
        filter: "contains",
        dataTextField: "name",
        dataValueField: "id",
        placeholder: "Buscar ubicación...",
        minLength: 1,

    });

    $("#txtSerie").kendoComboBox();
    



    dataSourceBrand = new kendo.data.DataSource({
        transport: {
            read: {
                url: "/brand/read",
                dataType: "json"
            }
        }
    });

    dataSourceCategory = new kendo.data.DataSource({
        transport: {
            read: {
                url: "/category/read",
                dataType: "json"
            }
        }
    });




    $("#nameProduct").kendoComboBox({
        dataSource: dataSourceCombo,
        filter: "contains",
        dataTextField: "description",
        dataValueField: "code",
        placeholder: "Buscar producto",
        minLength: 1,
        change: onChange
    });



    function onChange(e) {
    
    


        var code = this.value();

        $('#code2').val(code);

        var valor = code.replace("#", "%26");


        $.ajax({
            type: 'GET',
            url: '/model/' + valor,
            success: sendData
        });



    };

    $("#location").kendoDropDownList({
        dataSource: dataSourceLocation,
        editable: false,
        dataTextField: "name",
        dataValueField: "id",
        title: "Seleccionar almacén",
        minLength: 1

    });

    $("#categorias").kendoDropDownList({
        dataSource: dataSourceCategorias,
        editable: false,
        dataTextField: "name",
        dataValueField: "id",
        title: "Seleccionar tipo",
        minLength: 1

    });

    $("#brand").kendoDropDownList({
        dataSource: dataSourceBrand,
        editable: false,
        dataTextField: "name",
        dataValueField: "id",
        title: "Seleccionar almacén",
        minLength: 1

    });

    $("#category").kendoDropDownList({
        dataSource: dataSourceCategory,
        editable: false,
        dataTextField: "name",
        dataValueField: "id",
        title: "Seleccionar almacén",
        minLength: 1

    });






    $('#formSaveModel')[0].reset();

    function userNameAutoCompleteEditor(container, options) {
        $('<input required data-bind="value:' + options.field + '"/>')
            .appendTo(container)
            .kendoAutoComplete({
                dataSource: dataSourceCombo,
                placeholder: "Busca un producto",
                dataTextField: "description",
                filter: "contains",
                minLength: 1
            });
    }

    function editNumberWithoutSpinners(container, options) {
        $('<input data-text-field="' + options.field + '" ' +
            'data-value-field="' + options.field + '" ' +
            'data-bind="value:' + options.field + '" ' +
            'data-format="' + options.format + '"/>')
            .appendTo(container)
            .kendoNumericTextBox({
                spinners: false
            });
    }

    dataSource = new kendo.data.DataSource({
        transport: {
            read: { url: "/bill/read/" + bill, dataType: "json" },
            update: { url: "/product/update2", type: "POST", dataType: "json" },
            destroy: { url: "/product/delete2", type: "POST", dataType: "json" },
            create: {
                url: "/product/create2", type: "POST", dataType: "json", success: function (data) {
                    alert(data)
                },
            },
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
                    id: { editable: false },
                  
                    barcode: { validation: { required: true }, type: 'string', editable: false },
                    code: { validation: { required: true }, type: 'string', editable: false },
                    code2: { validation: { required: true }, type: 'string', editable: false },
                    cant: { validation: { required: true }, type: 'number', editable: true },
                    brand: { validation: { required: true }, type: 'string', editable: false },
                    category: { validation: { required: true }, type: 'string', editable: false },
                    description: { validation: { required: true, }, type: 'string', editable: false },
                    bill: { type: 'string', defaultValue: bill, editable: false, visible: false },
                    location: { type: 'number', validation: { required: true } }
                }
            }
        },



        group: [{
            field: "code2", dir: "asc", aggregates: [
                { field: "code2", aggregate: "count" }, 
                { field: "cant", aggregate: "sum" }
            ]
        }],

        aggregate: [
            { field: "cant", aggregate: "sum" },
         
        ],






        pageSize: 1000
    },
    );

    $.get("/location/read2", function (data) {

        $.get("/model/readmodel", function (codes) {
            $("#grid2").kendoGrid({
                dataSource: dataSource,
                toolbar: [ 'excel'],

                excel: {
                    allPages: true,
                    fileName: codigoacta+".xlsx"
                },
                sortable: true,
                height: 400,
                resizable: true,
                scrollable: true,
                
          
                filterable: true,
                resizable: true,
                pageable: { refresh: true, pageSizes: true, },

              
                columns: [
                    { field: "code2", title: "Código", filterable: { search: true, multi: true }, editor: comboCodigos,  groupHeaderTemplate: "#= value# [#= count# ítem(s)]" },
                    { field: "description", title: "Nombre", filterable: { search: true, multi: true } },
                    { field: "barcode", aggregates: ["count"], title: "Serie", filterable: { search: true, multi: true } },
                    { field: "category", title: "Tipo", filterable: { search: true, multi: true } },
                    { field: "brand", title: "Marca", filterable: { search: true, multi: true },  groupFooterTemplate: "Total:" },
                   
                   
                    
                    { field: "cant", aggregates: ["sum"], title: "Cant.", filterable: { search: true, multi: true },aggregates: ["sum"],  groupFooterTemplate: "#=sum#" },
                    { field: "location", title: "Ubicación", values: data, filterable: { search: true, multi: true } },
                    { field: "fdr", title: "FDR", filterable: { search: true, multi: true }, editor: zipCodesEditor },
                    { field: "cso", title: "CSO", filterable: { search: true, multi: true }, editor: zipCodesEditor },
                    { field: "wbs", title: "WBS", filterable: { search: true, multi: true }, editor: zipCodesEditor },
                    { field: "contrato", title: "Contrato", filterable: { search: true, multi: true }, editor: zipCodesEditor },
                    { field: "area", title: "Área", filterable: { search: true, multi: true }, editor: zipCodesEditor },
                    { field: "comment", title: "Comentario", filterable: { search: true, multi: true }, editor: zipCodesEditor },
                    { field: "bill", title: "Comprobante", hidden: true },
                    { command: [ "edit","destroy"], title: "Acciones" }],
                editable: "inline"
            })

        })


    });

    var zipCodesEditor2 = function (container, options) {
        $('<textarea data-bind="value: ' + options.field + '"></textarea>').appendTo(container);
    };

    function zipCodesEditor(container, options) {
        $('<textarea class="form-control" data-bind="value: ' + options.field + '" rows="5"></textarea>')
            .appendTo(container);
    }




})
