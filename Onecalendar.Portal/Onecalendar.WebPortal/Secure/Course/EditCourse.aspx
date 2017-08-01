<%@ Page Title="" Language="C#" MasterPageFile="~/SiteModern.Master" AutoEventWireup="true" CodeBehind="EditCourse.aspx.cs" Inherits="Onecalendar.WebPortal.Secure.Course.EditCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <section class="mbr-section mbr-after-navbar" id="form1-k" style="background-color: rgb(255, 255, 255); padding-top: 120px; padding-bottom: 120px;">
        <div style="border: dotted; border-color: goldenrod; margin: 0 10%; padding: 20px;">
            <div class="mbr-section mbr-section__container mbr-section__container--middle">
                <div class="row">
                    <div class="col-xs-12 text-xs-center">
                        <h3 class="mbr-section-title display-2">Update Course</h3>
                        <%--<div class="searchtext">
                                <asp:TextBox ID="searchKey" runat="server" type="text" name="s" value="" placeholder="Search" style="vertical-align:middle;" />
                                <asp:ImageButton ID="freetextsearch" ImageUrl="~/Content/images/search-bt.jpg" runat="server" OnClick="btnFreetextSearch_Click" />
                            </div>--%>
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
                            <asp:Image ID="image" runat="server" ImageUrl="dummay" alt="image"/>
                        </div>
                        <div>
                            <span>Upload New Course Image</span>
                            <asp:FileUpload ID="fileUpload" runat="server" class="form-control" />
                        </div>
                        <div>
                            <span>Description</span>
                            <asp:TextBox TextMode="MultiLine" ID="description" class="form-control" runat="server" />
                        </div>
                        <div>
                            <span>Tag</span>
                            <asp:TextBox ID="courseTag" class="form-control" runat="server" />
                        </div>
                        <div>
                            <span style="width: 50%; margin: 10px 0px;">Events under this course:</span>
                        </div>
                        <div class="table table-bordered">
                            <asp:UpdatePanel ID="UpdatePanelCR" runat="server">
                                <ContentTemplate>
                                    <asp:GridView CssClass="gridview" ID="gvwCourseEvents" runat="server" Visible="true"
                                        ShowHeaderEmpty="true" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" Width="90%"
                                        OnRowCancelingEdit="gvwDash_RowCancelingEdit"
                                        OnRowEditing="gvwDash_RowEditing"
                                        OnRowUpdating="gvwDash_RowUpdating" ShowFooter="True">
                                        <Columns>
                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="EventId"
                                                Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEventId" runat="server" Width="50px"
                                                        Text='<%# Bind("COURSEEVENTID")%>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:Label ID="txtEventId" runat="server" Width="50px"
                                                        Text='<%# Bind("COURSEEVENTID")%>'></asp:Label>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtEventId" Width="30px" runat="server"></asp:TextBox>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <%--below are contents--%>
                                            <asp:TemplateField HeaderText="Schedule" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Width="10px">
                                                <ItemTemplate>
                                                    <asp:Label Width="100px" ID="lblSchedule" runat="server" Text='<%# Bind("SCHEDULE") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox Width="100px" ID="txtSchedule" runat="server" Text='<%# Bind("SCHEDULE") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox Width="100px" ID="txtNewSchedule" runat="server"></asp:TextBox>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Location" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Width="10px">
                                                <ItemTemplate>
                                                    <asp:Label Width="100px" ID="lblLocation" runat="server" Text='<%# Bind("LOCATION") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox Width="100px" ID="txtLocation" runat="server" Text='<%# Bind("LOCATION") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox Width="100px" ID="txtNewLocation" runat="server"></asp:TextBox>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Price" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Width="10px">
                                                <ItemTemplate>
                                                    <asp:Label Width="100px" ID="lblPrice" runat="server" Text='<%# Bind("PRICE") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox Width="100px" ID="txtPrice" runat="server" Text='<%# Bind("PRICE") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox Width="100px" ID="txtNewPrice" runat="server"></asp:TextBox>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Start Date" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Width="10px">
                                                <ItemTemplate>
                                                    <asp:Label Width="100px" ID="lblStartDttm" runat="server" Text='<%# Bind("START_DTTM") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox Width="100px" ID="txtStartDttm" runat="server" Text='<%# Bind("START_DTTM") %>' class="Calender"></asp:TextBox><%--<img src='<%= ResolveUrl("~/Content/images/calendar.png")%>' />--%>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox Width="100px" ID="txtNewStartDttm" runat="server" class="Calender"></asp:TextBox><%--<img src='<%= ResolveUrl("~/Content/images/calendar.png")%>' />--%>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="End Date" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Width="10px">
                                                <ItemTemplate>
                                                    <asp:Label Width="100px" ID="lblEndDttm" runat="server" Text='<%# Bind("END_DTTM") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox Width="100px" ID="txtEndDttm" runat="server" Text='<%# Bind("END_DTTM") %>' class="hasDatepicker"></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox Width="100px" ID="txtNewEndDttm" runat="server"></asp:TextBox>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <%--below are control actions--%>
                                            <asp:CommandField ButtonType="Link" ShowEditButton="true" ItemStyle-Width="50px" />
                                            <asp:TemplateField ItemStyle-Width="50px">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkRemove" runat="server"
                                                        CommandArgument='<%# Bind("COURSEEVENTID")%>'
                                                        OnClientClick="return confirm ('Are you sure you want to delete this row?')"
                                                        Text="Delete" OnClick="DeleteEvent"></asp:LinkButton>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Button ID="btnAdd" runat="server" Text="Add"
                                                        ValidationGroup="Insert" CssClass="btn btn-primary btn-sm"
                                                        OnClick="AddNewEvent" />
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="gvwCourseEvents" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                        <asp:Button runat="server" ID="btnUpdateCourse" class="btn btn-primary" Text="Update Course" OnClick="btnUpdateCourse_Click" />
                        <asp:Button Style="margin-left: 20px!important;" runat="server" ID="btnBackCourses" class="btn btn-primary" Text="Back to Courses" OnClick="btnBackCourses_Click" />
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
