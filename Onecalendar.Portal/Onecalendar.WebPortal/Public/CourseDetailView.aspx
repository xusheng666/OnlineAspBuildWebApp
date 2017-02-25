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
                    <span style="padding-right:1000px!important;"></span>
                </label>
                <label>
                    <span>Course Image</span>
                    <asp:Image ID="image" runat="server" ImageUrl="dummay" alt="image" class="input_text float-left mar-right30 imgdisplay" 
                        style="margin:10px 0px!important;"/>
                </label>
                <label>
                    <span style="padding-right:1000px!important;"></span>
                </label>
                <label>
                    <span>Description</span>
                    <asp:Label TextMode="MultiLine" ID="description" class="message" runat="server" />
                </label>
                <label>
                    <span style="padding-right:1000px!important;"></span>
                </label>
                <label>
                    <span>Company Detail</span>
                    <asp:Label ID="companyDetail" class="input_text" runat="server" />
                </label>
                <label>
                    <span style="padding-right:1000px!important;"></span>
                </label>
                <label>
                    <span>Contact Info</span>
                    <asp:Label ID="contactInfo" class="input_text" runat="server" />
                </label>
                <label>
                    <span style="padding-right:1000px!important;"></span>
                </label>
                <label>
                    <span style="width:50%;margin:10px 0px;">Events under this course:</span>
                </label>
                <label>
                    <asp:GridView CssClass="gridview" ID="gvwCourseEvents" runat="server" Visible="true"
                        ShowHeaderEmpty="true" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" Width="90%">
                        <Columns>
                            <asp:BoundField DataField="SCHEDULE" HeaderText="Schedule" />
                            <asp:BoundField DataField="LOCATION" HeaderText="Location" />
                            <asp:BoundField DataField="PRICE" HeaderText="Price (S$)" />
                            <asp:BoundField DataField="START_DTTM" HeaderText="Start Date Time" />
                            <asp:BoundField DataField="END_DTTM" HeaderText="End Date Time" />
                        </Columns>
                        <EmptyDataTemplate>No Record Available</EmptyDataTemplate>
                    </asp:GridView>
                </label>
                <asp:Button runat="server" ID="btnBackHome" class="button" Text="Go Home" OnClick="btnBackHome_Click" />
            </div>
        </div>
    </div>
</asp:Content>
