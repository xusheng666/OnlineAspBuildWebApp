<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="Onecalendar.WebPortal.Public.UserRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page mar-top30">
        <div class="content">
            <div class="contact-form">
                <label>
                    <span>User Name</span>
                    <asp:TextBox ID="userName" class="input_text" runat="server" />
                </label>
                <label>
                    <span>Display Name</span>
                    <asp:TextBox ID="displayName" class="input_text" runat="server" />
                </label>
                <label>
                    <span>Email</span>
                    <asp:TextBox ID="email" class="input_text" runat="server" />
                </label>
                <label>
                    <span>Password</span>
                    <asp:TextBox ID="pass1" class="input_text" runat="server" TextMode="Password" />
                </label>
                <label>
                    <span>Confirmed Password</span>
                    <asp:TextBox ID="pass2" class="input_text" runat="server" TextMode="Password" />
                </label>
                <asp:Button runat="server" ID="btnRegister" class="button" Text="Register" OnClick="btnRegister_Click" />
            </div>
        </div>
    </div>
</asp:Content>
