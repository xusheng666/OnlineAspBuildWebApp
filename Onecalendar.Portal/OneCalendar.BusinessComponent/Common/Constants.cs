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

        public class UserRoles
        {
            public const string VIEW_ONLY_ROLE = "VO";
        }

        public class UserStatus
        {
            public const string ACTIVE = "A";
            public const string INACTIVE = "I";
        }
    }

    public class ConnectionStrings
    {
        public const string ONECALENDARDATABASE = "OnecalendarDatabase";
    }

    public class SPNameConstants
    {
        // below are course and events
        public const string P_QUERY_COURSES_FOR_VIEW = "P_QUERY_COURSES_FOR_VIEW";
        public const string P_QUERY_COURSE_BY_ID_FOR_VIEW = "P_QUERY_COURSE_BY_ID_FOR_VIEW";
        public const string P_DELETE_COURSE_BY_ID = "P_DELETE_COURSE_BY_ID";
        public const string P_QUERY_COURSE_EVENTS_BY_ID_FOR_VIEW = "P_QUERY_COURSE_EVENTS_BY_ID_FOR_VIEW";
        public const string P_QUERY_EVENT_BY_EVENT_ID = "P_QUERY_EVENT_BY_EVENT_ID";
        public const string P_DELETE_COURSE_EVENT_BY_ID = "P_DELETE_COURSE_EVENT_BY_ID";
        // manage users
        public const string P_QUERY_USER_BY_LOGINID = "P_QUERY_USER_BY_LOGINID";
        public const string P_QUERY_USER_BY_USERID = "P_QUERY_USER_BY_USERID";
        public const string P_GET_ALL_USERS = "P_GET_ALL_USERS";
        public const string P_DELETE_USER_BY_ID = "P_DELETE_USER_BY_ID";
        // common
        public const string P_QUERY_CODE_BY_CATEGORY = "P_QUERY_CODE_BY_CATEGORY";
        public const string P_QUERY_ALL_COURSES_EVENTS = "P_QUERY_ALL_COURSES_EVENTS";
        // below for company
        public const string P_QUERY_ALL_COMPANY = "P_QUERY_ALL_COMPANY";
        public const string P_DELETE_COMPANY_BY_ID = "P_DELETE_COMPANY_BY_ID";
        public const string P_QUERY_COMPANY_BY_ID = "P_QUERY_COMPANY_BY_ID";
        public const string P_QUERY_COURSE_BY_DATETIME = "P_QUERY_COURSE_BY_DATETIME";
        public const string P_QUERY_COURSE_BY_FREE_TEXT = "P_QUERY_COURSE_BY_FREE_TEXT";
    }

    public class QueryStringNames
    {
        public const string QUERY_STR_COURSE_ID = "CourseID";
        public const string QUERY_STR_COMPANY_ID = "CompanyId";
    }

}
