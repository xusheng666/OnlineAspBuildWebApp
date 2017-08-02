using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OneCalendar.BusinessComponent.Common
{
    public class DateTimeUtil
    {
        public static DateTime parseToDateTime(string DateTimeValue)
        {
            DateTime dt = DateTime.ParseExact(DateTimeValue, Constants.DateTimeFormat.searchDateTimeFormat, CultureInfo.InvariantCulture);
            return dt;
        }
    }
}
