<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BIConnectLive.aspx.cs" Inherits="Onecalendar.WebPortal.BIReport.BIConnectLive" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://npmcdn.com/powerbi-client@2.0.0"></script>
    <script src="https://npmcdn.com/angular-powerbi@1.0.0"></script>
    <script>
        app.module('app', [
            'powerbi'
        ]);

        findById(id: string): ng.IPromise<PowerBi.IReport> {
            return this.$http.get('${this.baseUrl}/api/reports/${id}').then(response => response.data);
        };
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
    </div>
    </form>
</body>
</html>
