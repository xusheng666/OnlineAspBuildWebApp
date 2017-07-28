<%@ Page Title="" Language="C#" MasterPageFile="~/SiteModern.Master" AutoEventWireup="true" CodeBehind="CreateCompany.aspx.cs" Inherits="Onecalendar.WebPortal.Secure.User.CreateCompany" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <section class="mbr-section mbr-after-navbar" id="form1-k" style="background-color: rgb(255, 255, 255); padding-top: 120px; padding-bottom: 120px;">

        <div style="border: dotted; border-color: goldenrod; margin: 0 10%;">
            <div class="mbr-section mbr-section-nopadding">
                <div class="col-xs-12 text-xs-center">
                    <h3 class="mbr-section-title display-2">Create Company</h3>
                </div>
            </div>
            <div class="form-group">
                <div class="table table-bordered">
                    <div>
                        <span>Company Name</span>
                        <asp:TextBox ID="companyName" class="form-control" runat="server" />
                    </div>
                    <div>
                        <span>Company Detail</span>
                        <asp:TextBox ID="companyDetail" class="form-control" runat="server" />
                    </div>
                    <div>
                        <span>Company Contact Info</span>
                        <asp:TextBox ID="contactInfo" class="form-control" runat="server" />
                    </div>
                    <div>
                        <span>Company Location</span>
                        <asp:TextBox ID="location" class="form-control" runat="server" />
                    </div>
                    <asp:Button runat="server" ID="btnGoToList" class="btn btn-primary" Text="Back to Company List" OnClick="btnGoToList_Click" />
                    <asp:Button runat="server" ID="btnAddCompany" class="btn btn-primary" Style="margin-left: 20px;" Text="Add New Company" OnClick="btnAddCompany_Click" />
                </div>
            </div>
        </div>
    </section>
</asp:Content>
