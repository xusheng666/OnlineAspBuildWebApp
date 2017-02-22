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
    public class UserManageBC : InternetBusinessComponentBase
    {
        UserDA _da = new UserDA();

        public void SaveUser(CMNUserDataSet dataset)
        {
            UpdateTable(dataset.T_CMN001_USER);
        }

        public CMNUserDataSet getUserByLoginID(String loginID)
        {
            return _da.getUserByLoginID(loginID);
        }

        public DataTable getAllUsers()
        {
            return _da.getAllUsers();
        }

        public void DeleteUserByID(string userId)
        {
            _da.DeleteUserByUserID(userId);
        }

        public CMNUserDataSet getUserDataSetByUserId(string userId)
        {
            return _da.getUserByUserID(userId);
        }
    }
}
