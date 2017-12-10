<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParcaAlimlarifs.aspx.cs" Inherits="TeknikServis.ParcaAlimlarifs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

    <link href="Content/alertifyjs/alertify.min.css" rel="stylesheet" />
    <link href="Content/alertifyjs/themes/default.min.css" rel="stylesheet" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="Scripts/alertify.min.js"></script>
    <script src="Scripts/moment.min.js"></script>
    <script src="Scripts/moment-with-locales.min.js"></script>
    <script src="Scripts/bootstrap-datetimepicker.js"></script>
</head>
<body style="background: rgb(60,30,30)">
    <a class="btn btn-primary" data-toggle="modal" href='#parcalar'>Trigger modal</a>
    <div class="modal fade" id="parcalar">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Parca Alim Detaylari</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <label for="">Tedarikci</label>
                            <input type="text" name="tedarikci" id="inputTedarikci" class="form-control" value="" required="required" title="">
                        </div>
                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                            <label for="">Fiyat</label>
                            <input type="text" name="fiyat" id="inputFiyat" class="form-control" value="" required="required" title="">
                        </div>
                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                            <label for="">Tarih</label>
                            <input type="text" name="tarih" id="inputTarih" class="form-control" value="" required="required" pattern="" title="">
                        </div>
                    </div>
                    <table class="table table-hover" style="margin-top: 30px">
                        <thead>
                            <tr>
                                <th>Sira</th>
                                <th>Parca</th>
                                <th>Parca ID</th>
                                <th>Adet</th>
                            </tr>
                        </thead>
                        <tbody id="parca">
                        </tbody>
                    </table>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                </div>
            </div>
        </div>
    </div>
    <div id="master"></div>
    <div class="container-fluid">

        <div class="jumbotron">
            <div class="container">
                <div class="row">
                    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                        <h2 style="margin-bottom: 30px">Parca Alimlar</h2>

                    </div>
                    <a href="yeniKayitfs.aspx">
                        <button type="button" style="margin-top: 20px" class="btn btn-success">Yeni kayit</button></a>


                </div>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Sira</th>
                            <th>Tedarikci</th>
                            <th>Fiyat</th>
                            <th>Tarih</th>


                        </tr>
                    </thead>
                    <tbody id="parcaAlimlar">
                    </tbody>
                </table>

                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Sira</th>
                            <th>Tedarikci</th>
                            <th>Fiyat</th>
                            <th>Tarih</th>
                        </tr>
                    </thead>
                    <tbody id="nullparcaAlimlar">
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {

            $("#master").load("masterOzel.aspx");

            $.post("service.ashx?islem=getParcaAlim", function (data) {
                var obj = $.parseJSON(data);
                var sayac = 0;
                var output = ''
                if (obj.basarili) {

                    $.each(obj.data, function (index, val) {
                        sayac++;

                        output += "<tr>";
                        output += '<td><a href="javascript:void(0); #parcalar" class="dataParcaAlim" data-toggle="modal" rel="' + obj.data[index].ParcaAlimId + '"><b>' + sayac + '</b></a></td>';


                        output += '<td>' + obj.data[index].TedarikciAdi + '</td>';
                        output += "<td>" + obj.data[index].Fiyat + "</td>";
                        output += "<td>" + obj.data[index].Tarih + "</td>";


                        output += '</tr>';





                    });
                    $(output).appendTo("#parcaAlimlar");

                }
                else {
                    alert(obj.mesaj);
                };

            });
            $.post("service.ashx?islem=getParcaAlim1", function (data) {
                var obj = $.parseJSON(data);
                var sayac = 0;
                var output = ''
                if (obj.basarili) {

                    $.each(obj.data, function (index, val) {
                        sayac++;

                        output += "<tr>";
                        output += '<td><a href="javascript:void(0); #parcalar" class="dataParcaAlim1" data-toggle="modal" rel="' + obj.data[index].ParcaAlimId + '"><b>' + sayac + '</b></a></td>';


                        output += '<td>' + obj.data[index].TedarikciId + '</td>';
                        output += "<td>" + obj.data[index].Fiyat + "</td>";
                        output += "<td>" + obj.data[index].Tarih + "</td>";


                        output += '</tr>';





                    });
                    $(output).appendTo("#nullparcaAlimlar");

                    $(document).on('click', '.dataParcaAlim1', function (event) {
                        $("#parca").empty();
                        var id = $(this).attr("rel");




                        $.post("service.ashx?islem=getParcaAlimId1", { id: id }, function (data) {

                            var obj = $.parseJSON(data);
                            if (obj.basarili) {

                                $.each(obj.data, function (index, val) {

                                    $("#inputFiyat").val(obj.data[index].Fiyat);
                                    $("#inputTarih").val(obj.data[index].Tarih);



                                });
                                // $(modal1).Show();
                            }
                            else {
                                alertify.error(obj.mesaj);
                            };



                        });

                        $.post("service.ashx?islem=alinanParcalar", { id: id }, function (data) {
                            var obj = $.parseJSON(data);
                            var sayac = 0;
                            var output = ''
                            if (obj.basarili) {

                                $.each(obj.data, function (index, val) {
                                    sayac++;

                                    output += "<tr>";
                                    output += '<td><a><b>' + sayac + '</b></a></td>';


                                    output += '<td>' + obj.data[index].ParcaAdi + '</td>';
                                    output += "<td>" + obj.data[index].parcaId + "</td>";
                                    output += "<td>" + obj.data[index].adet + "</td>";


                                    output += '</tr>';





                                });
                                $(output).appendTo("#parca");

                            }
                            else {
                                alert(obj.mesaj);
                            };

                        });


                        event.preventDefault();
                        /* Act on the event */
                    });
                }
                else {
                    alert(obj.mesaj);
                };

            });

            $(document).on('click', '.dataParcaAlim', function (event) {

                var id = $(this).attr("rel");




                $.post("service.ashx?islem=getParcaAlimId", { id: id }, function (data) {

                    var obj = $.parseJSON(data);
                    if (obj.basarili) {

                        $.each(obj.data, function (index, val) {
                            $("#inputTedarikci").val(obj.data[index].TedarikciAdi);
                            $("#inputFiyat").val(obj.data[index].Fiyat);
                            $("#inputTarih").val(obj.data[index].Tarih);



                        });
                        // $(modal1).Show();
                    }
                    else {
                        alertify.error(obj.mesaj);
                    };



                });

                $.post("service.ashx?islem=alinanParcalar", { id: id }, function (data) {
                    var obj = $.parseJSON(data);
                    var sayac = 0;
                    var output = ''
                    if (obj.basarili) {

                        $.each(obj.data, function (index, val) {
                            sayac++;

                            output += "<tr>";
                            output += '<td><a><b>' + sayac + '</b></a></td>';


                            output += '<td>' + obj.data[index].ParcaAdi + '</td>';
                            output += "<td>" + obj.data[index].P.ParcaId + "</td>";
                            output += "<td>" + obj.data[index].PP.Adet + "</td>";


                            output += '</tr>';





                        });
                        $(output).appendTo("#parca");

                    }
                    else {
                        alert(obj.mesaj);
                    };

                });


                event.preventDefault();
                /* Act on the event */
            });

            $(document).on('click', '.dataParcaAlim', function (event) {

                var id = $(this).attr("rel");




                $.post("service.ashx?islem=getParcaAlimId", { id: id }, function (data) {

                    var obj = $.parseJSON(data);
                    if (obj.basarili) {

                        $.each(obj.data, function (index, val) {
                            $("#inputTedarikci").val(obj.data[index].TedarikciAdi);
                            $("#inputFiyat").val(obj.data[index].Fiyat);
                            $("#inputTarih").val(obj.data[index].Tarih);



                        });
                        // $(modal1).Show();
                    }
                    else {
                        alertify.error(obj.mesaj);
                    };



                });

                $.post("service.ashx?islem=alinanParcalar", { id: id }, function (data) {
                    var obj = $.parseJSON(data);
                    var sayac = 0;
                    var output = ''
                    if (obj.basarili) {

                        $.each(obj.data, function (index, val) {
                            sayac++;

                            output += "<tr>";
                            output += '<td><a><b>' + sayac + '</b></a></td>';


                            output += '<td>' + obj.data[index].ParcaAdi + '</td>';
                            output += "<td>" + obj.data[index].P.ParcaId + "</td>";
                            output += "<td>" + obj.data[index].PP.Adet + "</td>";


                            output += '</tr>';





                        });
                        $(output).appendTo("#parca");

                    }
                    else {
                        alert(obj.mesaj);
                    };

                });


                event.preventDefault();
                /* Act on the event */
            });
        });
    </script>
</body>

</html>
