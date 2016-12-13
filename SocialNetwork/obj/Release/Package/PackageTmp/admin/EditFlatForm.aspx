<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="EditFlatForm.aspx.cs" Inherits="CDYT.admin.EditFlatForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        $(function () {
            $("txtFlatformID").select();
            
            $('.no-resize').attr('style', 'resize: none');
           
        });

    </script>
    <div id="editBox">
        <div>
            <h3>
                <asp:Label runat="server" ID="lblCation" />
            </h3>
        </div>
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
            <div class="clearfix"></div>
            <div class="voffset0">

            </div>
            <div class=" clearfix"></div>
            <!-- left -->
            <div class="box-left" style="width:100%">
                <!-- ID -->
                <div class="input-group col-lg-12 voffset2">
                    <label style="width: 90px" for="txtFlatformID" class="input-group-addon">
                        <span>ID</span>
                    </label>
                    <asp:TextBox runat="server" ReadOnly="true" CssClass="form-control" MaxLength="10" placeholder="Flatform ID" ID="txtFlatformID"
                        ClientIDMode="Static"  />
                    <label  for="txtFlatformID" class="input-group-addon text-red">
                        <i class="glyphicon glyphicon-asterisk"></i>
                    </label>
                </div>
                <!-- Name -->
                <div class="input-group col-lg-12 voffset2">
                    <label style="width: 90px" for="txtFlatFormName" class="input-group-addon">
                        <span>Name</span>
                    </label>
                    <asp:TextBox runat="server" CssClass="form-control" MaxLength="50" placeholder="Offer Name" ID="txtFlatFormName"
                        ClientIDMode="Static"  />
                    <label for="txtFlatFormName" class="input-group-addon text-red">
                        <i class="glyphicon glyphicon-asterisk"></i>
                    </label>
                </div>
                <div>
                    <asp:CheckBox CssClass="checkbox checkbox-inline" Text="Active" runat="server" ID="chkActive" ClientIDMode="Static" />
                </div>
               
            </div>
            <div class="clearfix"></div>
            <!-- Button -->
            <div class="btn-box-bottom">
                <asp:Button runat="server" CssClass="btn btn-primary" ID="btnSave" Text="Save" OnClick="btnSave_Click" OnClientClick="return validateOffer();" />
                <input type="button" class="btn btn-primary" value="Reset" onclick="return $('#txtFlatformID').select();" />
                <input class="btn btn-warning" type="button" value="Back" onclick="location = 'FlatformManager.aspx'" />
            </div>
        </div>
    </div>
    <asp:HiddenField runat="server" ID="hdHtmlString" ClientIDMode="Static"/>
</asp:Content>
