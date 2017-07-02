<%@ Page Title="Courses" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="Onecalendar.WebPortal.Courses" %>

<%@ Register Src="~/CustomControl/SideBarCustControl.ascx" TagPrefix="uc1" TagName="SideBarCustControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <%--here using the jquery rain with the calendar http://www.jqueryrain.com/?lo_EWr2U --%>
    <script type="text/javascript">
        $(function () {
            flatpickr(".flatpickr", {
                enableTime: true,
                altInput: true,
                altFormat: "F j, Y h:i K"
            });
        });
    </script>
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
                        <asp:ImageButton ID="freetextsearch" ImageUrl="~/Content/images/search-bt.jpg" runat="server" OnClick="btnFreetextSearch_Click"/>
                        <%--<a OnClick="btnFreetextSearch_Click" runat="server">
                            <img src="<%= ResolveUrl("~/Content/images/search-bt.jpg")%>" alt="search" />
                                <asp:Button ID="freetextsearch" runat="server" OnClick="btnFreetextSearch_Click"/>
                            </a>--%>
                    </div>

                </div>
                <hr />
                <div class="panel" style="padding:10px 0;">
                        <asp:Label ID="lbStartDttm" Text="Start Date" runat="server" />
                        <asp:TextBox ID="tbStartDttm" class="flatpickr" runat="server" style="width:10em;" placeholder="Select Date.."/>
                        <asp:Label ID="lbEndDttm" Text="End Date" runat="server" />
                        <asp:TextBox ID="tbEndDttm" class="flatpickr" runat="server" style="width:10em;" placeholder="Select Date.."/>
                        <asp:Button ID="btnSearch" class="button" Text="Filter Course" runat="server" OnClick="btnSearch_Click" />
                    </div>
                <div class="clearing"></div>
                <div class="panel">
                    <div class="padding-bottom">
                        <asp:Button ID="btnAdd" class="button" Text="Add New Course" runat="server" OnClick="btnAdd_Click" />
                    </div>
                    
                    <asp:GridView CssClass="gridview" ID="gvwDash" runat="server" Visible="true" ShowHeaderEmpty="true" AutoGenerateColumns="false"
                        Width="90%" AllowPaging="true" OnPageIndexChanging="OnPageIndexChanging" PageSize="5">
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
