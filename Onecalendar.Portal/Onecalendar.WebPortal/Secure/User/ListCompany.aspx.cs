using OneCalendar.BusinessComponent;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Onecalendar.WebPortal.Secure.User
{
    public partial class ListCompany : System.Web.UI.Page
    {
        CommonService _bc = new CommonService();

        protected void Page_Load(object sender, EventArgs e)
        {
            CompanyDataBind();
        }

        private void CompanyDataBind()
        {
            DataTable dt = _bc.getAllCompany() as DataTable;
            this.gvwDash.DataSource = dt;
            this.gvwDash.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Secure/User/CreateCompany.aspx");
        }

        protected void lnkDelete(Object sender, CommandEventArgs e)
        {
            String companyId = e.CommandArgument.ToString();
            if (!String.IsNullOrEmpty(companyId))
            {
                _bc.DeleteCompanyByID(companyId);
            }
            CompanyDataBind();
        }
    }
}