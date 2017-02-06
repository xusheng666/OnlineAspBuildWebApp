<%@ Page Title="Courses" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="Onecalendar.WebPortal.Courses" %>

<%@ Register Src="~/CustomControl/SideBarCustControl.ascx" TagPrefix="uc1" TagName="SideBarCustControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page">
        <div class="primary-col">
            <div class="generic">
                <div class="panel">
                    <div class="title" style="float: left;">
                        <h1>Courses</h1>
                    </div>
                    <div style="float: right;">
                        <div class="searchtext">
                            <asp:TextBox ID="searchKey" runat="server" type="text" name="s" value="" placeholder="Search" CssClass="searchtext" />
                        </div>
                        <a>
                            <img src="<%= ResolveUrl("~/Content/images/search-bt.jpg")%>" alt="search" /></a>
                    </div>
                    
                </div>
                <hr />
                <div class="clearing"></div>
                <div class="panel">
                        <div class="padding-bottom">
                            <asp:Button ID="btnAdd" class="button" Text="Add New Course" runat="server" OnClick="btnAdd_Click" />
                        </div>
                        <asp:GridView CssClass="gridview" ID="gvwDash" runat="server" Visible="true" ShowHeaderEmpty="true" AutoGenerateColumns="false"
                            Width="90%">
                            <Columns>
                                <asp:BoundField HeaderText="Name" DataField="COURSE_NAME" HeaderStyle-Width="20%" />
                                <asp:BoundField HeaderText="Description" DataField="COURSE_DETAIL" HeaderStyle-Width="35%" />
                                <asp:ImageField DataImageUrlField="COURSE_IMAGEPATH" HeaderStyle-Width="35%" ControlStyle-CssClass="imgdisplay"></asp:ImageField>
                                <asp:TemplateField HeaderText="Action" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="Edit" runat="server"
                                            NavigateUrl='<%# "~/Secure/Course/EditCourse.aspx?CourseId=" + Eval("COURSEID")  %>'>Edit</asp:HyperLink>
                                        <asp:LinkButton ID="btnDelete" runat="server" CommandArgument='<%#Eval("COURSEID")%>' OnCommand="lnkDelete" Text="Delete"
                                            OnClientClick="return confirm ('Are you sure you want to delete this course?')">
                                        </asp:LinkButton>
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
