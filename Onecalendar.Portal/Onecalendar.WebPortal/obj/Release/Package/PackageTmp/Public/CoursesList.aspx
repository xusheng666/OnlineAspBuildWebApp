<%@ Page Title="Courses" Language="C#" MasterPageFile="~/SiteModern.Master" AutoEventWireup="true" CodeBehind="CoursesList.aspx.cs" Inherits="Onecalendar.WebPortal.CoursesList" %>

<%@ Register Src="~/CustomControl/SideBarCustControl.ascx" TagPrefix="uc1" TagName="SideBarCustControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div style="border: dotted; border-color: goldenrod; margin: 0 10%; padding: 20px;">
        <div class="mbr-section mbr-section__container mbr-section__container--middle">
            <div class="row">
                <div class="col-xs-12 text-xs-center">
                    <h3 class="mbr-section-title display-2">View Mentor Events</h3>
                    <%--<div class="searchtext">
                                <asp:TextBox ID="searchKey" runat="server" type="text" name="s" value="" placeholder="Search" style="vertical-align:middle;" />
                                <asp:ImageButton ID="freetextsearch" ImageUrl="~/Content/images/search-bt.jpg" runat="server" OnClick="btnFreetextSearch_Click" />
                            </div>--%>
                </div>
            </div>

            <div class="table table-bordered">
                <div class="label" style="width: 100%; padding: 10px 0px 10px 10px; margin-bottom: 10px; text-align: left; background-color: #808080;">
                    Search Criteria:
                </div>
                <div class="form-inline" style="margin: 10px;">
                    <asp:Label class="control-label" ID="Label1" Text="Key Word :" runat="server" />
                    <asp:TextBox ID="searchKey" runat="server" type="text" value="" class="form-control" MaxLength="50"/>
                </div>
                <div class="form-inline" style="margin: 10px;">
                    <asp:Label class="control-label" ID="lbStartDttm" Text="Start Date :" runat="server" />
                    <asp:TextBox ID="tbStartDttm" class="flatpickr" runat="server" Style="width: 10em;" MaxLength="50"/>
                    <asp:Label class="control-label" ID="lbEndDttm" Text="End Date :" runat="server" />
                    <asp:TextBox ID="tbEndDttm" class="flatpickr" runat="server" Style="width: 10em;" MaxLength="50"/>
                </div>
            </div>
            <div>
                <asp:Button ID="btnSearch" class="btn btn-primary" Text="Filter Course" runat="server" OnClick="btnSearch_Click" />
            </div>

        </div>
        <div class="mbr-section mbr-section-nopadding">

            <div class="label" style="width: 100%; padding: 10px 0px 10px 10px; text-align: left; background-color: #808080;">
                Course Result:
            </div>
            <div class="table table-bordered">
                <asp:GridView CssClass="gridview" ID="gvwDash" runat="server" Visible="true" ShowHeaderEmpty="true" AutoGenerateColumns="false"
                    Width="90%" AllowPaging="true" OnPageIndexChanging="OnPageIndexChanging" PageSize="5">
                    <Columns>
                        <asp:BoundField HeaderText="Name" DataField="COURSE_NAME" HeaderStyle-Width="20%" />
                        <asp:BoundField HeaderText="Description" DataField="COURSE_DETAIL" HeaderStyle-Width="35%" />
                        <asp:ImageField DataImageUrlField="COURSE_IMAGEPATH" HeaderStyle-Width="35%" ControlStyle-CssClass="img-thumbnail"></asp:ImageField>
                        <asp:TemplateField HeaderText="Action" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:HyperLink ID="Edit" runat="server"
                                    NavigateUrl='<%# "~/Public/CourseDetailView.aspx?CourseId=" + Eval("COURSEID")  %>'>View</asp:HyperLink>
                                <asp:HyperLink ID="Register" runat="server" NavigateUrl='<%# Eval("COURSE_REG_URL") %>'>Register</asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <div class="padding-bottom" />
        </div>
    </div>
    <%--<uc1:SideBarCustControl runat="server" ID="SideBarCustControl" />--%>
</asp:Content>
