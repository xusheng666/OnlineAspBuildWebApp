﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SiteModern.Master" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="Onecalendar.WebPortal.Public.UserRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <%--<section class="mbr-section mbr-after-navbar" id="form1-k" style="background-color: rgb(255, 255, 255); padding-top: 120px; padding-bottom: 120px;">--%>
        <div style="border: dotted; border-color: goldenrod; margin: 0 10%; padding: 20px;">
            <div class="mbr-section mbr-section__container mbr-section__container--middle">
                <div class="row">
                    <div class="col-xs-12 text-xs-center">
                        <h3 class="mbr-section-title display-2">Register</h3>
                        <small class="mbr-section-subtitle">Register account to our mentor world.</small>
                    </div>
                    <div class="col-xs-12 col-lg-10 col-lg-offset-1" data-form-type="formoid">
                        <div class="row">
                            <div class="col-xs-12 col-md-4" style="width: 100%!important;">
                                <div class="form-group">
                                    <label class="form-control-label" for="form1-k-name">User Name<span class="form-asterisk">*</span></label>
                                    <asp:TextBox ID="userName" class="form-control" placeholder="Enter UserName" runat="server" OnTextChanged="userName_TextChanged"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="reg" ControlToValidate="userName" ErrorMessage="User Name is mandatory." runat="server" ForeColor="Red" Display="Dynamic"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-md-4" style="width: 100%!important;">
                                <div class="form-group">
                                    <label class="form-control-label" for="form1-k-name">Display Name</label>
                                    <asp:TextBox ID="displayName" class="form-control" placeholder="Enter Display Name" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-md-4" style="width: 100%!important;">
                                <div class="form-group">
                                    <label class="form-control-label" for="form1-k-name">Email Address<span class="form-asterisk">*</span></label>
                                    <asp:TextBox ID="email" class="form-control" placeholder="Enter Email Address" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="reg" ControlToValidate="email" ErrorMessage="Email Address is mandatory." runat="server" ForeColor="Red" Display="Dynamic"/>
                                    <asp:RegularExpressionValidator ValidationGroup="reg" ValidationExpression="^(?(\s)(\s.+?\s@)|(([0-9a-zA-Z]((\.(?!\.))|[-!#\$%&'\*\+/=\?\^`\{\}\|~\w])*)(?<=[0-9a-zA-Z])@))(?(\[)(\[(\d{1,3}\.){3}\d{1,3}\])|(([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,6}))$" 
                                        ControlToValidate="email" ErrorMessage="Invalid Email Format." runat="server" ForeColor="Red" Display="Dynamic"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-md-4" style="width: 100%!important;">
                                <div class="form-group">
                                    <label class="form-control-label" for="form1-k-name">Password<span class="form-asterisk">*</span></label>
                                    <asp:TextBox ID="pass1" class="form-control" placeholder="Enter Password" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="reg" ControlToValidate="pass1" ErrorMessage="Password is mandatory." runat="server" ForeColor="Red" Display="Dynamic"/>
                                    <%--<asp:RegularExpressionValidator ValidationGroup="reg" ValidationExpression="^{8}$" ControlToValidate="pass1" ErrorMessage="Password must be more than 8 chars." runat="server" ForeColor="Red" Display="Dynamic"/>--%>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-md-4" style="width: 100%!important;">
                                <div class="form-group">
                                    <label class="form-control-label" for="form1-k-name">Confirmed Password<span class="form-asterisk">*</span></label>
                                    <asp:TextBox ID="pass2" class="form-control" placeholder="Enter Confirmed Password" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="reg" ControlToValidate="pass2" ErrorMessage="Password is mandatory." runat="server" ForeColor="Red" Display="Dynamic"/>
                                    <asp:CompareValidator ValidationGroup="reg" ControlToValidate="pass2" ControlToCompare="pass1" ErrorMessage="Password is not the same." runat="server" ForeColor="Red" Display="Dynamic"/>
                                    <%--<asp:RegularExpressionValidator ValidationGroup="reg" ValidationExpression="^{8}$" ControlToValidate="pass2" ErrorMessage="Password must be more than 8 chars." runat="server" ForeColor="Red" Display="Dynamic"/>--%>
                                </div>
                            </div>
                        </div>
                        <div style="margin-left:35%;">
                            <asp:Button ID="login" class="btn btn-primary" runat="server" OnClick="login_Click" Text="Login" />
                            <asp:Button runat="server" ValidationGroup="reg" ID="btnRegister" class="btn btn-primary" Text="Register" OnClick="btnRegister_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <%--</section>--%>

</asp:Content>
