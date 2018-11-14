<%@ Page Language="C#" AutoEventWireup="true" CodeFile="agecalculate.aspx.cs" Inherits="agecalculate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Age Calculator </title>
    <link href="//stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" />
    <link href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css" rel="stylesheet" />
    <link href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet" />


</head>
<body>
    <form id="form1" runat="server">
        <div style="padding: 50px;">
            <div class="row col-md-6">
                <div class="input-group">
                    <asp:TextBox ID="txtDOB" runat="server" name="birthdate"
                        CssClass="form-control form-control-small col-md-3 birthdate"
                        placeholder="dd/mm/yyyy" autocomplete="off" />
                    <span class="input-group-append">
                        <span class="input-group-text">
                            <span class="fa fa-calendar"></span></span>
                    </span>
                </div>
            </div>
            <p>
                <asp:Label ID="lblAgeValue" CssClass="age" runat="server" />
            </p>
        </div>

        <script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.js"></script>
        <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js"></script>


        <script>
            $("#<%=txtDOB.ClientID%>").datepicker({
                autoclose: true,
                todayHighlight: true,
                format: "dd/mm/yyyy",
            }).on('change', function () {
                var age = getAge(this);
                $("#<%=lblAgeValue.ClientID%>").text(age);

               <%-- if (age > 0) {
                    $("#<%=lblAgeValue.ClientID%>").text(age + " Years");
                } else { $("#<%=lblAgeValue.ClientID%>").text("0 Year"); }--%>
            });

            function getAge(dateVal) {
                var dataSplit = dateVal.value.split('/'),
                    birthday = new Date(dataSplit[2], dataSplit[1], dataSplit[0]),
                    today = new Date(),
                    ageInMilliseconds = new Date(today - birthday),
                    years = ageInMilliseconds / (24 * 60 * 60 * 1000 * 365.25),
                    months = 12 * (years % 1),
                    days = Math.floor(30 * (months % 1));
                return Math.floor(years) + ' years ' + Math.floor(months) + ' months ' + days + ' days';
            }
        </script>

    </form>
</body>
</html>
