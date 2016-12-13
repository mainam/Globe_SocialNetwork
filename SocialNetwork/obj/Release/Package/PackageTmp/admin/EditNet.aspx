<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="EditNet.aspx.cs" Inherits="NetManagement.admin.EditNet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Edit net</title>
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
                <label style="width:90px" for="txtNetID" class="input-group-addon">
                    <span>Net ID</span>

                </label>
                <asp:TextBox runat="server" CssClass="form-control" MaxLength="50" placeholder="Net ID" ID="txtNetID"
                    ClientIDMode="Static" required />
            </div>

            <br />
            <div class="input-group col-lg-5">
                <label style="width:90px" for="txtNetName" class="input-group-addon">
                    <span>Net Name</span>
                </label>
                <asp:TextBox runat="server" CssClass="form-control" MaxLength="50" placeholder="Net Name" ID="txtNetName"
                    ClientIDMode="Static" required />
            </div>
            <br />

            <div class="input-group col-lg-5">
                <label style="width:90px" for="txtNetKey" class="input-group-addon">
                    <span>API Key</span>
                </label>
                <asp:TextBox runat="server" CssClass="form-control" MaxLength="250" placeholder="API Key" ID="txtNetKey"
                    ClientIDMode="Static" required />
            </div>
            <br />

            <div class="input-group col-lg-5">
                <label style="width:90px" for="txtAffSub" class="input-group-addon">
                    <span>AFF_SUB</span>
                </label>
                <asp:TextBox runat="server" CssClass="form-control" MaxLength="20" placeholder="AFF_SUB" ID="txtAffSub"
                    ClientIDMode="Static" required />
            </div>
            <div>
                <span class="text-yellow"><b><i>Example:</i></b></span><br />
                <span class="text-blue">HassOffer:</span> {aff_sub} <span class="text-blue">or</span>
                 {aff_sub2} <span class="text-blue">or</span> {aff_sub3} <span class="text-blue">or</span>
                 {aff_sub4} <span class="text-blue">or</span> {aff_sub5} <span class="text-blue">or</span>
                 {aff_sub6},....<br />
                <span class="text-blue">AffTrack:</span> #s1# <span class="text-blue">or</span> #s2# 
                <span class="text-blue">or</span> #s3# <span class="text-blue">or</span> #s4# 
                <span class="text-blue">or</span> #s5# <span class="text-blue">or</span> #s6# 
                <span class="text-blue">or</span> #s7# <span class="text-blue">or</span> #s8#, ....<br />
                <span class="text-blue">Avazu:</span> [dv1]
            </div>
            <div>
                <asp:CheckBox CssClass="checkbox checkbox-inline" Text="Active" runat="server" ID="chkActive" ClientIDMode="Static" />
            </div>

            <br />
            <!-- Button -->
            <div class="btn-box-bottom">
            <asp:Button runat="server" CssClass="btn btn-primary" ID="btnSave" Text="Save" OnClick="btnSave_Click" OnClientClick="return validateNet();" />
            <input type="reset" value="Reset" class="btn btn-primary" onclick="return $('#txtNetID').select();" />
            <input class="btn btn-warning" type="button" value="Back" onclick="location = 'NetManage.aspx'" />
                </div>
        </div>

    </div>

</asp:Content>

