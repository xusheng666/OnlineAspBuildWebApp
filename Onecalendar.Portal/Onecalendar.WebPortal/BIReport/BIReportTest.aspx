<%@ Page Title="" Language="C#" MasterPageFile="~/SiteModern.Master" AutoEventWireup="true" CodeBehind="BIReportTest.aspx.cs" Inherits="Onecalendar.WebPortal.BIReport.BIReportTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">
        //Configure IFrame for the report after you have an Access Token. See Default.aspx.cs to learn how to get an Access Token
        window.onload = function () {
            if (true) {
                var iframe = document.getElementById('iFrameEmbedReport');

                // To load a Report do the following:
                // Set the IFrame source to the EmbedUrl from the Get Reports operation
                iframe.src = "http://35.185.135.144/Reports/powerbi/Test?rs:embed=true";
                //iframe.src = "http://www.google.com.sg/";

                // Add an onload handler to submit the access token
                iframe.onload = postActionLoadReport;
            }
        };

        // Post the access token to the IFrame
        function postActionLoadReport() {

            // Construct the push message structure
            // this structure also supports setting the reportId, groupId, height, and width.
            // when using a report in a group, you must provide the groupId on the iFrame SRC
            var m = {
                action: "loadReport",
                accessToken: "123",
                oDataFilter: ""
            };
            message = JSON.stringify(m);

            // push the message.
            iframe = document.getElementById('iFrameEmbedReport');
            iframe.contentWindow.postMessage(message, "*");;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div style="border: dotted; border-color: goldenrod; margin: 0 10%; padding: 20px;">
        <iframe name="myIframe" id="iFrameEmbedReport" width="100%" height="500em"></iframe>
    </div>
</asp:Content>
