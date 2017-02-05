<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditCourse.aspx.cs" Inherits="Onecalendar.WebPortal.Secure.Course.EditCourse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page mar-top30">
        <div class="title">
            <h1>Update Course</h1>
            <br />
            <h2></h2>
        </div>
        <div class="content">
            <div class="course-form">
                <label>
                    <span>Course Name</span>
                    <asp:TextBox ID="courseName" class="input_text" runat="server" />
                </label>
                <label>
                    <span>Course Image</span>
                    <asp:Image ID="image" runat="server" ImageUrl="dummay" alt="image" class="input_text float-left mar-right30 imgdisplay" 
                        style="margin:10px 0px!important;"/>
                </label>
                <label>
                    <span>Upload New Course Image</span>
                    <asp:FileUpload ID="fileUpload" runat="server" class="input_text"/>
                </label>
                <label>
                    <span>Description</span>
                    <asp:TextBox TextMode="MultiLine" ID="description" class="message" runat="server"/>
                </label>
                <asp:Button runat="server" ID="btnUpdateCourse" class="button" Text="Update Course" OnClick="btnUpdateCourse_Click"   />
            </div>
            <div>
                <asp:GridView CssClass="gridview" ID="gvwDash" runat="server" Visible="true" 
                    ShowHeaderEmpty="true" AutoGenerateColumns="false" Width="90%"
                     OnRowCancelingEdit="gvwDash_RowCancelingEdit"   
                     OnRowDataBound="gvwDash_RowDataBound"   
                     OnRowEditing="gvwDash_RowEditing" 
                     OnRowUpdating="gvwDash_RowUpdating" ShowFooter="True" 
                     OnRowCommand="gvwDash_RowCommand" 
                     OnRowDeleting="gvwDash_RowDeleting">
                    <Columns>
                        <asp:TemplateField HeaderText="Name" HeaderStyle-HorizontalAlign="Left">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("SCHEDULE") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtNewName" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server" Text='<%# Bind("SCHEDULE") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
    
</asp:Content>
