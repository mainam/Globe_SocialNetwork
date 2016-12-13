<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="EditMember.aspx.cs" Inherits="NetManagement.admin.EditMember" %>
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
            <div class="input-group col-lg-5 voffset2">
                <label style="width:120px" for="txtMemberID" class="input-group-addon">
                    <span>Member ID</span>

                </label>
                <asp:TextBox runat="server" CssClass="form-control" MaxLength="50" placeholder="Member ID" ID="txtMemberID"
                    ClientIDMode="Static" required />
            </div>

            <div class="input-group col-lg-5 voffset2">
                <label style="width:120px" for="txtMemberName" class="input-group-addon">
                    <span>Member Name</span>
                </label>
                <asp:TextBox runat="server" CssClass="form-control" MaxLength="50" placeholder="Member Name" ID="txtMemberName"
                    ClientIDMode="Static" required />
            </div>
            
            <div class="input-group col-lg-5 voffset2">
                <label style="width:120px" for="txtMemberPassword" class="input-group-addon">
                    <span>Password</span>
                </label>
                <asp:TextBox runat="server" CssClass="form-control" MaxLength="50" placeholder="Password" ID="txtMemberPassword"
                    ClientIDMode="Static" />
            </div>
            <div>
                <asp:CheckBox CssClass="checkbox checkbox-inline" Text="Active" runat="server" ID="chkActive" ClientIDMode="Static" />
            </div>

            <br />
            <!-- Button -->
            <div class="btn-box-bottom">
            <asp:Button runat="server" CssClass="btn btn-primary" ID="btnSave" Text="Save" OnClick="btnSave_Click" />
            <input type="reset" value="Reset" class="btn btn-primary" onclick="return $('#txtMemberID').select();" />
            <input class="btn btn-warning" type="button" value="Back" onclick="location = 'MemberManager.aspx'" />
                </div>
        </div>

    </div>
</asp:Content>
