<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctTopInstall.ascx.cs" Inherits="NetManagement.Controls.ctTopInstall" %>
<asp:Repeater runat="server" ID="repListOffer">
    <ItemTemplate>
        <div class="col-sm-6 col-md-4  col-lg-2 col-xlg-2">
            <div class="thumbnail">
                <div class="picCard">
                    <a href='Detail.aspx?id=<%#Eval("ID")%>'>
                        <img class="lazy" alt="" style="background: url('<%#Eval("OFFER_ICON")%>') no-repeat center;" src="/file_files/default-app.png"></a>
                </div>
                <div class="caption">
                    <h5 class="titleCard">
                        <a href='Detail.aspx?id=<%#Eval("ID")%>' title='<%#Eval("OFFER_NAME")%>'><%#Eval("OFFER_NAME")%></a>
                    </h5>
                    <div class="cnth">
                        <%#Eval("CATE_NAME")%>
                    </div>
                    <p class="btnCard" id="no-download-1577">
                        <a class="btn btn-default" href='Install.aspx?id=<%#Eval("ID")%>'>Install Now  </a>
                    </p>
                </div>
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>
