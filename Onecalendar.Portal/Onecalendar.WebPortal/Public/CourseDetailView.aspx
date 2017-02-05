<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CourseDetailView.aspx.cs" Inherits="Onecalendar.WebPortal.Public.CourseDetailView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page mar-top30">
        <div class="title">
            <h1>Course Detail</h1>
            <br />
            <h2></h2>
        </div>
        <div class="content">
            <div class="course-form">
                <label>
                    <span>Course Name</span>
                    <asp:Label ID="courseName" class="input_text" runat="server" />
                </label>
                <label>
                    <span>Course Image</span>
                    <asp:Image ID="image" runat="server" ImageUrl="dummay" alt="image" class="input_text float-left mar-right30 imgdisplay" 
                        style="margin:10px 0px!important;"/>
                </label>
                <label>
                    <span>Description</span>
                    <asp:Label TextMode="MultiLine" ID="description" class="message" runat="server" />
                </label>
                <asp:Button runat="server" ID="btnBackHome" class="button" Text="Go Home" OnClick="btnBackHome_Click" />
            </div>
        </div>
    </div>
</asp:Content>
