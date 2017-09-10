<%@ Page Title="" Language="C#" MasterPageFile="~/SiteModern.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Onecalendar.WebPortal.Secure.Login.LoginSignup" %>

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

    <section class="mbr-section mbr-after-navbar" id="form1-k" style="background-color: rgb(255, 255, 255); padding-top: 120px; padding-bottom: 120px;">

        <div style="border: dotted; border-color: goldenrod; margin: 0 30%;">
            <div class="mbr-section mbr-section-nopadding">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 text-xs-center">
                            <h3 class="mbr-section-title display-2">Login</h3>
                            <small class="mbr-section-subtitle">login to our mentor world.</small>
                        </div>
                        <div class="col-xs-12 col-lg-10 col-lg-offset-1" data-form-type="formoid">


                            <div data-form-alert="true">
                                <div hidden="" data-form-alert-success="true" class="alert alert-form alert-success text-xs-center">Thanks for filling out form!</div>
                            </div>

                            <input type="hidden" value="h1fOvtApgTInMZvw9y3WE+iewKMaVyDqbf4nOL16VxMZncK6bns9z+3GvipVGxsDaPBwbTfXEgO+espmIwQScu3tGKEHDHR6Dex2NgGDdH4vDAZhXCS2aAZgJAF4ijbJ" data-form-email="true">

                            <div class="row">

                                <div class="col-xs-12 col-md-4" style="width: 100%!important;">
                                    <div class="form-group">
                                        <label class="form-control-label" for="form1-k-name">User Name<span class="form-asterisk">*</span></label>
                                        <asp:TextBox ID="userId" class="form-control" placeholder="Enter UserName" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">

                                <div class="col-xs-12 col-md-4" style="width: 100%!important;">
                                    <div class="form-group">
                                        <label class="form-control-label" for="form1-k-email">Password<span class="form-asterisk">*</span></label>
                                        <asp:TextBox ID="password" class="form-control-label" placeholder="Enter Password" runat="server" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div style="margin: 0 15%;">
                                <asp:Button ID="submit" class="btn btn-primary" runat="server" OnClick="submit_Click" Text="Login" />
                                <asp:Button ID="register" class="btn btn-primary" runat="server" OnClick="register_Click" Text="Register" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
