using Onecalendar.BusinessEntity;
using OneCalendar.BusinessComponent;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Onecalendar.WebPortal.Secure.User
{
    public partial class CreateCompany : InternetPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddCompany_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(this.companyName.Text))
            {
                CMNUserDataSet userDS = new CMNUserDataSet();
                CMNUserDataSet.T_CMN003_COMPANYRow companyRow = userDS.T_CMN003_COMPANY.NewT_CMN003_COMPANYRow();
                companyRow.COMPANY_ID = Utility.NewDataKey();
                companyRow.COMPANY_NAME = this.companyName.Text;
                companyRow.COMPANY_DETAIL = this.companyDetail.Text;
                companyRow.COMPANY_CONTACT = this.contactInfo.Text;
                companyRow.COMPANY_LOCATION = this.location.Text;

                Utility.UpdateCommonFields(companyRow);
                userDS.T_CMN003_COMPANY.AddT_CMN003_COMPANYRow(companyRow);

                _bc.UpdateTable(userDS.T_CMN003_COMPANY);

                Response.Redirect("~/Secure/Course/Courses.aspx");
            }
        }
    }
}