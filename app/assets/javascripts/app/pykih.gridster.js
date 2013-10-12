function pykih_gridster(base_url, account_slug, auth_token) {
    var url = base_url + "/api/v1/accounts/" + account_slug + "/grid/get.json?access_token=" + auth_token;
    $.getJSON(url,
        function (data) {
            if (data != null) {
                $.each(data, function (i, value) {

                    //		var localData = JSON.parse(localStorage.getItem('position'));
                    var id_name, col, row, size_x, size_y;

                    id_name = "#";
                    id_name = id_name + value.id;
                    //console.log(id_name);

                    if (id_name == '#li1') {
                        $('#li1').attr('data-row', value.row);
                        $('#li1').attr('data-col', value.col);
                        $('#li1').attr('data-sizex', value.size_x);
                        $('#li1').attr('data-sizey', value.size_y);

                    } else if (id_name == '#li2') {
                        $('#li2').attr('data-row', value.row);
                        $('#li2').attr('data-col', value.col);
                        $('#li2').attr('data-sizex', value.size_x);
                        $('#li2').attr('data-sizey', value.size_y);

                    } else if (id_name == '#li3') {
                        $('#li3').attr('data-row', value.row);
                        $('#li3').attr('data-col', value.col);
                        $('#li3').attr('data-sizex', value.size_x);
                        $('#li3').attr('data-sizey', value.size_y);

                    } else if (id_name == '#li4') {
                        $('#li4').attr('data-row', value.row);
                        $('#li4').attr('data-col', value.col);
                        $('#li4').attr('data-sizex', value.size_x);
                        $('#li4').attr('data-sizey', value.size_y);

                    } else if (id_name == '#li5') {
                        $('#li5').attr('data-row', value.row);
                        $('#li5').attr('data-col', value.col);
                        $('#li5').attr('data-sizex', value.size_x);
                        $('#li5').attr('data-sizey', value.size_y);

                    } else if (id_name == '#li6') {
                        $('#li6').attr('data-row', value.row);
                        $('#li6').attr('data-col', value.col);
                        $('#li6').attr('data-sizex', value.size_x);
                        $('#li6').attr('data-sizey', value.size_y);

                    } else if (id_name == '#li7') {
                        $('#li7').attr('data-row', value.row);
                        $('#li7').attr('data-col', value.col);
                        $('#li7').attr('data-sizex', value.size_x);
                        $('#li7').attr('data-sizey', value.size_y);

                    } else if (id_name == '#li8') {
                        $('#li8').attr('data-row', value.row);
                        $('#li8').attr('data-col', value.col);
                        $('#li8').attr('data-sizex', value.size_x);
                        $('#li8').attr('data-sizey', value.size_y);

                    } else if (id_name == '#li9') {
                        $('#li9').attr('data-row', value.row);
                        $('#li9').attr('data-col', value.col);
                        $('#li9').attr('data-sizex', value.size_x);
                        $('#li9').attr('data-sizey', value.size_y);

                    } else if (id_name == '#li10') {
                        $('#li10').attr('data-row', value.row);
                        $('#li10').attr('data-col', value.col);
                        $('#li10').attr('data-sizex', value.size_x);
                        $('#li10').attr('data-sizey', value.size_y);

                    } else if (id_name == '#li11') {
                        $('#li11').attr('data-row', value.row);
                        $('#li11').attr('data-col', value.col);
                        $('#li11').attr('data-sizex', value.size_x);
                        $('#li11').attr('data-sizey', value.size_y);

                    } else if (id_name == '#li12') {
                        $('#li12').attr('data-row', value.row);
                        $('#li12').attr('data-col', value.col);
                        $('#li12').attr('data-sizex', value.size_x);
                        $('#li12').attr('data-sizey', value.size_y);

                    }


                });
            } else {
                console.log('Daily Health Grid Error: No data returned by the server');
            }
        });



    var grid_canvas = $(".gridster > ul").gridster({
        widget_margins: [5, 5],
        widget_base_dimensions: [180, 180],

        serialize_params: function ($w, wgd) {
            return {
                id: $($w).attr('id'),
                col: wgd.col,
                row: wgd.row,
                size_x: wgd.size_x,
                size_y: wgd.size_y,

            };
        },
        draggable: {

            stop: function (event, ui) {

                var positions = JSON.stringify(this.serialize());
                //localStorage.setItem('position', positions);

                var url_save = base_url + "/api/v1/accounts/" + account_slug + "/grid/save.json?access_token=" + auth_token;
                $.post(url_save, {
                        "positions": positions
                    },
                    function (data) {
                        //var resultado = jQuery.parseJSON(data);
                        //console.log(resultado);


                        //	var localData = JSON.parse(localStorage.getItem('position'));
                        //	$.each(localData, function(key, value){
                        //	console.log(key + ' = ' + value.id);	
                        //	});	
                    });

            }
        }
    }).data('gridster');


}