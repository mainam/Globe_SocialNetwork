<%@ Page EnableEventValidation="false" Title="Lead Information" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="LeadInfomation.aspx.cs" Inherits="NetManagement.admin.LeadInfomation" %>

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
            .tablesorterPager({ container: $("#pager"), size: 25 });
        });
    </script>
    <div id="list" class="table">
        <div>
            <h3>Lead information
            </h3>
        </div>

        <div>
            <asp:DropDownList CssClass="selectpicker show-tick" data-style="btn-primary" ClientIDMode="Static" runat="server" ID="dropFilter" data-width="200px"
                OnSelectedIndexChanged="dropFilter_SelectedIndexChanged" AutoPostBack="true"/>
        </div>

        <div class="voffset2">
            <div class="dnt-table table-responsive">
                <asp:Repeater runat="server" ID="repListOffer">
                    <HeaderTemplate>
                        <table cellspacing="0" class="table table-hover tablesorter">
                            <thead>
                                <tr>
                                    <th class="text-left col-xs-1">Member
                                    </th>
                                    <th class="text-left col-xs-2">Offer
                                    </th>
                                    <th class="text-left col-xs-2">Net
                                    </th>
                                    <th class="text-left col-xs-1">Time
                                    </th>
                                    <th class="text-center col-xs-1">IP
                                    </th>
                                    <th class="text-center col-xs-1">Country
                                    </th>
                                    <th class="text-center col-xs-1">Payout
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
                                    <th class="text-left col-xs-2">Net
                                    </th>
                                    <th class="text-left col-xs-1">Time
                                    </th>
                                    <th class="text-center col-xs-1">IP
                                    </th>
                                    <th class="text-center col-xs-1">Country
                                    </th>
                                    <th class="text-center col-xs-1">Payout
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
                            <td class="text-left">
                                <%#Eval("Time","{0:dd/MM/yyyy HH:mm:ss}")%>
                            </td>
                            <td class="text-center">
                                <%#Eval("IP")%>
                            </td>

                            <td class="text-center">
                                  <%#Eval("Country")%>
                            </td>
                            <td class="text-center">
                                <%#Eval("Payout")%>
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
            
            <div class="clearfix"></div>

            <div class="row">
                <div class="col-lg-6">
                    <select id="dropTime" runat="server" class="pagesize btn btn-primary">
                        <option class="btn btn-default" value="1">Delete 3 days earlier</option>
                        <option class="btn btn-default" value="2">Delete 1 week earlier</option>
                        <option class="btn btn-default" value="3">Delete 2 week earlier</option>
                        <option class="btn btn-default" selected="selected" value="4">Delete 4 week earlier</option>
                    </select>
                    <asp:Button runat="server" ID="btnDelete" Text="Delete" CssClass="btn btn-primary" OnClick="btnDelete_Click" />
                </div>
                <div id="pager" class="col-lg-6 text-right">
                    <form>
                        <i class="first glyphicon glyphicon-fast-backward btn btn-primary"></i>
                        <i class="prev glyphicon glyphicon-backward btn btn-primary"></i>
                        <span class="pagedisplay"></span>
                        <i class="next glyphicon glyphicon-forward btn btn-primary"></i>
                        <i class="last glyphicon glyphicon-fast-forward btn btn-primary"></i>
                        <select class="pagesize btn btn-primary">
                            <option class="btn btn-default" value="5">5</option>
                            <option class="btn btn-default" value="10">10</option>
                            <option class="btn btn-default" selected="selected" value="25">25</option>
                            <option class="btn btn-default" value="50">50</option>
                            <option class="btn btn-default" value="100">100</option>
                        </select>
                    </form>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
