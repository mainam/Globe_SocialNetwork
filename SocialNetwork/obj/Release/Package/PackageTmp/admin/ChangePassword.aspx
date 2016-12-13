<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="NetManagement.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h3>
            <asp:Label runat="server" ID="lblCation" />
        </h3>
    </div>
    <div>

        <div>
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
            <div class =" clearfix"></div>
            <div class="input-group col-lg-5">
                <label style="width:140px" for="txtOldPass" class="input-group-addon">
                    <span>Current Password</span>

                </label>
                <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" MaxLength="50" placeholder="Current password" ID="txtOldPass"
                    ClientIDMode="Static" required />
            </div>
            
            <div class="input-group col-lg-5 voffset2">
                <label style="width:140px" for="txtNewPass" class="input-group-addon">
                    <span>New Password</span>
                </label>
                <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" MaxLength="50" placeholder="New password" ID="txtNewPass"
                    ClientIDMode="Static" required />
            </div>

            <div class="input-group col-lg-5 voffset2">
                <label style="width:140px" for="txtReNewPass" class="input-group-addon">
                    <span>Re-new Password</span>
                </label>
                <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" MaxLength="50" placeholder="Re-new password" ID="txtReNewPass"
                    ClientIDMode="Static" required />
            </div>

            <br />
            <!-- Button -->
            <div class="btn-box-bottom">
            <asp:Button runat="server" CssClass="btn btn-primary" ID="btnSave" Text="Save" OnClick="btnSave_Click" />
            <input type="reset" value="Reset" class="btn btn-primary" onclick="return $('#txtOldPass').select();" />
            <input class="btn btn-warning" type="button" value="Back" onclick="window.history.back()" />
                </div>
        </div>

    </div>
</asp:Content>
