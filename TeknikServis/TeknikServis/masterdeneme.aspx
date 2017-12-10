<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="masterdeneme.aspx.cs" Inherits="TeknikServis.masterdeneme" %>

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
<body>
    <form id="form1" runat="server">
        <div class="btn-group" id="master">
            
        </div>
    <div>
    
    </div>
    </form>
    <script>
    $(document).ready(function () {
                   $.post("service.ashx?islem=masterOffice", function (data) {
                    var obj = $.parseJSON(data);
          
          var output=''
           if(obj.basarili){
               output+=obj.data;

               
                
                    

              });
                $(output).appendTo("#master");

           }
           else{
            alertify.error(obj.mesaj);
           }
                   });
            });
    </script>
</body>
</html>
