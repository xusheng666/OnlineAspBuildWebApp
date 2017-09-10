<%@ Page Title="" Language="C#" MasterPageFile="~/SiteModern.Master" AutoEventWireup="true" CodeBehind="ManageUser.aspx.cs" Inherits="Onecalendar.WebPortal.Secure.User.ManageUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <section class="mbr-section mbr-after-navbar" id="form1-k" style="background-color: rgb(255, 255, 255); padding-top: 120px; padding-bottom: 120px;">

        <div style="border: dotted; border-color: goldenrod; margin: 0 10%;">
            <div class="mbr-section mbr-section-nopadding">
                <div class="col-xs-12 text-xs-center">
                    <h3 class="mbr-section-title display-2">Manage User</h3>
                </div>
                <div style="padding-left:5%;">
                    <asp:UpdatePanel ID="UpdatePanelCR" runat="server">
                        <ContentTemplate>
                            <asp:GridView CssClass="table table-bordered" ID="gvwUsers" runat="server" Visible="true"
                                ShowHeaderEmpty="true" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" Width="90%"
                                OnRowCancelingEdit="gvwDash_RowCancelingEdit"
                                OnRowEditing="gvwDash_RowEditing"
                                OnRowUpdating="gvwDash_RowUpdating" ShowFooter="True">
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
                                            <asp:TextBox ID="txtUserId" Width="40px" runat="server" Required="true"></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <%--below are contents--%>
                                    <asp:TemplateField HeaderText="LoginID" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:Label ID="lbLoginID" runat="server" Text='<%# Bind("LOGINID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtLoginID" runat="server" CssClass="gridviewText" Text='<%# Bind("LOGINID") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtNewLoginID" CssClass="gridviewText" runat="server" Required="true"></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User Name" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUserName" runat="server" Text='<%# Bind("USER_NAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtUserName" runat="server" CssClass="gridviewText" Text='<%# Bind("USER_NAME") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtNewUserName" CssClass="gridviewText" runat="server" Required="true"></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("EMAIL_ADDRESS") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEmail" CssClass="gridviewText" runat="server" Text='<%# Bind("EMAIL_ADDRESS") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtNewEmail" CssClass="gridviewText" runat="server" Required="true"></asp:TextBox>
                                            <asp:RegularExpressionValidator ControlToValidate="txtNewEmail" runat="server" />
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User Role" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUserRole" runat="server" Text='<%# Bind("USER_ROLE_ARR") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtUserRole" CssClass="gridviewText" runat="server" Text='<%# Bind("USER_ROLE_ARR") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtNewUserRole" CssClass="gridviewText" runat="server" Required="true"></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField ButtonType="Link" ShowEditButton="true" ItemStyle-Width="150" />
                                    <asp:TemplateField ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkRemove" runat="server"
                                                CommandArgument='<%# Bind("USERID")%>'
                                                OnClientClick="return confirm ('Are you sure you want to delete this row?')"
                                                Text="Delete" OnClick="DeleteUser"></asp:LinkButton>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Button ID="btnAdd" runat="server" Text="Add"
                                                ValidationGroup="Insert" CssClass="btn btn-primary btn-sm"
                                                OnClick="AddNewUser" />
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="gvwUsers" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
