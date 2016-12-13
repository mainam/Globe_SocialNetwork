<%@ Page EnableEventValidation="false" Title="Member Manager" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="MemberManager.aspx.cs" Inherits="NetManagement.admin.MemberManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../tablesorter-master/jquery-latest.js"></script>
    <script src="../tablesorter-master/jquery.tablesorter.min.js"></script>
    <script src="../tablesorter-master/addons/pager/jquery.tablesorter.pager.js"></script>
    <link href="../tablesorter-master/themes/blue/style.css" rel="stylesheet" />
    <script type="text/javascript">
        //table sorter & paging
        $(function () {
            $(".tablesorter")
            .tablesorter({ widthFixed: true, widgets: ['zebra'] })
            .tablesorterPager({ container: $("#pager"), size: 10 });
        });
    </script>
    <div>
        <h3>Member Mangement</h3>
    </div>
    <div class="table">
        <div>
            <a href="EditMember.aspx" class="btn btn-primary">ADD NEW</a>
        </div>
        <div class="dnt-table table-responsive voffset2">

            <asp:Repeater runat="server" ID="repListMember"
                OnItemDataBound="repListNet_ItemDataBound">
                <HeaderTemplate>
                    <table cellspacing="0" class="table table-hover tablesorter">
                        <thead>
                            <tr>
                                <th class="text-left col-xs-2">ID
                                </th>
                                <th class="text-left col-xs-3">NAME
                                </th>
                                <th class="text-center col-xs-1">TOTAL
                                </th>
                                <th class="text-center col-xs-1">PENDING
                                </th>
                                <th class="text-center col-xs-1">CURRENT
                                </th>
                                <th class="text-center col-xs-1">STATUS
                                </th>
                                <th class="text-center col-xs-2">PAYMENT
                                </th>
                                <th class="text-center col-xs-1">ACTION
                                </th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th class="text-left col-xs-2">ID
                                </th>
                                <th class="text-left col-xs-3">NAME
                                </th>
                                <th class="text-center col-xs-1">TOTAL
                                </th>
                                <th class="text-center col-xs-1">PENDING
                                </th>
                                <th class="text-center col-xs-1">CURRENT
                                </th>
                                <th class="text-center col-xs-1">STATUS
                                </th>
                                <th class="text-center col-xs-2">PAYMENT
                                </th>
                                <th class="text-center col-xs-1">ACTION
                                </th>
                            </tr>
                        </tfoot>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td class="text-left">

                            <%#Eval("MemberID") %>
                        </td>
                        <td class="text-left">
                            <%#Eval("MemberName") %>
                        </td>
                        <td class="text-center">
                            <%#Eval("MemberTotalPoint") %>
                        </td>
                        <td class="text-center">
                            <asp:Label runat="server" ID="lblPendingPoint" Text='<%#Eval("MemberPendingPoint") %>'>
                            
                            </asp:Label>
                        </td>
                        <td class="text-center">
                            <asp:Label runat="server" ID="lblCurrentPoint" Text='<%#Eval("MemberCurrentPoint") %>'>
                            
                            </asp:Label>
                        </td>
                        <td class="text-center">
                            <div class="btn-group">
                                <asp:LinkButton runat="server" ID="cmdStatus" CommandName="UpdateStatus" CommandArgument='<%#Eval("MemberID") %>'
                                    Text='<%#Eval("MemberStatus") %>' OnClick="cmdAction_Click" CssClass="">
                                </asp:LinkButton>
                            </div>
                        </td>
                        <td class="text-center">
                            <asp:LinkButton runat="server" ID="cmdInvoice" CommandName="Invoice" CommandArgument='<%#Eval("MemberID") %>'
                                Text="Invoice" OnClick="cmdAction_Click" CssClass="" />
                            <span>| </span>
                            <asp:LinkButton runat="server" ID="cmdPay" CommandName="Pay" CommandArgument='<%#Eval("MemberID") %>'
                                CssClass="" Text="Pay"
                                OnClick="cmdAction_Click" />
                        </td>
                        <td class="text-center">
                            <asp:LinkButton runat="server" ID="cmdEdit" CommandName="Edit" CommandArgument='<%#Eval("MemberID") %>'
                                OnClick="cmdAction_Click" CssClass="glyphicon glyphicon-edit dnt-none-underline" />
                            <span>| </span>
                            <asp:LinkButton runat="server" ID="cmdDelete" CommandName="Delete" CommandArgument='<%#Eval("MemberID") %>'
                                CssClass="glyphicon glyphicon-remove dnt-none-underline"
                                OnClientClick="return DeleteConfirm();"
                                OnClick="cmdAction_Click" />
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>

        <div class="clearfix"></div>
        <div class="row">
            <div id="pager" class="col-lg-12 text-right">
                <form>
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
                </form>
            </div>
        </div>
    </div>
</asp:Content>
