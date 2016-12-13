<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="FlatformManager.aspx.cs" Inherits="CDYT.admin.FlatformManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <script src="../bootstrap-dialog/js/bootstrap-dialog.min.js"></script>
    <link href="../bootstrap-dialog/css/bootstrap-dialog.min.css" rel="stylesheet" />

    <script src="../tablesorter-master/jquery-latest.js"></script>
    <script src="../tablesorter-master/jquery.tablesorter.min.js"></script>
    <script src="../tablesorter-master/addons/pager/jquery.tablesorter.pager.js"></script>
    <link href="../tablesorter-master/themes/blue/style.css" rel="stylesheet" />
    <script type="text/javascript">

        $(function () {

            $(".tablesorter")
            .tablesorter()
            .tablesorterPager({ container: $("#pager"), size: 10 });
        });

        function showLink(a) {
            var url = document.URL;
            url = url.substring(0,url.indexOf('/admin'))+"/install.aspx?id=" + $(a).val();
            BootstrapDialog.alert(url);

            return false;
        }
    </script>
    <div id="list" class="table">
        <div>
            <h3>Flatform Management
            </h3>
        </div>

        <div>
            <a href="EditFlatform.aspx" class="btn btn-primary">ADD NEW</a>
        </div>
        <div class="voffset2">
            <div class="dnt-table table-responsive">
                <asp:Repeater runat="server" ID="repListOffer"
                    OnItemDataBound="repListOffer_ItemDataBound">
                    <HeaderTemplate>
                        <table cellspacing="0" class="table table-hover tablesorter">
                            <thead>
                                <tr>
                                    <th class="text-left col-xs-2">ID
                                    </th>
                                    <th class="text-left col-xs-3">NAME
                                    </th>
                                    <th class="text-center col-xs-1">Status
                                    </th>
                                    <th class="text-center col-xs-1">Action
                                    </th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th class="text-left col-xs-2">ID
                                    </th>
                                    <th class="text-left col-xs-3">NAME
                                    </th>
                                    <th class="text-center col-xs-1">Status
                                    </th>
                                    <th class="text-center col-xs-1">Action
                                    </th>
                                </tr>
                            </tfoot>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td class="text-left">
                                <%#Eval("ID")%>
                            </td>
                            <td class="text-left">
                                <%#Eval("NAME")%>
                            </td>
                            <td class="text-center">
                                <asp:LinkButton runat="server" ID="cmdStatus" CommandName="UpdateStatus" CommandArgument='<%#Eval("ID")%>'
                                    Text='<%#Eval("ACTIVE")%>' OnClick="cmdAction_Click" />
                            </td>
                            <td class="text-center">
                                <asp:LinkButton runat="server" ID="cmdEdit" CommandName="Edit" CommandArgument='<%#Eval("ID")%>'
                                    OnClick="cmdAction_Click" CssClass="glyphicon glyphicon-edit dnt-none-underline" />
                                <span>| </span>
                                <asp:LinkButton runat="server" ID="cmdDelete" CommandName="Delete" CommandArgument='<%#Eval("ID")%>'
                                    CssClass="glyphicon glyphicon-remove dnt-none-underline"
                                    OnClientClick="return DeleteConfirm();"
                                    OnClick="cmdAction_Click" />
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
        <div class="row">
            <div id="pager" class="col-lg-12 text-right">
                <div>
                    <i class="first glyphicon glyphicon-fast-backward btn btn-primary"></i>
                    <i class="prev glyphicon glyphicon-backward btn btn-primary"></i>
                    <span class="pagedisplay"></span>
                    <i class="next glyphicon glyphicon-forward btn btn-primary"></i>
                    <i class="last glyphicon glyphicon-fast-forward btn btn-primary"></i>
                    <select class="pagesize btn btn-primary">
                        <option class="btn btn-default" value="5">5</option>
                        <option class="btn btn-default" selected="selected" value="10">10</option>
                        <option class="btn btn-default" value="25">25</option>
                        <option class="btn btn-default" value="50">50</option>
                    </select>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
