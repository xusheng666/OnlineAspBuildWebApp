<%@ Page Title="" Language="C#" MasterPageFile="~/SiteHome.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Onecalendar.WebPortal.Default2" %>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
<section class="engine"><a rel="external" href="http://www.calendarone.com">http://www.calendarone.com/</a></section>
        <section class="mbr-section mbr-section-hero mbr-section-full mbr-parallax-background mbr-section-with-arrow mbr-after-navbar" id="header1-6" style="background-image: url(assets/images/mbr-2000x1114.jpg);">

            <div class="mbr-overlay" style="opacity: 0.5; background-color: rgb(0, 0, 0);"></div>

            <div class="mbr-table-cell">

                <div class="container">
                    <div class="row">
                        <div class="mbr-section col-md-10 col-md-offset-1 text-xs-center">

                            <h1 class="mbr-section-title display-1">One Tuition Portal</h1>
                            <p class="mbr-section-lead lead">Life like an endless road, so we keep learning and improving.&nbsp;<br>
                                with a mentor you can go eaiser and further.</p>
                            <div class="mbr-section-btn"><a class="btn btn-lg btn-primary" href="<%= ResolveUrl("~/Secure/Course/AddCourse.aspx")%>">I want to publish course event</a> 
                                <a class="btn btn-lg btn-white btn-white-outline" href="<%= ResolveUrl("~/Public/CoursesList.aspx")%>">I want to view avaiable mentor events</a></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="mbr-arrow mbr-arrow-floating" aria-hidden="true"><a href="#msg-box4-l"><i class="mbr-arrow-icon"></i></a></div>

        </section>
    <section class="mbr-section" id="msg-box4-l" style="background-color: rgb(242, 242, 242); padding-top: 120px; padding-bottom: 120px;">


            <div class="container">
                <div class="row">
                    <div class="mbr-table-md-up">

                        <div class="mbr-table-cell mbr-right-padding-md-up mbr-valign-top col-md-7 image-size" style="width: 50%;">
                            <div class="mbr-figure">
                                <%--<iframe class="mbr-embedded-video" src="https://www.youtube.com/embed/Tq7p44IA-1U?rel=0&amp;amp;showinfo=0&amp;autoplay=0&amp;loop=0" width="1280" height="720" frameborder="0" allowfullscreen></iframe>--%>
                            </div>
                        </div>




                        <div class="mbr-table-cell col-md-5 text-xs-center text-md-left content-size">
                            <h3 class="mbr-section-title display-2">INTRO WITH YOUTUBE VIDEO</h3>


                            <div><a class="btn btn-primary" href="http://www.calendarone.com">MORE</a></div>
                        </div>




                    </div>
                </div>
            </div>

        </section>
    </asp:Content>