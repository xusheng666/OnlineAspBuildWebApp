<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Onecalendar.WebPortal._Default" %>

<%@ Register Src="~/CustomControl/SideBarCustControl.ascx" TagPrefix="uc1" TagName="SideBarCustControl" %>
<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <%-- below for slides show in the home page --%>
    <%--<section class="featured">
        <div class="banner-wrap">
            <div class="banner">
                <div class="banner-img">
                    <div id="carousel">
                        <div id="slides">
                            <ul>
                                <li>
                                    <img src="Content/images/banner1.jpg" alt="Slide 1" /></li>
                                <li>
                                    <img src="Content/images/banner2.jpg" alt="Slide 2" /></li>
                                <li>
                                    <img src="Content/images/banner3.jpg" alt="Slide 3" /></li>
                            </ul>
                            <div class="clear"></div>
                        </div>
                        <div class="clear"></div>
                        <div id="buttons">
                            <a href="#" id="prev">prev</a> <a href="#" id="next">next</a>
                            <div class="clear"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearing"></div>
        </div>
    </section>--%>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <div class="page">
        <div class="primary-col">
            <div class="generic">
                <div class="panel">
                    <div class="title" style="float: left;">
                        <h1>Avaiable Courses</h1>
                    </div>
                    <div style="float: right;">
                        <div class="searchtext">
                            <asp:TextBox ID="searchKey" runat="server" type="text" name="s" value="" placeholder="Search" CssClass="searchtext" />
                        </div>
                        <asp:ImageButton ID="freetextsearch" ImageUrl="~/Content/images/search-bt.jpg" runat="server" OnClick="btnFreetextSearch_Click"/>
                    </div>
                </div>
                <hr />
            </div>
            <div class="clearing"></div>
            <div class="wrap-1">
                <asp:ListView runat="server" ID="lvCourses" OnPagePropertiesChanging="OnPagePropertiesChanging"
                    GroupPlaceholderID="groupPlaceHolder1" ItemPlaceholderID="itemPlaceHolder1"  OnItemCommand="lvCourses_ItemCommand" >
                    <LayoutTemplate>
                        <table style="width:100%;">
                            <%--<tr runat="server" id="itemPlaceholder"></tr>--%>
                            <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                            <tr>
                                <td colspan="3">
                                    <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lvCourses" PageSize="4">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true"
                                                ShowNextPageButton="false" />
                                            <asp:NumericPagerField ButtonType="Link" />
                                            <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton="false" />
                                        </Fields>
                                    </asp:DataPager>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <GroupTemplate>
                        <tr>
                            <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                        </tr>
                    </GroupTemplate>
                    <ItemTemplate>
                        <tr runat="server">
                            <td runat="server">
                                <div class="content mar-top30">
                                    <img src="<%#Eval("COURSE_IMAGEPATH")%>" alt="image" class="float-left mar-right30 imgdisplay" />
                                    <asp:LinkButton ID="courseName" runat="server" CommandName="view" CommandArgument='<%#Eval("COURSEID")%>'><h2><%#Eval("COURSE_NAME") %></h2></asp:LinkButton>
                                    <p><%#Eval("COURSE_DETAIL") %></p>
                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            </div>
            <%--<div class="generic bdr-bottom-none">
                <div class=" panel">
                    <div class="title">
                        <h1>Curabitur euismod risus vitae nisl facilisis vitae</h1>
                    </div>
                    <div class="content">
                        <h2>Integer congue gravida eros ac interdum. Nam suscipit, eros vitae pulvinar dapibus, leo
                            <br />
                            augue scelerisque lorem, ut elementum augue elit non </h2>
                        <p>Vestibulum purus metus, luctus euismod mattis nec, tristique vitae ipsum. Phasellus dapibus, nisi ut interdum fermentum, turpis tellus semper massa, sit amet placerat sapien justo non ipsum. Vestibulum enim erat, mattis vel aliquet quis, mollis sit amet ligula. Mauris lobortis blandit aliquam. Curabitur quam risus, condimentum vel eleifend et, tincidunt vitae lacu et urna eu eros euismod te.</p>
                        <p>Sed egestas, ante et vulputate volutpat, eros pede semper est, vitae luctus metus libero eu augue. Morbi purus libero, faucibus adipiscing, commodo quis, gravida id, est. Sed lectus. Praesent elementum hendrerit tortor. Sed semper lorem at felis. Vestibulum volutpat, lacus a ultrices sagittis, mi neque euismod dui, eu pulvinar nunc sapien ornare nisl. Phasellus pede arcu, dapibus eu, fermentum et, dapibus sed, urna.</p>
                        <div class="button"><a href="#">More Info</a></div>
                    </div>
                </div>
            </div>--%>
            <div class="clearing"></div>
        </div>
        <!---primary-col--->
        <uc1:SideBarCustControl runat="server" ID="SideBarCustControl" />
        <!---side-bar--->
        <div class="clearing"></div>
    </div>
</asp:Content>
