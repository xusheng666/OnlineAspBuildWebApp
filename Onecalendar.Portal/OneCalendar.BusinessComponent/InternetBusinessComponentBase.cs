using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Diagnostics;

namespace OneCalendar.BusinessComponent
{
    public class InternetBusinessComponentBase
    {
        private DataAccessBase _da = new DataAccessBase(ConnectionStrings.ONECALENDARDATABASE);

        public void UpdateListTable(List<DataTable> datatable)
        {
            _da.UpdateListTable(datatable);
        }
        public void UpdateTable(DataTable dt)
        {
            _da.UpdateTable(dt);
        }

    }
}
