<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditCompany.aspx.cs" Inherits="Onecalendar.WebPortal.Secure.User.EditCompany" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page mar-top30">
        <div class="title">
            <h1>Create Company</h1>
            <br />
            <h2></h2>
        </div>
        <div class="content">
            <div class="course-form">
                <label>
                    <span>Company Name</span>
                    <asp:TextBox ID="companyName" class="input_text" runat="server" />
                </label>
                <label>
                    <span>Company Detail</span>
                    <asp:TextBox ID="companyDetail" class="input_text" runat="server" />
                </label>
                <label>
                    <span>Company Contact Info</span>
                    <asp:TextBox ID="contactInfo" class="input_text" runat="server" />
                </label>
                <label>
                    <span>Company Location</span>
                    <asp:TextBox ID="location" class="input_text" runat="server" />
                </label>
                <label>
                    <span style="width: 50%; margin: 10px 0px;">Users under this company:</span>
                </label>
                <label>
                    <asp:UpdatePanel ID="UpdatePanelCR" runat="server">
                        <ContentTemplate>
                            <asp:GridView CssClass="gridview" ID="gvwUsers" runat="server" Visible="true"
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
                </label>
                <asp:Button runat="server" ID="btnUpdateCompany" class="button" Text="Update Company" OnClick="btnUpdateCompany_Click" />
                <asp:Button Style="margin-left: 20px!important;" runat="server" ID="btnBackCompany" class="button" Text="Back to Company List" OnClick="btnBackCompany_Click" />
        </div>
    </div>
</asp:Content>
