<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="NetManagement.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .item-screen-short {
            height: 100% !important;
            margin: 5px;
            float: left;
        }

        .item-thumbnail {
            padding: 5px;
            width: 100%;
            height: 400px;
            overflow-x: scroll;
            overflow-y: scroll;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField runat="server" ID="hdHtmlString" ClientIDMode="Static" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="app-cover">
        <div class="thumbnail-detail">
            <div class="picCard">
                <!-- <img class="lazy" alt="" style="background :url('http://static.appstore.vn/a/uploads/app/ic_launcherfew1r5w1f6wesuper.png') no-repeat center;" src="http://appvn.com/public/frontend/images/default-app.png"></a> -->
                <img class="lazy" runat="server" id="appIcon" />
            </div>
            <div class="caption">
                <h1 class="titleCard" id="appName" runat="server"></h1>
                <p class="subCard"><a id="catName" runat="server"></a></p>
                <div class="selectDownload">
                    <div class="btnDownload">

                        <a id="btnDownload" runat="server" class="btn btn-primary" href="javascript: void(0);" onclick="pc_download(&#39;52548&#39;); return false;"><i class="icon-material-file-download"></i>Install</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <span class="item-thumbnail"></span>
    <hr class="line-block">
    <div class="header">
        <h2 style="font-size: 24px;">DESCRIPTION</h2>
    </div>
    <div class="app-desc">
        <div class="desc-inner" id="description">
        </div>
    </div>
    <hr class="line-block">
    <div class="header">
        <h3>WHAT'S NEW</h3>
    </div>
    <div class="app-desc">
        <div class="desc-inner" id="more-whatnew">
            <div class="view-desc" id="whatnew_short">
            </div>
        </div>
    </div>

    <hr class="line-block">
    <div class="header">
        <h3>Related</h3>
    </div>
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

    <script>
        $(document).ready(function () {
            $(function () {
                var htmlString = $("#hdHtmlString").val();
                var descripton = $(htmlString).find('.text-body').html();
                $("#description").html(descripton);
                var whatsnew = $(htmlString).find('.recent-change');
                var div = $("#whatnew_short");
                for (var i = 0; i < whatsnew.length; i++) {
                    div.append($(whatsnew[i]).html()).append("<br>");
                }
                var screenshot = $(htmlString).find(".screenshot");
                var div = $(".item-thumbnail");
                for (i = 0; i < screenshot.length && i < 4; i++) {
                    div.append($('<img class="item-screen-short">').attr("src", $(screenshot[i]).attr("src")));
                }
            });
        });
    </script>
</asp:Content>
