using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OneCalendar.BusinessComponent
{
    public class SessionUserInfoStore
    {
        public SessionUserInfoStore(String aUserApplicantId, String aUserId, String aUserIdType, String aUserEntityId, String aUserEntityIdType, String aUserFullName,String aContactNo,String aEmail)
        {
            UserApplicantId = aUserApplicantId;
            UserSingPassId = aUserId;
            UserIdType = aUserIdType;            
            UserEntityId = aUserEntityId;
            UserEntityIdType = aUserEntityIdType;
            UserFullName = aUserFullName;
            ContactNo = aContactNo;
            EmailAddress = aEmail;
        }

        public String ContactNo
        {
            get;
            internal set;
        }
        public String UserFullName
        {
            get;
            internal set;
        }

        public String EmailAddress
        {
            get;
            internal set;
        }

        public String UserSingPassId
        {
            get;
            internal set;
        }

        public String UserIdType
        {
            get;
            internal set;

        }

        public String UserApplicantId
        {
            get;
            internal set;
        }

        public String UserEntityId
        {
            get;
            internal set;
        }

        public String UserEntityIdType        
        {
            get;
            internal set;
        }
    }
}
