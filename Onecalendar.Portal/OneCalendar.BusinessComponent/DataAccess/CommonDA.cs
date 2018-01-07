using Onecalendar.BusinessEntity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OneCalendar.BusinessComponent.DataAccess
{
    public class CommonDA : DataAccessBase
    {
        public DataTable getCodeByCodeCategory(string codeCategory)
        {
            return QueryDataTableWithParameters(SPNameConstants.P_QUERY_CODE_BY_CATEGORY);
        }

        public DataTable getAllCompany()
        {
            return QueryDataTableWithParameters(SPNameConstants.P_QUERY_ALL_COMPANY);
        }

        public DataTable getAllParameters()
        {
            return QueryDataTableWithParameters(SPNameConstants.P_QUERY_GET_PARAMETERS);
        }

        public CMNUserDataSet getCompanyDataSetById(string companyId)
        {
            CMNUserDataSet ds = new CMNUserDataSet();
            DbCommand cmd = this.Helper.BuildDbCommand(SPNameConstants.P_QUERY_COMPANY_BY_ID);
            this.Helper.AssignParameterValues(cmd, companyId);
            this.Helper.Fill(ds.T_CMN003_COMPANY, cmd);
            return ds;
        }
    }
}
