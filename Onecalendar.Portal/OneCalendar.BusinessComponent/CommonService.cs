using Onecalendar.BusinessEntity;
using OneCalendar.BusinessComponent.DataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OneCalendar.BusinessComponent
{
    public class CommonService : InternetBusinessComponentBase
    {
        CommonDA _da = new CommonDA();
        public DataTable getCodeByCodeCategory(string category)
        {
            return _da.getCodeByCodeCategory(category);
        }

        public DataTable getAllCompany()
        {
            return _da.getAllCompany();
        }

        public void DeleteCompanyByID(string companyId)
        {
            _da.UpdateSPWithParameters(SPNameConstants.P_DELETE_COMPANY_BY_ID, companyId);
        }

        public CMNUserDataSet getCompanyDataSetById(string companyId)
        {
            return _da.getCompanyDataSetById(companyId);
        }
    }
}
