<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NetManagement.member.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Member Lead</title>
    <link rel="shortcut icon" href="~/admin/images/android.ico" />
    <script src="scripts/jquery-1.11.1.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="header" class="bg-warning navbar navbar-static-top">
            <div class="dnt-header navbar-left dnt-menu-left">
                <span>MEMBER PAGE</span>
            </div>
            <!-- user box -->
            <div class="navbar-right">
                <ul class="nav navbar-nav">
                    <li class="dropdown user user-menu" style="font-size: large">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="glyphicon glyphicon-user"></i>
                            <span>
                                <asp:Label ID="lblUser" runat="server" CssClass="lblUser text-capitalize dnt-none-underline" />
                                <i class="caret"></i></span>

                        </a>
                        <ul class="dropdown-menu">
                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-right">
                                    <div class="btn-group">
                                        <asp:LinkButton ID="btnLogout" runat="server" CssClass="btn btn-warning"
                                            OnClick="btnLogout_Click">
                                            <i class="glyphicon glyphicon-log-out"></i> Logout

                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <div style="width: 100%; float: left">
            <asp:Button runat="server" ID="btnAll" Text="All member" CssClass="btn btn-primary" OnClick="btnAll_Click" />
            <asp:Button runat="server" ID="btnMe" Text="My Lead" CssClass="btn btn-primary" OnClick="btnMe_Click" />
        </div>
        <div style="width: 80%; float: left" class="voffset2">
            <div class="panel panel-primary box-center">
                <div class="panel-heading panel-organe">
                    <span style="font-size: 25px">Lead information</span>
                </div>
                <div class="panel-body">
                    <div class="dnt-table table-responsive">
                        <asp:Repeater runat="server" ID="repListOffer">
                            <HeaderTemplate>
                                <table cellspacing="0" class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th class="text-left col-xs-1">Member
                                            </th>
                                            <th class="text-left col-xs-2">Offer
                                            </th>
                                            <th class="text-center col-xs-1">Net
                                            </th>
                                            <th class="text-center col-xs-1">Time
                                            </th>
                                            <th class="text-center col-xs-2">IP
                                            </th>
                                            <th class="text-center col-xs-1">Country
                                            </th>
                                            <th class="text-center col-xs-1">Point
                                            </th>
                                            <th class="text-center col-xs-3">User Agent
                                            </th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th class="text-left col-xs-1">Member
                                            </th>
                                            <th class="text-left col-xs-2">Offer
                                            </th>
                                            <th class="text-center col-xs-1">Net
                                            </th>
                                            <th class="text-center col-xs-1">Time
                                            </th>
                                            <th class="text-center col-xs-2">IP
                                            </th>
                                            <th class="text-center col-xs-1">Country
                                            </th>
                                            <th class="text-center col-xs-1">Point
                                            </th>
                                            <th class="text-center col-xs-3">User Agent
                                            </th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td class="text-left">
                                        <%#Eval("MemberID")%>
                                    </td>
                                    <td class="text-left">
                                        <%#Eval("OfferName")%>
                                    </td>
                                    <td class="text-left">
                                        <%#Eval("NetName")%>
                                    </td>
                                    <td class="text-center">
                                        <%#Eval("Time","{0:dd/MM/yyyy HH:mm:ss}")%>
                                    </td>
                                    <td class="text-center">
                                        <%#Eval("IP")%>
                                    </td>

                                    <td class="text-center">
                                        <%#Eval("Country")%>
                                    </td>
                                    <td class="text-center">
                                        <%#Eval("Point")%>
                                    </td>

                                    <td class="text-center">
                                        <%#Eval("UserAgent")%>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                        </table>
                        
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>

        <div style="width: 19%; float: left; margin-left: 1%">
            <div style="width: 100%" class="voffset2">
                <div class="panel panel-primary box-center">
                    <div class="panel-heading panel-warning">
                        <span style="font-size: 25px">Admin notice</span>
                    </div>
                    <div class="panel-body">
                        <div style="font-style: italic; border: solid dotted">
                            <asp:Label runat="server" ID="lblAuthor" Text="Author"></asp:Label><span> | </span>
                            <asp:Label runat="server" ID="lblTime" Text="Time"></asp:Label>
                            <br />
                        </div>
                        <div class="voffset2">
                            <pre>Notice</pre>
                            <asp:Label runat="server" ID="lblNotice" Text="--- Anh em làm mạnh nào</br> + Ăn con DU Speed booter mạnh tay nhé!"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>

            <div style="width: 100%" class="voffset2">
                <div class="panel panel-primary box-center">
                    <div class="panel-heading panel-organe">
                        <span style="font-size: 25px">Top point</span>
                    </div>
                    <div class="panel-body">
                        <div class="dnt-table table-responsive">
                            <asp:Repeater runat="server" ID="repMemberPoint">
                                <HeaderTemplate>
                                    <table cellspacing="0" class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th class="text-left col-xs-6">Member
                                                </th>
                                                <th class="text-center col-xs-6">
                                                Point
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th class="text-left col-xs-6">Member
                                                </th>
                                                <th class="text-center col-xs-6">
                                                Point
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td class="text-left">
                                            <%#Eval("MemberID")%>
                                        </td>
                                        <td class="text-center">
                                            <%#Eval("MemberCurrentPoint")%>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </tbody>
                            </table>
                        
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
