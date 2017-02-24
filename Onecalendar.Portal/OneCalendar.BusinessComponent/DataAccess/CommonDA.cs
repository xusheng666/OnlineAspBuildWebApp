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
    }
}
