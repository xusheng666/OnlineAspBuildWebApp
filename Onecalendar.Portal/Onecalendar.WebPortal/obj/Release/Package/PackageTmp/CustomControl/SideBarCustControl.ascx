<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SideBarCustControl.ascx.cs" 
    Inherits="Onecalendar.WebPortal.SideBarCustControl" %>

<!---primary-col--->
<div class="side-bar">
    <%--<div class="search">
        <div class="title">
            <h1>Site search here</h1>
        </div>
        <ul>
            <li>
                <input name="" type="text" class="text-filed" />
            </li>
            <li><a href="#">
                <img src="Content/images/search-bt.jpg" alt="search" /></a></li>
        </ul>
    </div>--%>
    <div class="clearing"></div>
    <div class="submenu">
        <div class="panel">
            <div class="title">
                <%--<h1>Submenu here</h1>--%>
            </div>
            <div class="content">
                <img src="<%= ResolveUrl("~/Content/images/icon1.png")%>" alt="icon" class="float-left mar-right20" />
                <h2>Browser By</h2>
                <div class="clearing"></div>
                <ul>
                    <li><a href="#">Course Directory</a></li>
                    <li><a href="#"># Math</a></li>
                    <li><a href="#"># English</a></li>
                    <li class="-noborder-bottom"><a href="#"># Science</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="clearing"></div>
    
    
</div>
<!---side-bar--->
<div class="clearing"></div>
