<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctTopGame.ascx.cs" Inherits="NetManagement.Controls.ctTopGame" %>
<style>
    .badge-app {
        background: url("../file_files/ui.png") no-repeat 0 0;
        -webkit-background-size: 960px 960px;
        background-size: 960px 960px;
        background-position: 0 -150px;
        position: absolute;
        left: 0;
        top: 20px;
        width: 24px;
        height: 32px;
        line-height: 30px;
    }

        .badge-app.app-1 {
            background-position: 0 0px;
        }

        .badge-app.app-2 {
            background-position: 0 -50px;
        }
        .badge-app.app-3 {
    background-position: 0 -100px;
}
</style>
<div class="block-list">
    <div class="header">
        <h3>Top Game</h3>
    </div>
    <ul class="top-app list-group">
        <asp:Repeater runat="server" ID="repListOffer">
            <ItemTemplate>

                <li>
                    <div class="thumbnail">
                        <div class="badge-app app-<%# Container.ItemIndex + 1 %>"><span><%# Container.ItemIndex + 1 %></span></div>
                        <div class="picCard">
                            <a href="/detail.aspx?id=<%#Eval("ID")%>">
                                <img alt="" style="background: url('<%#Eval("OFFER_ICON")%>') no-repeat center;" src="/file_files/default-app.png"></a>
                        </div>
                        <div class="caption">
                            <h5 class="titleCard">
                                <a href="/detail.aspx?id=<%#Eval("ID")%>"><%#Eval("OFFER_NAME")%></a>
                            </h5>
                            <p class="subCard">
                                <a href="/detail.aspx?id=<%#Eval("ID")%>">
                                    <%#Eval("CATE_NAME")%></a>
                            </p>
                            <p class="btnCard">
                                <a class="btn btn-default" href="/install.aspx?id=<%#Eval("ID")%>">Install</a>
                            </p>
                        </div>
                    </div>
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
</div>
