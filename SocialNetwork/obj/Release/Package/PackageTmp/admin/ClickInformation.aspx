<%@ Page Title="Click Information" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="ClickInformation.aspx.cs" Inherits="NetManagement.admin.ClickInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        $(function () {
            $(document).ready(function () {
                var contentDiv = $(".test-fixed");
                contentDiv.html(longString.substr(0, 12) + "...");

                contentDiv.mouseover(function () {
                    this.html(longString);
                });

                contentDiv.mouseout(function () {
                    this.html(longString.substr(0, 12) + "...");
                });
            });

            var json = $("#hdJson").val().trim();
            if (json.length > 0) {
                var JSONObj = $.parseJSON(json);
                var data = JSONObj.response.data.data;
                var rc = 0;
                var txtRC;
                var text = '<table  cellspacing="0" class="table table-hover">';
                text += "<thead>";
                text += "<tr>";
                text += "<th class='text-left col-xs-1'>Date</th>";
                text += "<th class='text-center col-xs-1'>Hour</th>";
                text += "<th class='text-left col-xs-1'>Browser</th>";
                text += "<th class='text-left col-xs-1'>Country</th>";
                text += "<th class='text-left col-xs-2'>Offer</th>";
                text += "<th class='text-center col-xs-1'>Click</th>";
                text += "<th class='text-center col-xs-1'>Gross</th>";
                text += "<th class='text-center col-xs-1'>Unique</th>";
                text += "<th class='text-center col-xs-1'>Lead</th>";
                text += "<th class='text-center col-xs-1'>Payout</th>";
                text += "<th class='text-center col-xs-1'>CR</th>";
                text += "</tr>";
                text += "</thead>";
                text += "<tfoot>";

                text += "<tr>";
                text += "<th class='text-left col-xs-1'>Date</th>";
                text += "<th class='text-center col-xs-1'>Hour</th>";
                text += "<th class='text-left col-xs-1'>Browser</th>";
                text += "<th class='text-left col-xs-1'>Country</th>";
                text += "<th class='text-left col-xs-2'>Offer</th>";
                text += "<th class='text-center col-xs-1'>Click</th>";
                text += "<th class='text-center col-xs-1'>Gross</th>";
                text += "<th class='text-center col-xs-1'>Unique</th>";
                text += "<th class='text-center col-xs-1'>Lead</th>";
                text += "<th class='text-center col-xs-1'>Payout</th>";
                text += "<th class='text-center col-xs-1'>CR</th>";
                text += "</tr>";
                text += "</tfoot>";

                text += "<tbody>";
                for (i = 0; i < data.length; i++) {
                    text += "<tr>";
                    text += "<td>" + data[i].Stat.date + "</td>";
                    text += "<td class='text-center'>" + (data[i].Stat.hour === undefined ? "-" : data[i].Stat.hour) + "</td>";
                    text += "<td>" + data[i].Browser.display_name + "</td>";
                    text += "<td>" + data[i].Country.name + "</td>";
                    text += "<td class='test-fixed'>" + data[i].Offer.name + "</td>";
                    text += "<td class='text-center'>" + data[i].Stat.clicks + "</td>";
                    text += "<td class='text-center'>" + (data[i].Stat.gross_clicks === undefined ? "-" : data[i].Stat.gross_clicks) + "</td>";
                    text += "<td class='text-center'>" + (data[i].Stat.unique_clicks === undefined ? "-" : data[i].Stat.unique_clicks) + "</td>";
                    text += "<td class='text-center'>" + data[i].Stat.conversions + "</td>";
                    text += "<td class='text-center'>" + parseFloat(data[i].Stat.payout).toFixed(3) + "</td>";
                    rc = ((data[i].Stat.conversions * 100) / (data[i].Stat.clicks)).toString();
                    txtRC = rc.substring(0, Math.min(4, rc.length));
                    if (txtRC === "NaN" || txtRC === "0") {
                        txtRC = "0.00"
                    }
                    text += "<td class='text-center'>" + txtRC + "%" + "</td>";
                    text += "</tr>";
                }
                text += "<tr>";
                text += "<th colspan='5'>Total:</th>";
                text += "<th class='text-center'>" + JSONObj.response.data.totals.Stat.clicks + "</th>";
                text += "<th class='text-center'>" + (JSONObj.response.data.totals.Stat.gross_clicks === undefined ? "-" : JSONObj.response.data.totals.Stat.gross_clicks) + "</th>";
                text += "<th class='text-center'>" + (JSONObj.response.data.totals.Stat.unique_clicks === undefined ? "-" : JSONObj.response.data.totals.Stat.unique_clicks) + "</th>";
                text += "<th class='text-center'>" + JSONObj.response.data.totals.Stat.conversions + "</th>";
                text += "<th class='text-center'>" + Math.round(JSONObj.response.data.totals.Stat.payout * 1000) / 1000 + "</th>";
                rc = ((JSONObj.response.data.totals.Stat.conversions * 100) / (JSONObj.response.data.totals.Stat.unique_clicks === undefined ? JSONObj.response.data.totals.Stat.clicks : JSONObj.response.data.totals.Stat.unique_clicks)).toString();
                txtRC = rc.substring(0, Math.min(4, rc.length));
                if (txtRC === "NaN" || txtRC === "0") {
                    txtRC = "0.00"
                }
                text += "<th class='text-center'>" + txtRC + "%" + "</th>";
                text += "</tr>";
                text += "</tbody>";
                text += "</table>";
                $("#clickTable").html(text);
            }
        });
    </script>

    <asp:HiddenField runat="server" ID="hdJson" ClientIDMode="Static" />
    <div class="panel panel-primary">
        <div class="panel-heading">
            <span>Option</span>
        </div>
        <div class="panel-body">
            <div>
                <asp:CheckBox CssClass="checkbox checkbox-inline checkbox-inbox" Text="Hour" runat="server" ID="chkHour" ClientIDMode="Static" />
                <asp:CheckBox Checked="true" CssClass="checkbox checkbox-inline checkbox-inbox" Text="Unique Clicks" runat="server" ID="chkUnique" ClientIDMode="Static" />
                <asp:CheckBox Checked="true" CssClass="checkbox checkbox-inline checkbox-inbox" Text="Gross Clicks" runat="server" ID="chkGross" ClientIDMode="Static" />
            </div>
        </div>
    </div>
    <div class="table">
        <div class="voffset2">
            <asp:DropDownList ID="dropTime" runat="server" CssClass="selectpicker show-tick" data-style="btn-primary" data-width="150px" />
            <asp:DropDownList ID="dropListNet" runat="server" CssClass="selectpicker show-tick" data-style="btn-primary" data-width="200px" />
            <asp:Button ID="btnView" runat="server" CssClass="btn btn-primary" Text="View Stat" OnClick="btnView_Click" />
        </div>
        <div id="clickTable" class="dnt-table table-responsive voffset2"></div>
        <div id="boxPaging" runat="server" class="text-right voffset2">
            <asp:HiddenField runat="server" ID="hdCurrentPage" />
            <asp:HiddenField runat="server" ID="hdTotalPage" />
            <asp:Label runat="server" ID="lblEntriesInfo" />

            <asp:LinkButton ID="btnFirst" runat="server" CssClass="btn btn-primary" OnClick="btnFirst_Click">
          <i class="glyphicon glyphicon-fast-backward"></i>
            </asp:LinkButton>
            <asp:LinkButton ID="btnBack" runat="server" CssClass="btn btn-primary" OnClick="btnBack_Click">
          <i class="glyphicon glyphicon-backward"></i>
            </asp:LinkButton>

            <asp:Label runat="server" ID="lblCurrentPage" />
            <span>&nbsp;of&nbsp;</span>
            <asp:Label runat="server" ID="lblTotalPage" />

            <asp:LinkButton ID="btnNext" runat="server" CssClass="btn btn-primary" OnClick="btnNext_Click">
          <i class="glyphicon glyphicon-forward"></i>
            </asp:LinkButton>
            <asp:LinkButton ID="btnLast" runat="server" CssClass="btn btn-primary" OnClick="btnLast_Click">
          <i class="glyphicon glyphicon-fast-forward"></i>
            </asp:LinkButton>
        </div>
    </div>
</asp:Content>
