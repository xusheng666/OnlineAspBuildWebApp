<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Onecalendar.WebPortal.Secure.Login.LoginSignup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        input[type=text], input[type=password] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        .loginbutton {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }

        .container {
            padding: 16px;
        }

        span.psw {
            float: right;
            padding-top: 16px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <asp:Label ID="result" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <div class="page">
        <div class="primary-col">
            <div class="container">
                <label><b>Username</b></label>
                <asp:TextBox ID="userId" placeholder="Enter UserName" runat="server"></asp:TextBox>

                <label><b>Password</b></label>
                <asp:TextBox ID="password" placeholder="Enter Password" runat="server" TextMode="Password"></asp:TextBox>
                <%--<input type="password" placeholder="Enter Password" name="psw" required>--%>

                <asp:Button ID="submit" class="loginbutton" runat="server" OnClick="submit_Click" Text="Login" />
            </div>

        </div>
    </div>
</asp:Content>
