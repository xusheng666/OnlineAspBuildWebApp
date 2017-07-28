<%@ Page Title="Contact" Language="C#" MasterPageFile="~/SiteModern.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Onecalendar.WebPortal.Contact" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <section class="mbr-section mbr-after-navbar" id="form1-k" style="background-color: rgb(255, 255, 255); padding-top: 120px; padding-bottom: 120px;">

        <div style="border: dotted; border-color: goldenrod; margin: 0 10%;">
            <div class="mbr-section mbr-section-nopadding">
                <div class="container">
                    <div class="col-xs-12 text-xs-center">
                        <h3 class="mbr-section-title display-2">Contact Us</h3>
                    </div>
                    <div>
                        <div class="row row-sm-offset">
                            <div class="col-xs-12 col-md-4" style="width: 100%!important;">
                                <div class="form-group">
                                    <label class="form-control-label" for="form1-k-name">Full Name<span class="form-asterisk">*</span></label>
                                    <asp:TextBox ID="name" class="form-control" placeholder="Enter UserName" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-md-4" style="width: 100%!important;">
                                <div class="form-group">
                                    <label class="form-control-label" for="form1-k-email">Email<span class="form-asterisk">*</span></label>
                                    <asp:TextBox ID="email" class="form-control" placeholder="Enter Email Address" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-md-4" style="width: 100%!important;">
                                <div class="form-group">
                                    <label class="form-control-label" for="form1-k-email">Subject<span class="form-asterisk">*</span></label>
                                    <asp:TextBox ID="subject" class="form-control" placeholder="Enter Subject" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-md-4" style="width: 100%!important;">
                                <div class="form-group">
                                    <label class="form-control-label" for="form1-k-email">Message<span class="form-asterisk">*</span></label>
                                    <asp:TextBox ID="message" rows="7" Height="100px" class="form-control" placeholder="Enter Message" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div><button type="submit" class="btn btn-primary">CONTACT US</button></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
