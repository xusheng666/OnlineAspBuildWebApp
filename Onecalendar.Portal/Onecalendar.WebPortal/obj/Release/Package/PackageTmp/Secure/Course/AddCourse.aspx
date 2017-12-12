<%@ Page Title="" Language="C#" MasterPageFile="~/SiteModern.Master" AutoEventWireup="true" CodeBehind="AddCourse.aspx.cs" Inherits="Onecalendar.WebPortal.Secure.Course.AddCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div style="border: dotted; border-color: goldenrod; margin: 0 10%; padding: 20px;">
        <div class="mbr-section mbr-section__container mbr-section__container--middle">
            <div class="row">
                <div class="col-xs-12 text-xs-center">
                    <h3 class="mbr-section-title display-2">Add New Course</h3>
                </div>
            </div>
        </div>
        <div class="mbr-section mbr-section-nopadding">
            <div class="table table-bordered">
                <div>
                    <span>Course Name</span>
                    <asp:TextBox ID="courseName" class="form-control" runat="server" />
                </div>
                <div>
                    <span>Course Image</span>
                    <asp:FileUpload ID="fileUpload" runat="server" class="form-control" />
                </div>
                <div>
                    <span>Description</span>
                    <asp:TextBox TextMode="MultiLine" ID="description" class="form-control" runat="server" Rows="5" />
                </div>
                <div>
                    <span>Tag</span>
                    <asp:TextBox ID="courseTag" class="form-control" runat="server" />
                </div>
                <div>
                    <span>Registration URL</span>
                    <asp:TextBox ID="regURL" class="form-control" runat="server" />
                </div>
            </div>
            <asp:Button runat="server" ID="btnAddCourse" class="btn btn-primary" Text="Add New Course" OnClick="btnAddCourse_Click" />
            <asp:Button runat="server" ID="btnGoCourses" class="btn btn-primary" Style="margin-left: 20px;" Text="Back to Course List" OnClick="btnGoCourses_Click" />
        </div>
    </div>
</asp:Content>
