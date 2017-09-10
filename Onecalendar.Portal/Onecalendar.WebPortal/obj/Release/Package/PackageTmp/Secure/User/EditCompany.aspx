<%@ Page Title="" Language="C#" MasterPageFile="~/SiteModern.Master" AutoEventWireup="true" CodeBehind="EditCompany.aspx.cs" Inherits="Onecalendar.WebPortal.Secure.User.EditCompany" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <section class="mbr-section mbr-after-navbar" id="form1-k" style="background-color: rgb(255, 255, 255); padding-top: 120px; padding-bottom: 120px;">

        <div style="border: dotted; border-color: goldenrod; margin: 0 10%;">
            <div class="mbr-section mbr-section-nopadding">
                <div class="col-xs-12 text-xs-center">
                    <h3 class="mbr-section-title display-2">Update Company</h3>
                </div>
            </div>
            <div class="mbr-section mbr-section-nopadding">
                <div class="form-group">
                    <div>
                        <span>Company Name</span>
                        <asp:TextBox ID="companyName" class="form-control" runat="server" />
                    </div>
                    <div>
                        <span>Company Detail</span>
                        <asp:TextBox ID="companyDetail" class="form-control" runat="server" />
                    </div>
                    <div>
                        <span>Company Contact Info</span>
                        <asp:TextBox ID="contactInfo" class="form-control" runat="server" />
                    </div>
                    <div>
                        <span>Company Location</span>
                        <asp:TextBox ID="location" class="form-control" runat="server" />
                    </div>
                </div>
                <div>
                    <div>
                        <span style="width: 50%; margin: 10px 0px;">Users under this company:</span>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanelCR" runat="server">
                        <ContentTemplate>
                            <asp:GridView CssClass="table table-bordered" ID="gvwUsers" runat="server" Visible="true"
                                ShowHeaderEmpty="true" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" Width="90%"
                                OnRowCancelingEdit="gvwDash_RowCancelingEdit"
                                OnRowEditing="gvwDash_RowEditing"
                                OnRowUpdating="gvwDash_RowUpdating" ShowFooter="false">
                                <Columns>
                                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="EventId"
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUserId" runat="server"
                                                Text='<%# Bind("USERID")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="txtUserId" runat="server"
                                                Text='<%# Bind("USERID")%>'></asp:Label>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtUserId" Width="40px" runat="server"></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <%--below are contents--%>
                                    <asp:TemplateField HeaderText="LoginID" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Width="35%">
                                        <ItemTemplate>
                                            <asp:Label ID="lbLoginID" runat="server" Text='<%# Bind("LOGINID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtLoginID" runat="server" Text='<%# Bind("LOGINID") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtNewLoginID" runat="server"></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User Name" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Width="35%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUserName" runat="server" Text='<%# Bind("USER_NAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtUserName" runat="server" Text='<%# Bind("USER_NAME") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtNewUserName" runat="server"></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Width="15%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("EMAIL_ADDRESS") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("EMAIL_ADDRESS") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtNewEmail" runat="server"></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User Role" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Width="15%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUserRole" runat="server" Text='<%# Bind("USER_ROLE_ARR") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtUserRole" runat="server" Text='<%# Bind("USER_ROLE_ARR") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtNewUserRole" runat="server"></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField ButtonType="Link" ShowEditButton="true" Visible="false" ItemStyle-Width="150" />
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="gvwUsers" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <asp:Button runat="server" ID="btnUpdateCompany" class="btn btn-primary" Text="Update Company" OnClick="btnUpdateCompany_Click" />
                <asp:Button Style="margin-left: 20px!important;" runat="server" ID="btnBackCompany" class="btn btn-primary" Text="Back to Company List" OnClick="btnBackCompany_Click" />
            </div>
        </div>
    </section>
</asp:Content>
