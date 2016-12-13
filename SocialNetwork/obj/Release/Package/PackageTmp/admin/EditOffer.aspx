<%@ Page Title="" EnableEventValidation="false" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="EditOffer.aspx.cs" Inherits="NetManagement.admin.EditOffer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <script type="text/javascript">
        $(function () {
            $("#txtOfferPoint").numericInput();
            $("#txtOfferDownload").numericInput();
            $("#txtOfferRate").numericInput({ allowFloat: true});

            $("txtOfferID").select();
            
            $('.no-resize').attr('style', 'resize: none');

            var htmlString = $("#hdHtmlString").val();
            $("#hdHtmlString").val(null);
            if (htmlString.length > 0)
            {
                var image = $(htmlString).find('.cover-container').find('.cover-image').attr("src");
                $("#txtOfferIcon").val(image);

                var title = $(htmlString).find('.document-title').text().trim();
                $("#txtOfferName").val(title);

                $("#txtMetaKey").val("Android, Free Games, Free Apps, " + title);

                var score = $(htmlString).find('.score').text().trim();
                if (score.indexOf(",") >= 0) {
                    score = score.replace(",", ".");
                }
                $("#txtOfferRate").val(score);
            }
           
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
                <asp:DropDownList CssClass="selectpicker show-tick" data-style="btn-primary" ClientIDMode="Static" runat="server" ID="dropListNet" data-width="200px" />
                
                <asp:DropDownList CssClass="selectpicker show-tick" data-style="btn-primary" ClientIDMode="Static" runat="server" ID="dropListFlatform" data-width="100px" />

                <asp:DropDownList CssClass="selectpicker show-tick" data-style="btn-primary" ClientIDMode="Static" runat="server" ID="dropListCate" data-width="100px" />

                <asp:Button runat="server" ID="btnGetInfo" CausesValidation="true" Text="GetInfo" CssClass="btn btn-primary" OnClick="btnGetInfo_Click" />
            </div>
            <div class=" clearfix"></div>
            <!-- left -->
            <div class="box-left" style="width:100%">
                <!-- ID -->
                <div class="input-group col-lg-12 voffset2">
                    <label style="width: 90px" for="txtOfferID" class="input-group-addon">
                        <span>ID</span>
                    </label>
                    <asp:TextBox runat="server" CssClass="form-control" MaxLength="10" placeholder="Offer ID" ID="txtOfferID"
                        ClientIDMode="Static"  />
                    <label  for="txtOfferID" class="input-group-addon text-red">
                        <i class="glyphicon glyphicon-asterisk"></i>
                    </label>
                </div>
                <!-- Name -->
                <div class="input-group col-lg-12 voffset2">
                    <label style="width: 90px" for="txtOfferName" class="input-group-addon">
                        <span>Name</span>
                    </label>
                    <asp:TextBox runat="server" CssClass="form-control" MaxLength="50" placeholder="Offer Name" ID="txtOfferName"
                        ClientIDMode="Static"  />
                    <label for="txtOfferName" class="input-group-addon text-red">
                        <i class="glyphicon glyphicon-asterisk"></i>
                    </label>
                </div>
                <!-- Tracking link -->
                <div class="input-group col-lg-12 voffset2">
                    <label style="width: 90px" for="txtOfferTracking" class="input-group-addon">
                        <span>Tracking</span>
                    </label>
                    <asp:TextBox ID="txtOfferTracking" runat="server" CssClass="form-control" MaxLength="250" placeholder="Tracking link"
                        ClientIDMode="Static"  />
                    <label for="txtOfferTracking" class="input-group-addon text-red">
                        <i class="glyphicon glyphicon-asterisk"></i>
                    </label>
                </div>
                <!-- Review link -->
                <div class="input-group col-lg-12 voffset2">
                    <label style="width: 90px" for="txtOfferReviewLink" class="input-group-addon">
                        <span>Review</span>
                    </label>
                    <asp:TextBox ID="txtOfferReviewLink" runat="server" CssClass="form-control" MaxLength="250" placeholder="Review link"
                        ClientIDMode="Static"  />
                    <label for="txtOfferReviewLink" class="input-group-addon text-red">
                        <i class="glyphicon glyphicon-asterisk"></i>
                    </label>
                </div>
                <!-- Country -->
                <div class="input-group col-lg-12 voffset2">
                    <label style="width: 90px" for="txtOfferCountryList" class="input-group-addon">
                        <span>Country</span>
                    </label>
                    <asp:TextBox ID="txtOfferCountryList" runat="server" CssClass="form-control" MaxLength="250" placeholder="Country (Ex: US, UK)"
                        ClientIDMode="Static"  />
                    <label for="txtOfferCountryList" class="input-group-addon text-red">
                        <i class="glyphicon glyphicon-asterisk"></i>
                    </label>
                </div>
                <!-- Icon -->
                <div class="input-group col-lg-12 voffset2">
                    <label style="width: 90px" for="txtOfferIcon" class="input-group-addon">
                        <span>Icon</span>
                    </label>
                    <asp:TextBox ID="txtOfferIcon" placeholder="Offer Icon" MaxLength="250" runat="server" CssClass="form-control"
                        ClientIDMode="Static" />
                    <label for="txtOfferCountryList" class="input-group-addon text-red">
                        <i class="glyphicon glyphicon-asterisk"></i>
                    </label>
                </div>
                
                <!-- Point -->
                <div class="input-group col-lg-12 voffset2">
                    <label style="width: 90px" for="txtOfferPoint" class="input-group-addon">
                        <span>Point</span>
                    </label>
                    <asp:TextBox ID="txtOfferPoint" runat="server" CssClass="form-control" MaxLength="3" placeholder="Point"
                        ClientIDMode="Static"  />
                    <label for="txtOfferPoint" class="input-group-addon text-red">
                        <i class="glyphicon glyphicon-asterisk"></i>
                    </label>
                </div>
                <!-- Payout -->
                <div class="input-group col-lg-12 voffset2">
                    <label style="width: 90px" for="txtOfferPayout" class="input-group-addon">
                        <span>Payout</span>
                    </label>
                    <asp:TextBox ID="txtOfferPayout" placeholder="Payout" runat="server" CssClass="form-control" MaxLength="10"
                        ClientIDMode="Static" />
                    <label for="txtOfferPayout" class="input-group-addon text-blue">
                        <i class="glyphicon glyphicon-ok"></i>
                    </label>
                </div>
                <!-- Rate -->
                <div class="input-group col-lg-12 voffset2">
                    <label style="width: 90px" for="txtOfferRate" class="input-group-addon">
                        <span>Rate</span>
                    </label>
                    <asp:TextBox ID="txtOfferRate" placeholder="Rate" MaxLength="3" runat="server" CssClass="form-control"
                        ClientIDMode="Static" />
                    <label for="txtOfferRate" class="input-group-addon text-blue">
                        <i class="glyphicon glyphicon-ok"></i>
                    </label>
                </div>
                <!-- Download -->
                <div class="input-group col-lg-12 voffset2">
                    <label style="width: 90px" for="txtOfferDownload" class="input-group-addon">
                        <span>Download</span>
                    </label>
                    <asp:TextBox ID="txtOfferDownload" placeholder="Download count" MaxLength="10" runat="server" CssClass="form-control"
                        ClientIDMode="Static" />
                     <label for="txtOfferDownload" class="input-group-addon text-blue">
                        <i class="glyphicon glyphicon-ok"></i>
                    </label>
                </div>
                <!-- Meta-key -->
                <div class="input-group col-lg-12 voffset2">
                    <label style="width: 90px" for="txtMetaKey" class="input-group-addon">
                        <span>Meta key</span>
                    </label>
                    <asp:TextBox ID="txtMetaKey" placeholder="Meta key (EX: Android, Free App)" MaxLength="250" runat="server" CssClass="form-control"
                        ClientIDMode="Static" />
                    <label for="txtMetaKey" class="input-group-addon text-blue">
                        <i class="glyphicon glyphicon-ok"></i>
                    </label>
                </div>
                <!-- Active -->
                <div>
                    <asp:CheckBox CssClass="checkbox checkbox-inline" Text="Active" runat="server" ID="chkActive" ClientIDMode="Static" />
                </div>
               
            </div>
            <div class="clearfix"></div>
            <!-- Button -->
            <div class="btn-box-bottom">
                <asp:Button runat="server" CssClass="btn btn-primary" ID="btnSave" Text="Save" OnClick="btnSave_Click" OnClientClick="return validateOffer();" />
                <input type="button" class="btn btn-primary" value="Reset" onclick="return $('#txtOfferID').select();" />
                <input class="btn btn-warning" type="button" value="Back" onclick="location = 'OfferManage.aspx'" />
            </div>
        </div>
    </div>
    <asp:HiddenField runat="server" ID="hdHtmlString" ClientIDMode="Static"/>
</asp:Content>
