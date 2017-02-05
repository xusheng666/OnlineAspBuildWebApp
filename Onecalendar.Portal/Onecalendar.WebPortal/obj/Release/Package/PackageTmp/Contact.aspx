<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Onecalendar.WebPortal.Contact" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="page mar-top30">
        <div class="title">
            <h1>Contact us</h1>
            <br />
            <h2></h2>
        </div>
        <div class="content mar-top30">
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
            <div class="address mar-bottom30">
                <div class="panel">
                    <div class="title">
                        <h1>Address</h1>
                    </div>
                    <div class="content">
                        <p>
                            CalendarOne Pte Ltd<br />
                            Blk 334 , Kreta Ayer Road #03-10,<br /> Singapore 080334<br /><br />
                            Our office is located at junction <br />of Kreta Ayer road and Keong Siak street, <br />
                            5 minutes walk from Outram MRT station.
                        </p>
                        <br />
                        <p class="padTop"><span>Phone :</span>(65) 6887 4554</p>
                        <p><span>Email :</span> <a href="enquiry@calendarone.com">enquiry@calendarone.com</a></p>
                    </div>
                </div>
                <div class="clearing"></div>
            </div>
        </div>
    </div>
</asp:Content>
