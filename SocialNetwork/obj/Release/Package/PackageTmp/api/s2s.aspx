<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="s2s.aspx.cs" Inherits="NetManagement.receive.s2s" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../admin/scripts/jquery-1.11.1.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../admin/css/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container-fluid col-lg-4 col-lg-offset-4 voffset9">
                <div class="alert alert-danger alert-dismissable" runat="server" id="boxAlertFaile" visible="false">
                    <button type="button" class="close" data-dismiss="alert"
                        aria-hidden="true">
                        &times;
                    </button>
                    <asp:Label ID="lblMessageFailure" runat="server" ClientIDMode="Static" Font-Italic="true" ForeColor="Red" />
                </div>
               
                <div class="alert alert-success alert-dismissable" runat="server" id="boxAlertSuccess" visible="false">
                    <button type="button" class="close" data-dismiss="alert"
                        aria-hidden="true">
                        &times;
                    </button>
                    <asp:Label ID="lblMessageSuccess" runat="server" ClientIDMode="Static" Font-Italic="true" ForeColor="Blue" />
                </div>
            </div> 
    </form>
</body>
</html>
