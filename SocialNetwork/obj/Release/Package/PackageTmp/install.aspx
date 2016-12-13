<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="install.aspx.cs" Inherits="NetManagement.install" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="admin/scripts/jquery-1.11.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="alert alert-danger alert-dismissable" runat="server" id="boxAlertFaile" visible="false">
                <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">
                    &times;
                </button>
                <asp:Label ID="lblMessageFailure" runat="server" ClientIDMode="Static" Font-Italic="true" ForeColor="Red" Text="We're sorry, you can't complete this offer!"/>
            </div>
        </div>
    </form>
</body>
</html>
