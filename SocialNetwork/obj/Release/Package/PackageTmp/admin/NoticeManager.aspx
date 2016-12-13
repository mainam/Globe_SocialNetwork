<%@ Page Title="Notice manager" ValidateRequest="false" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="NoticeManager.aspx.cs" Inherits="NetManagement.admin.NoticeManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../ckeditor/ckeditor.js"></script>
    <script src="../ckeditor/adapters/jquery.js"></script>
    <script>
        $(document).ready(function () {
            $('textarea#txtNotice').ckeditor();
        });
    </script>
    <div class="table">
        <div class="row" style="padding-left: 15px">
        <div>
            <div class="alert alert-danger alert-dismissable col-lg-5" runat="server" id="boxAlertFaile" visible="false">
                <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">
                    &times;
                </button>
                <asp:Label ID="lblMessageFailure" runat="server" ClientIDMode="Static" Font-Italic="true" ForeColor="Red" />
            </div>

            <div class="alert alert-success alert-dismissable col-lg-5" runat="server" id="boxAlertSuccess" visible="false">
                <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">
                    &times;
                </button>
                <asp:Label ID="lblMessageSuccess" runat="server" ClientIDMode="Static" Font-Italic="true" ForeColor="Blue" />
            </div>
        </div>
            </div>
        <div class="panel panel-primary box-center voffset2">
            <div class="panel-heading">
                <label for="txtNotice">
                    <span style="font-size: large">Notice to member</span>
                </label>
            </div>
            <div class="panel-body">

                <div>


                    <asp:TextBox TextMode="MultiLine" Rows="5" runat="server" CssClass="form-control resize-vertical" placeholder="Notice to member" ID="txtNotice"
                        ClientIDMode="Static" required />

                    <asp:Button ID="btnSubmit" runat="server" Text="Save" CssClass="btn btn-success voffset2" OnClick="btnSubmit_Click" />
                </div>

            </div>
        </div>
    </div>
</asp:Content>
