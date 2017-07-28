<%@ Page Title="" Language="C#" MasterPageFile="~/SiteModern.Master" AutoEventWireup="true" CodeBehind="ListCompany.aspx.cs" Inherits="Onecalendar.WebPortal.Secure.User.ListCompany" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <section class="mbr-section mbr-after-navbar" id="form1-k" style="background-color: rgb(255, 255, 255); padding-top: 120px; padding-bottom: 120px;">

        <div style="border: dotted; border-color: goldenrod; margin: 0 10%;">
            <div class="mbr-section mbr-section-nopadding">
                <div class="col-xs-12 text-xs-center">
                    <h3 class="mbr-section-title display-2">Company List</h3>
                </div>
                <div class="panel">
                    <div class="padding-bottom">
                        <asp:Button ID="btnAdd" class="btn btn-primary" Text="Add New Company" runat="server" OnClick="btnAdd_Click" />
                    </div>
                    <asp:GridView CssClass="table table-bordered" ID="gvwDash" runat="server" Visible="true" ShowHeaderEmpty="true" AutoGenerateColumns="false"
                        Width="100%">
                        <Columns>
                            <asp:BoundField HeaderText="Name" DataField="COMPANY_NAME" HeaderStyle-Width="20%" />
                            <asp:BoundField HeaderText="Description" DataField="COMPANY_DETAIL" HeaderStyle-Width="35%" />
                            <asp:BoundField HeaderText="Contact Info" DataField="COMPANY_CONTACT" HeaderStyle-Width="35%" />
                            <asp:BoundField HeaderText="Location" DataField="COMPANY_LOCATION" HeaderStyle-Width="35%" />
                            <asp:TemplateField HeaderText="Action" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:HyperLink ID="Edit" runat="server"
                                        NavigateUrl='<%# "~/Secure/User/EditCompany.aspx?CompanyId=" + Eval("COMPANY_ID")  %>'>Edit</asp:HyperLink>
                                    <asp:LinkButton ID="btnDelete" runat="server" CommandArgument='<%#Eval("COMPANY_ID")%>' OnCommand="lnkDelete" Text="Delete"
                                        OnClientClick="return confirm ('Are you sure you want to delete this course?')">
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="padding-bottom" />
            </div>
        </div>
    </section>
</asp:Content>
