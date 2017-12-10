<%@ Page Title="" Language="C#" MasterPageFile="~/forTecnician.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="TeknikServis.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <head>
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
    <body>
        <form action="" method="POST" role="form">
            <div class="row">
                <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                </div>
                <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10" style="background-color:rgb(175,180,160)">
                    <div class="row">
                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                            	
                            </div>
								<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
									<label for="kackisilik" style="margin-top: 20px;">Şasi No</label>
                                <input type="text" name="sasiNo" id="inputSasiNo" class="form-control" value="" required="required" pattern="" title="">
								</div>
                                
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">

                            	<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
									<label for="kackisilik" style="margin-top: 20px;">Şasi No</label>
                                <input type="text" name="sasiNo" id="inputSasiNo" class="form-control" value="" required="required" pattern="" title="">
								</div>
                            </div>

                        </div>

                    </div>
                </div>
                <input type="text" name="" id="input" class="form-control" value="" required="required" pattern="" title="">


            </div>
            </div>
        </form>
    </body>
    
</asp:Content>
