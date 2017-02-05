using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OneCalendar.BusinessComponent
{
    public class Constants
    {
        public const string COMMON_RET_NAME = "o_result";

        public class DES
        {
            public static byte[] IVS = { 0xEF, 0xAB, 0x56, 0x78, 0x90, 0x34, 0xCD, 0x12 };
        }

        public class AES
        {
            public static byte[] IVS = { 0x12, 0x34, 0x56, 0x78, 0x90, 0xAB, 0xCD, 0xEF, 0x12, 0x34, 0x56, 0x78, 0x90, 0xAB, 0xCD, 0xEF };
        }
    }

    public class ConnectionStrings
    {
        public const string ONECALENDARDATABASE = "OnecalendarDatabase";
    }

    public class SPNameConstants
    {
        public const string P_QUERY_COURSES_FOR_VIEW = "P_QUERY_COURSES_FOR_VIEW";
        public const string P_QUERY_COURSE_BY_ID_FOR_VIEW = "P_QUERY_COURSE_BY_ID_FOR_VIEW";
        public const string P_DELETE_COURSE_BY_ID = "P_DELETE_COURSE_BY_ID";
        public const string P_QUERY_COURSE_EVENTS_BY_ID_FOR_VIEW = "P_QUERY_COURSE_EVENTS_BY_ID_FOR_VIEW";
        public const string P_QUERY_EVENT_BY_EVENT_ID = "P_QUERY_EVENT_BY_EVENT_ID";
        public const string P_DELETE_COURSE_EVENT_BY_ID = "P_DELETE_COURSE_EVENT_BY_ID";
        
    }

    public class QueryStringNames
    {
        public const string QUERY_STR_COURSE_ID = "CourseID";
    }
}
