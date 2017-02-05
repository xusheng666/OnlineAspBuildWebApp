<%@ Page Title="Courses" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="Onecalendar.WebPortal.Courses" %>

<%@ Register Src="~/CustomControl/SideBarCustControl.ascx" TagPrefix="uc1" TagName="SideBarCustControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page  mar-top30">
        <div class="primary-col">
            <div class="generic bdr-bottom-none">
                <div class="panel">
                    <div class="title">
                        <h1>Courses</h1>
                    </div>
                    <hr />
                    <div class="padding-bottom">
                        <asp:Button ID="btnAdd" class="button" Text="Add New Course" runat="server" OnClick="btnAdd_Click" />
                    </div>
                    <asp:GridView CssClass="gridview" ID="gvwDash" runat="server" Visible="true" ShowHeaderEmpty="true" AutoGenerateColumns="false" Width="90%">
                        <Columns>
                            <asp:BoundField HeaderText="Name" DataField="COURSE_NAME" HeaderStyle-Width="20%" />
                            <asp:BoundField HeaderText="Description" DataField="COURSE_DETAIL" HeaderStyle-Width="35%" />
                            <asp:ImageField DataImageUrlField="PictureURL" HeaderStyle-Width="35%"></asp:ImageField>
                            <asp:TemplateField HeaderText="Action" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:HyperLink ID="Edit" runat="server"
                                        NavigateUrl='<%# "~/Secure/Course/CourseDetailView.aspx?CourseId=" + Eval("COURSEID")  %>'>Edit</asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="padding-bottom" />
            </div>
            <div class="clearing"></div>
        </div>
    </div>
    <uc1:SideBarCustControl runat="server" ID="SideBarCustControl" />
</asp:Content>
