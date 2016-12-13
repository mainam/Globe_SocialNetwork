<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberLogin.aspx.cs" Inherits="NetManagement.MemberLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Member Login</title>
    <!--link href="css/style.css" rel="stylesheet" type="text/css" />
    <script src="scripts/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="scripts/script.js" type="text/javascript"></script-->
    <link rel="shortcut icon" href="~/admin/images/android.ico" />
    <script src="scripts/jquery-1.11.1.min.js"></script>
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    <link href="css/style.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <form id="form1" runat="server" defaultfocus="txtUserName" >
            <div class="panel panel-primary box-center voffset9" style="width:450px">
                <div class="panel-heading">
                    <h2>Member Login</h2>
                </div>
                <div class="panel-body">

                    <div>
                        <div class="alert alert-danger alert-dismissable" runat="server" id="boxAlert" visible="false">
                            <button type="button" class="close" data-dismiss="alert"
                                aria-hidden="true">
                                &times;
                            </button>
                            <asp:Label ID="lblMessage" runat="server" ClientIDMode="Static" Visible="false" Text="Login failure!" Font-Italic="true" ForeColor="Red" />

                        </div>

                        <div class="input-group">
                            <label for="txtUserName" class="input-group-addon">
                                <span class="glyphicon glyphicon-user" />

                            </label>
                            <asp:TextBox runat="server" CssClass="form-control" MaxLength="20" placeholder="UserName" ID="txtUserName"
                                ClientIDMode="Static" required data-toggle="tooltip" data-placement="right" title="Input UserName" />
                        </div>

                        <br />
                        <div class="input-group">
                            <label for="txtPassword" class="input-group-addon">
                                <span class="glyphicon glyphicon-asterisk" />
                            </label>
                            <asp:TextBox runat="server" CssClass="form-control" MaxLength="50" placeholder="Password" ID="txtPassword"
                                ClientIDMode="Static" TextMode="Password" required data-toggle="tooltip" data-placement="right" title="Input Password" />
                        </div>
                        <div>
                            <asp:CheckBox CssClass="checkbox checkbox-inline" Text="Keep login in 3 days?" runat="server" ID="chkRemember" ClientIDMode="Static" />
                        </div>
                        <br />
                        
                        <asp:Button data-toggle="tooltip" data-placement="top" title="Click to Login" ID="btnSubmit" runat="server" Text="Login" CssClass="btn btn-success" OnClientClick=" return validateUser();" />
                    </div>

                </div>
            </div>
        </form>
    </div>
</body>
</html>
