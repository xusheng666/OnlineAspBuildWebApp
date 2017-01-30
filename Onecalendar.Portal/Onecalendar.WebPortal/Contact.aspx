<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Onecalendar.WebPortal.Contact" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="page mar-top30">
        <div class="title">
            <h1>Contact us</h1>
            <br />
            <h2>Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus hasellus ultrices nulla quis nibh. Quisque a lectus.</h2>
        </div>
        <div class="content mar-top30">
            <form>
                <div class="contact-form">
                    <label>
                        <span>Full name</span>
                        <input type="text" class="input_text" name="name" id="name" />
                    </label>
                    <label>
                        <span>Email</span>
                        <input type="text" class="input_text" name="email" id="email" />
                    </label>
                    <label>
                        <span>Subject</span>
                        <input type="text" class="input_text" name="subject" id="subject" />
                    </label>
                    <label>
                        <span>Message</span>
                        <textarea class="message" name="feedback" id="feedback"></textarea>
                        <input type="button" class="button" value="Submit Form" />
                    </label>
                </div>
            </form>
            <div class="address mar-bottom30">
                <div class="panel">
                    <div class="title">
                        <h1>Address - 01</h1>
                    </div>
                    <div class="content">
                        <p>
                            Block No:5, Some where Road,<br />
                            City name, State, Country name
                        </p>
                        <p class="padTop"><span>Phone :</span> 000 888 88888</p>
                        <p><span>Email :</span> <a href="mailto:info@companyname.com">info@companyname.com</a></p>
                    </div>
                </div>
                <div class="clearing"></div>
                <div class="panel marginTop">
                    <div class="title">
                        <h1>Address - 02</h1>
                    </div>
                    <div class="content">
                        <p>
                            Block No:5, Some where Road,<br />
                            City name, State, Country name
                        </p>
                        <p class="padTop"><span>Phone :</span> 000 888 88888</p>
                        <p><span>Email :</span> <a href="mailto:info@companyname.com">info@companyname.com</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
