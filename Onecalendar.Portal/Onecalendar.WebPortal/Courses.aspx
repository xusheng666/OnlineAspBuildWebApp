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
                <div class=" panel">
                    <div class="title">
                        <h1>Services</h1>
                    </div>
                    <div class="content">
                        <img src="Content/images/img6.jpg" alt="image" class="float-left mar-right30" />
                        <h2>Maecenas adipiscing eros vel purus port
            titor pretium tesque id quam risus</h2>
                        <p>Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.</p>
                        <p>Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus. Nam nulla quam, gravida non, commodo a, sodales sit amet, nisi.</p>
                    </div>
                    <div class="content mar-top30">
                        <img src="Content/images/img7.jpg" alt="image" class="float-left mar-right30" />
                        <h2>Integer vitae libero ac risus egestas placerat. Ut aliquam sollicitudin leo.</h2>
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.</p>
                        <p>Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci. Aenean dignissim pellentesque felis.</p>
                    </div>
                    <div class="content mar-top30">
                        <img src="Content/images/img8.jpg" alt="image" class="float-left mar-right30" />
                        <h2>Donec quis dui at dolor tempor interdum. Vivamus molestie gravida turpis.</h2>
                        <p>Pellentesque fermentum dolor. Aliquam quam lectus, facilisis auctor, ultrices ut, elementum vulputate, nunc.</p>
                        <p>Sed adipiscing ornare risus. Morbi est est, blandit sit amet, sagittis vel, euismod vel, velit. Pellentesque egestas sem. Suspendisse commodo ullamcorper magna.</p>
                    </div>
                    <div class="content mar-top30">
                        <img src="Content/images/img6.jpg" alt="image" class="float-left mar-right30" />
                        <h2>Fusce lobortis lorem at ipsum semper sagittis.Nam convallis pellentesque nisl.</h2>
                        <p>Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.</p>
                        <p>Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus. Nam nulla quam, gravida non, commodo a, sodales sit amet, nisi.</p>
                    </div>
                    <div class="content mar-top30">
                        <img src="Content/images/img7.jpg" alt="image" class="float-left mar-right30" />
                        <h2>Nam convallis pellentesque nisl.Integer vitae libero ac risus egestas placerat.</h2>
                        <p>Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.</p>
                        <p>Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus. Nam nulla quam, gravida non, commodo a, sodales sit amet, nisi.</p>
                    </div>
                    <div class="content mar-top30">
                        <img src="Content/images/img8.jpg" alt="image" class="float-left mar-right30" />
                        <h2>Praesent placerat risus quis eros.Cras ornare tristique elit.commodo felis quis.</h2>
                        <p>Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.</p>
                        <p>Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus. Nam nulla quam, gravida non, commodo a, sodales sit amet, nisi.</p>
                    </div>
                </div>
            </div>
            <div class="clearing"></div>
        </div>
        <uc1:sidebarcustcontrol runat="server" id="SideBarCustControl" />

    </div>
</asp:Content>
