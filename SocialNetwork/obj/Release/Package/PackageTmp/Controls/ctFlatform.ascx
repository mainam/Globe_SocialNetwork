<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctFlatform.ascx.cs" Inherits="CDYT.Controls.ctFlatform" %>
<ul id="side-menu" class="nav">
    <asp:Repeater runat="server" ID="repFlatform">
        <ItemTemplate>
            <li>
                <a href="Default.aspx?flatform=<%#Eval("ID") %>"><i class="store"></i><%#Eval("NAME") %></a>
            </li>
        </ItemTemplate>
    </asp:Repeater>
</ul>
