<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateCompany.aspx.cs" Inherits="Onecalendar.WebPortal.Secure.User.CreateCompany" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page mar-top30">
        <div class="title">
            <h1>Create Company</h1>
            <br />
            <h2></h2>
        </div>
        <div class="content">
            <div class="course-form">
                <label>
                    <span>Company Name</span>
                    <asp:TextBox ID="companyName" class="input_text" runat="server" />
                </label>
                <label>
                    <span>Company Detail</span>
                    <asp:TextBox ID="companyDetail" class="input_text" runat="server" />
                </label>
                <label>
                    <span>Company Contact Info</span>
                    <asp:TextBox ID="contactInfo" class="input_text" runat="server" />
                </label>
                <label>
                    <span>Company Location</span>
                    <asp:TextBox ID="location" class="input_text" runat="server" />
                </label>
                <asp:Button runat="server" ID="btnAddCompany" class="button" Text="Add New Company" OnClick="btnAddCompany_Click"   />
        </div>
    </div>
</asp:Content>
