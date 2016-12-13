<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NetManagement.check.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="shortcut icon" href="~/admin/images/android.ico" />
    <script src="scripts/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="scripts/jquery.ui.core.js"></script>
    <!-- bootstrap -->
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="../admin/css/style.css" rel="stylesheet" />
    <title>Check IP & Country</title>
</head>
<body class="container-fluid">
    <form id="form1" runat="server">
        <%-- Check IP --%>
    <div class="panel panel-primary box-center voffset9">
                <div class="panel-heading">
                    <span>Check IP</span>
                </div>
                <div class="panel-body">

                    <div>
                        
                        <div class="input-group">
                            <label for="txtIpAddress" class="input-group-addon">
                                <span/>IP Address

                            </label>
                            <asp:TextBox runat="server" CssClass="form-control" MaxLength="20" placeholder="Input your ip address" ID="txtIpAddress"
                                ClientIDMode="Static"/>
                        </div>
                        <br />
                        <asp:Button runat="server" ID="btnCheckIP" Text="Check" CssClass="btn btn-primary"/>
                    </div>

                </div>
            </div>
        <%-- Check Country Code --%>
        <div class="panel panel-primary box-center voffset2">
                <div class="panel-heading">
                    <span>Check Country Code</span>
                </div>
                <div class="panel-body">

                    <div>
                        
                        <div class="input-group">
                            <label for="txtCountryName" class="input-group-addon">
                                <span/>Country name

                            </label>
                            <asp:TextBox runat="server" CssClass="form-control" MaxLength="50" placeholder="Input country name" ID="txtCountryName"
                                ClientIDMode="Static"/>
                        </div>
                        <br />
                        <asp:Button runat="server" ID="btnCheckCountryCode" Text="Check" CssClass="btn btn-primary"/>
                    </div>

                </div>
            </div>
        <%-- Check Country Name --%>
        <div class="panel panel-primary box-center voffset2">
                <div class="panel-heading">
                    <span>Check Country Name</span>
                </div>
                <div class="panel-body">

                    <div>
                        
                        <div class="input-group">
                            <label for="txtCountrCode" class="input-group-addon">
                                <span/>Country code

                            </label>
                            <asp:TextBox runat="server" CssClass="form-control" MaxLength="50" placeholder="Input country code" ID="txtCountrCode"
                                ClientIDMode="Static"/>
                        </div>
                        <br />
                        <asp:Button runat="server" ID="btnCheckCountryName" Text="Check" CssClass="btn btn-primary"/>
                    </div>

                </div>
            </div>
    </form>
</body>
</html>
