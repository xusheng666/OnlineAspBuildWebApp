<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddCourse.aspx.cs" Inherits="Onecalendar.WebPortal.Secure.Course.AddCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page mar-top30">
        <div class="title">
            <h1>Add New Course</h1>
            <br />
            <h2></h2>
        </div>
        <div class="content">
            <div class="contact-form">
                <label>
                    <span>Course Name</span>
                    <asp:TextBox ID="courseName" class="input_text" runat="server" />
                </label>
                <label>
                    <span>Course Image</span>
                    <%--<input type="text" class="input_text" name="subject" id="subject" />--%>
                    <asp:FileUpload ID="fileUpload" runat="server" class="input_text"/>
                </label>
                <label>
                    <span>Description</span>
                    <asp:TextBox TextMode="MultiLine" ID="description" class="message" runat="server"/>
                </label>
            <asp:Button runat="server" ID="btnAddCourse" class="button" Text="Add New Course" OnClick="btnAddCourse_Click"   />
            </div>
            
        </div>
    </div>
</asp:Content>
