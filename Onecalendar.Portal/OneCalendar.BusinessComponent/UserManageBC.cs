using Onecalendar.BusinessEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OneCalendar.BusinessComponent
{
    public class UserManageBC : InternetBusinessComponentBase
    {
        public void SaveUser(CMNUserDataSet dataset)
        {
            UpdateTable(dataset.T_CMN001_USER);
        }
    }
}
