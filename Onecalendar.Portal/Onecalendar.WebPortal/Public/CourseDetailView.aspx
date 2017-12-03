<%@ Page Title="" Language="C#" MasterPageFile="~/SiteModern.Master" AutoEventWireup="true" CodeBehind="CourseDetailView.aspx.cs" Inherits="Onecalendar.WebPortal.Public.CourseDetailView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div style="border: dotted; border-color: goldenrod; margin: 0 10%; padding: 20px;">
        <div class="mbr-section mbr-section__container mbr-section__container--middle">
            <div class="row">
                <div class="col-xs-12 text-xs-center">
                    <h3 class="mbr-section-title display-2">Course Detail</h3>
                </div>
            </div>

            <div class="mbr-section mbr-section-nopadding">
                <div class="table table-bordered">
                    <div>
                        <span class="col-md-2">Course Name</span>
                        <asp:Label ID="courseName" class="col-md-10" runat="server" />
                    </div>
                    <div>
                        <span style="padding-right: 1000px!important;"></span>
                    </div>
                    <div>
                        <span class="col-md-2">Course Image</span>
                        <asp:Image ID="image" runat="server" ImageUrl="dummay" alt="image" class="col-md-10 input_text float-left mar-right30 imgdisplay"
                            Style="margin: 10px 0px!important;" />
                    </div>
                    <div>
                        <span class="col-md-2" style="padding-right: 1000px!important;"></span>
                    </div>
                    <div>
                        <span class="col-md-2">Description</span>
                        <asp:Label TextMode="MultiLine" ID="description" class="col-md-10 message" runat="server" />
                    </div>
                    <div>
                        <span style="padding-right: 1000px!important;"></span>
                    </div>
                    <div>
                        <span class="col-md-2">Company Detail</span>
                        <asp:Label ID="companyDetail" class="input_text" runat="server" />
                    </div>
                    <div>
                        <span style="padding-right: 1000px!important;"></span>
                    </div>
                    <div>
                        <span class="col-md-2">Contact Info</span>
                        <asp:Label ID="contactInfo" class="input_text" runat="server" />
                    </div>
                    <div>
                        <span style="padding-right: 1000px!important;"></span>
                    </div>
                    <div>
                        <span class="col-md-2" style="width: 50%; margin: 10px 0px;">Events under this course:</span>
                    </div>
                    <div>
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
                    </div>
                    <asp:Button runat="server" ID="btnBackHome" class="btn btn-primary" Text="Go Back" OnClick="btnBackCourses_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
