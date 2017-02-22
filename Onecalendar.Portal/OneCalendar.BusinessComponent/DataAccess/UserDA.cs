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
    public class UserDA : DataAccessBase
    {
        public CMNUserDataSet getUserByLoginID(String loginID)
        {
            CMNUserDataSet ds = new CMNUserDataSet();
            DbCommand cmd = this.Helper.BuildDbCommand(SPNameConstants.P_QUERY_USER_BY_LOGINID);
            this.Helper.AssignParameterValues(cmd, loginID);
            this.Helper.Fill(ds.T_CMN001_USER, cmd);
            return ds;
        }

        public DataTable getAllUsers()
        {
            return QueryDataTableWithParameters(SPNameConstants.P_GET_ALL_USERS);
        }

        public void DeleteUserByUserID(string userId)
        {
            UpdateSPWithParameters(SPNameConstants.P_DELETE_USER_BY_ID, userId);
        }

        public CMNUserDataSet getUserByUserID(string userId)
        {
            CMNUserDataSet ds = new CMNUserDataSet();
            DbCommand cmd = this.Helper.BuildDbCommand(SPNameConstants.P_QUERY_USER_BY_USERID);
            this.Helper.AssignParameterValues(cmd, userId);
            this.Helper.Fill(ds.T_CMN001_USER, cmd);
            return ds;
        }
    }
}
