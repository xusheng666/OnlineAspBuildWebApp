using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Onecalendar.WebPortal.BIReport
{
    public partial class BIReportTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MyReportViewer.ProcessingMode = Microsoft.Reporting.WebForms.ProcessingMode.Remote;
            MyReportViewer.ServerReport.ReportServerUrl = new Uri("http://db-server/Reports"); // Report Server URL
            MyReportViewer.ServerReport.ReportPath = "Report1"; // Report Name
            MyReportViewer.ShowParameterPrompts = false;
            MyReportViewer.ShowPrintButton = true;

            // Below code demonstrate the Parameter passing method. User only if you have parameters into the reports.
            Microsoft.Reporting.WebForms.ReportParameter[] reportParameterCollection = new Microsoft.Reporting.WebForms.ReportParameter[1];
            reportParameterCollection[0] = new Microsoft.Reporting.WebForms.ReportParameter();
            //reportParameterCollection[0].Name = Perks.Constants.Pages.ClientAdmin.ShowInvoice.QueryStrings.INVOICEID;
            //reportParameterCollection[0].Values.Add(Request.QueryString[Perks.Constants.Pages.ClientAdmin.ShowInvoice.QueryStrings.INVOICEID].ToString());
            MyReportViewer.ServerReport.SetParameters(reportParameterCollection);

            MyReportViewer.ServerReport.Refresh();
        }
    }
}