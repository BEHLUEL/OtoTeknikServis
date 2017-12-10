<%@ Page Title="" Language="C#" MasterPageFile="~/forTecnician.Master" AutoEventWireup="true" CodeBehind="yeniServisKayit.aspx.cs" Inherits="TeknikServis.WebForm4" %>
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
		<div class="container-fluid">
		<div class="row" style="background:rgb(200,200,200)">
			
		
		<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1" >
			
		</div>
		<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10" style="margin-top:50px">
			<form action="" method="POST" role="form">
			<div class="row">
				<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
					
				</div>
				<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
					<label for="aracPlaka">Araç Plakası</label>
				<input type="text" name="" id="input" class="form-control" value="" required="required"  title="">
				<div class="checkbox">
					<label>
						<input type="checkbox" name="" id="checkboxStandartBakim">
						Standart Bakım
					</label>
				</div>
				</div>
				<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
					<label for="aracKm">Araç KM</label>
					<input type="text" name="" id="input" class="form-control" value="" required="required"  title="">
				</div>
				
				<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
					<label for="inputParca">Parça</label>
				<select name="Parca" id="inputParca" class="form-control">
					<option value="">-- Select One --</option>
				</select>
				</div>
				<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
					<label for="İslem">İşlem</label>
				<select name="" id="input" class="form-control">
					<option value="">Seçiniz</option>
					<option value="Değisim">Değişim</option>
					<option value="Onarım">Onarım</option>


				</select>
				</div>
				
				
			</div>
			<div class="row">
				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
					
				</div>
				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
					<textarea name="" id="Parca" class="form-control" rows="3" required="required"></textarea>
				</div>
			</div>
			
				
			
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>
			</div>
		</div>
		<script>	
		$(document).ready(function () {

		});

		</script>
    </body>
</asp:Content>
