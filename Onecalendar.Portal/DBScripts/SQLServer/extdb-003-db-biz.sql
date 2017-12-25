IF OBJECT_ID( 'dbo.P_QUERY_COURSE_BY_ID_FOR_VIEW', 'P' ) IS NOT NULL
  DROP  PROCEDURE  dbo.P_QUERY_COURSE_BY_ID_FOR_VIEW
GO

--select * from [AVAIABLE_COURSE]
-- drop procedure P_QUERY_COURSE_BY_ID_FOR_VIEW
CREATE PROCEDURE P_QUERY_COURSE_BY_ID_FOR_VIEW
(
  @p_courseid nvarchar(36)
)
AS

SET XACT_ABORT ON

BEGIN
    SELECT 
      t.COURSEID,
      t.USERID,
      t.COURSE_NAME,
      t.COURSE_DETAIL,
      t.COURSE_IMAGEPATH,
      t.COURSE_FILENAME,
	  t.COURSE_TAG,
	  c.COMPANY_DETAIL,
	  c.COMPANY_CONTACT,
	  t.STATUS,
	  t.COURSE_REG_URL,
      t.CREATED_BY,
      t.CREATED_TIME,
      t.LAST_UPDATED_BY,
      t.LAST_UPDATED_TIME,
      t.VERSION_NO,
      t.TRANSACTION_ID
    FROM [AVAIABLE_COURSE] t
	LEFT JOIN T_CMN001_USER u ON t.USERID = u.LOGINID
	LEFT JOIN T_CMN003_COMPANY c ON c.COMPANY_ID = u.COMPANY_ID
    WHERE COURSEID  = @p_courseid
	
END
SET XACT_ABORT OFF
GO

IF OBJECT_ID( 'dbo.P_QUERY_COURSE_EVENTS_BY_ID_FOR_VIEW', 'P' ) IS NOT NULL
  DROP  PROCEDURE  dbo.P_QUERY_COURSE_EVENTS_BY_ID_FOR_VIEW
GO

CREATE PROCEDURE P_QUERY_COURSE_EVENTS_BY_ID_FOR_VIEW
(
  @p_courseid nvarchar(36)
)
AS

SET XACT_ABORT ON

BEGIN
    SELECT 
      t.COURSEEVENTID,
      t.COURSEID,
      t.SCHEDULE,
      t.LOCATION,
      t.PRICE,
	  t.START_DTTM,
	  t.END_DTTM,
      t.CREATED_BY,
      t.CREATED_TIME,
      t.LAST_UPDATED_BY,
      t.LAST_UPDATED_TIME,
      t.VERSION_NO,
      t.TRANSACTION_ID
    FROM [AVAIABLE_COURSE_EVENT] t
    WHERE COURSEID  = @p_courseid
    
END
SET XACT_ABORT OFF
GO

IF OBJECT_ID( 'dbo.P_QUERY_EVENT_BY_EVENT_ID', 'P' ) IS NOT NULL
  DROP  PROCEDURE  dbo.P_QUERY_EVENT_BY_EVENT_ID
GO

CREATE PROCEDURE P_QUERY_EVENT_BY_EVENT_ID
(
  @p_eventid nvarchar(36)
)
AS

SET XACT_ABORT ON

BEGIN
    SELECT 
      t.COURSEEVENTID,
      t.COURSEID,
      t.SCHEDULE,
      t.LOCATION,
      t.PRICE,
      t.CREATED_BY,
      t.CREATED_TIME,
      t.LAST_UPDATED_BY,
      t.LAST_UPDATED_TIME,
      t.VERSION_NO,
      t.TRANSACTION_ID
    FROM [AVAIABLE_COURSE_EVENT] t
    WHERE COURSEEVENTID  = @p_eventid
    
END
SET XACT_ABORT OFF
GO

IF OBJECT_ID( 'dbo.P_QUERY_COURSES_FOR_VIEW', 'P' ) IS NOT NULL
  DROP  PROCEDURE  dbo.P_QUERY_COURSES_FOR_VIEW
GO

CREATE PROCEDURE [dbo].[P_QUERY_COURSES_FOR_VIEW]
AS
/*
Module  : 
Author  : SQL Generator
Date    : 30-01-2017
Desc    : Retrieves records from T_BIZ001_COURSE
Returns: 0 if successful, else SQL error code

Change Revision
-----------------------------------------------------
Date           Author            Remark

*/

--It will stop stored procedure when there is error, but if the stored procedure will be called by others, the caller stored procedure should check the return value.
--For example, 
/*
	--Application ID Validation and Retrieval
	EXEC @v_error = P_IC_APP_GET_ID @p_app_name, @v_app_id OUTPUT
	IF @v_error <> 0 RETURN  @v_error

*/
SET XACT_ABORT ON

BEGIN
    SELECT 
      t.COURSEID,
      t.USERID,
      t.COURSE_NAME,
      t.COURSE_DETAIL,
	  t.COURSE_IMAGEPATH,
      t.COURSE_FILENAME,
	  t.STATUS,
	  t.COURSE_REG_URL,
      t.CREATED_BY,
      t.CREATED_TIME,
      t.LAST_UPDATED_BY,
      t.LAST_UPDATED_TIME,
      t.VERSION_NO,
      t.TRANSACTION_ID,
	  t.SOURCE
    FROM [AVAIABLE_COURSE] t
	LEFT JOIN T_CMN001_USER u ON (t.USERID = u.LOGINID OR t.USERID IS NULL)
	WHERE t.STATUS = 'A' 
	AND t.USERID is not null-- only approved will be search out.
   
    --Recommend when the stored procedure will be called by other stored procedure
    RETURN @@ERROR

END
SET XACT_ABORT OFF

GO

IF OBJECT_ID( 'dbo.P_QUERY_M_NEW_COURSES', 'P' ) IS NOT NULL
  DROP  PROCEDURE  dbo.P_QUERY_M_NEW_COURSES
GO

CREATE PROCEDURE [dbo].[P_QUERY_M_NEW_COURSES]
AS
/*
Module  : 
Author  : SQL Generator
Date    : 30-01-2017
Desc    : Retrieves records from T_BIZ001_COURSE
Returns: 0 if successful, else SQL error code

Change Revision
-----------------------------------------------------
Date           Author            Remark

*/

--It will stop stored procedure when there is error, but if the stored procedure will be called by others, the caller stored procedure should check the return value.
--For example, 
/*
	--Application ID Validation and Retrieval
	EXEC @v_error = P_IC_APP_GET_ID @p_app_name, @v_app_id OUTPUT
	IF @v_error <> 0 RETURN  @v_error

*/
SET XACT_ABORT ON

BEGIN
    SELECT 
      t.COURSEID,
      t.USERID,
      t.COURSE_NAME,
      t.COURSE_DETAIL,
	  t.COURSE_IMAGEPATH,
      t.COURSE_FILENAME,
	  t.STATUS,
	  t.COURSE_REG_URL,
      t.CREATED_BY,
      t.CREATED_TIME,
      t.LAST_UPDATED_BY,
      t.LAST_UPDATED_TIME,
      t.VERSION_NO,
      t.TRANSACTION_ID,
	  t.SOURCE
    FROM [AVAIABLE_COURSE] t
	LEFT JOIN T_CMN001_USER u ON (t.USERID = u.LOGINID OR t.USERID IS NULL)
	WHERE t.STATUS = 'A' 
	AND t.USERID is not null-- only approved will be search out.
    AND DATEDIFF(day, t.LAST_UPDATED_TIME , CURRENT_TIMESTAMP) <= 30
    --Recommend when the stored procedure will be called by other stored procedure
    RETURN @@ERROR

END
SET XACT_ABORT OFF

GO

IF OBJECT_ID( 'dbo.P_QUERY_COURSES_FOR_PUBLISH', 'P' ) IS NOT NULL
  DROP  PROCEDURE  dbo.P_QUERY_COURSES_FOR_PUBLISH
GO

CREATE PROCEDURE [dbo].[P_QUERY_COURSES_FOR_PUBLISH]
AS
/*
Module  : 
Author  : SQL Generator
Date    : 30-01-2017
Desc    : Retrieves records from T_BIZ001_COURSE
Returns: 0 if successful, else SQL error code

Change Revision
-----------------------------------------------------
Date           Author            Remark

*/

--It will stop stored procedure when there is error, but if the stored procedure will be called by others, the caller stored procedure should check the return value.
--For example, 
/*
	--Application ID Validation and Retrieval
	EXEC @v_error = P_IC_APP_GET_ID @p_app_name, @v_app_id OUTPUT
	IF @v_error <> 0 RETURN  @v_error

*/
SET XACT_ABORT ON

BEGIN
    SELECT 
      t.COURSEID,
      t.USERID,
      t.COURSE_NAME,
      t.COURSE_DETAIL,
	  t.COURSE_IMAGEPATH,
      t.COURSE_FILENAME,
	  t.STATUS,
	  t.COURSE_REG_URL,
      t.CREATED_BY,
      t.CREATED_TIME,
      t.LAST_UPDATED_BY,
      t.LAST_UPDATED_TIME,
      t.VERSION_NO,
      t.TRANSACTION_ID
    FROM [T_BIZ001_COURSE] t
   
    --Recommend when the stored procedure will be called by other stored procedure
    RETURN @@ERROR

END
SET XACT_ABORT OFF

GO

IF OBJECT_ID( 'dbo.P_DELETE_COURSE_BY_ID', 'P' ) IS NOT NULL
    DROP  PROCEDURE  dbo.P_DELETE_COURSE_BY_ID
GO

CREATE PROCEDURE P_DELETE_COURSE_BY_ID
(
	@o_courseid nvarchar(36)
)
AS

-- do your settings here...
SET NOCOUNT ON

SET XACT_ABORT ON

-- declare and initialize local variables here...

-- do your business transaction
BEGIN
    DELETE FROM T_BIZ002_COURSE_EVENT
    WHERE COURSEID  = @o_courseid;
	
    DELETE FROM T_BIZ001_COURSE
    WHERE COURSEID  = @o_courseid;

    IF @@ROWCOUNT = 0
    BEGIN
        RAISERROR('ConcurrentUpdated', 16, 1)
      
        --Recommend when the stored procedure will be called by other stored procedure
        RETURN @@ERROR
    END
    
END
SET NOCOUNT OFF
SET XACT_ABORT OFF

GO

IF OBJECT_ID( 'dbo.P_DELETE_COURSE_EVENT_BY_ID', 'P' ) IS NOT NULL
    DROP  PROCEDURE  dbo.P_DELETE_COURSE_EVENT_BY_ID
GO

CREATE PROCEDURE P_DELETE_COURSE_EVENT_BY_ID
(
	@o_eventid nvarchar(36)
)
AS

-- do your settings here...
SET NOCOUNT ON

SET XACT_ABORT ON

-- declare and initialize local variables here...

-- do your business transaction
BEGIN
    
    DELETE FROM T_BIZ002_COURSE_EVENT
    WHERE COURSEEVENTID  = @o_eventid;

    IF @@ROWCOUNT = 0
    BEGIN
        RAISERROR('ConcurrentUpdated', 16, 1)
      
        --Recommend when the stored procedure will be called by other stored procedure
        RETURN @@ERROR
    END
    
END
SET NOCOUNT OFF
SET XACT_ABORT OFF

GO

IF OBJECT_ID( 'dbo.P_QUERY_USER_BY_LOGINID', 'P' ) IS NOT NULL
  DROP  PROCEDURE  dbo.P_QUERY_USER_BY_LOGINID
GO

CREATE PROCEDURE P_QUERY_USER_BY_LOGINID
(
  @p_loginid nvarchar(50)
)
AS

SET XACT_ABORT ON

BEGIN
    SELECT 
      t.USERID,
      t.LOGINID,
      t.USER_NAME,
      t.EMAIL_ADDRESS,
      t.PASSWORD_HASH,
      t.PASSWORD_HASH_SALT,
      t.PASSWORD_HIST_HASH,
      t.LAST_ACTIVITY_DATE,
      t.IS_DELETED,
      t.COMPANY_ID,
      t.USER_ROLE_ARR,
      t.STATUS,
      t.CREATED_BY,
      t.CREATED_TIME,
      t.LAST_UPDATED_BY,
      t.LAST_UPDATED_TIME,
      t.VERSION_NO,
      t.TRANSACTION_ID
    FROM T_CMN001_USER t
    WHERE LOGINID  = @p_loginid
	
	RETURN @@ERROR
    
END
SET XACT_ABORT OFF
GO


IF OBJECT_ID( 'dbo.P_QUERY_USER_BY_USERID', 'P' ) IS NOT NULL
  DROP  PROCEDURE  dbo.P_QUERY_USER_BY_USERID
GO

CREATE PROCEDURE P_QUERY_USER_BY_USERID
(
  @p_userid nvarchar(50)
)
AS

SET XACT_ABORT ON

BEGIN
    SELECT 
      t.USERID,
      t.LOGINID,
      t.USER_NAME,
      t.EMAIL_ADDRESS,
      t.PASSWORD_HASH,
      t.PASSWORD_HASH_SALT,
      t.PASSWORD_HIST_HASH,
      t.LAST_ACTIVITY_DATE,
      t.IS_DELETED,
      t.COMPANY_ID,
      t.USER_ROLE_ARR,
      t.STATUS,
      t.CREATED_BY,
      t.CREATED_TIME,
      t.LAST_UPDATED_BY,
      t.LAST_UPDATED_TIME,
      t.VERSION_NO,
      t.TRANSACTION_ID
    FROM T_CMN001_USER t
    WHERE USERID  = @p_userid
	
	RETURN @@ERROR
    
END
SET XACT_ABORT OFF
GO

IF OBJECT_ID( 'dbo.P_GET_ALL_USERS', 'P' ) IS NOT NULL
  DROP  PROCEDURE  dbo.P_GET_ALL_USERS
GO

CREATE PROCEDURE P_GET_ALL_USERS
AS

SET XACT_ABORT ON

BEGIN
    SELECT 
      t.USERID,
      t.LOGINID,
      t.USER_NAME,
      t.EMAIL_ADDRESS,
      t.PASSWORD_HASH,
      t.PASSWORD_HASH_SALT,
      t.PASSWORD_HIST_HASH,
      t.LAST_ACTIVITY_DATE,
      t.IS_DELETED,
      t.COMPANY_ID,
      t.USER_ROLE_ARR,
      t.STATUS,
      t.CREATED_BY,
      t.CREATED_TIME,
      t.LAST_UPDATED_BY,
      t.LAST_UPDATED_TIME,
      t.VERSION_NO,
      t.TRANSACTION_ID
    FROM T_CMN001_USER t
	
	RETURN @@ERROR
    
END
SET XACT_ABORT OFF
GO


IF OBJECT_ID( 'dbo.P_DELETE_USER_BY_ID', 'P' ) IS NOT NULL
    DROP  PROCEDURE  dbo.P_DELETE_USER_BY_ID
GO

CREATE PROCEDURE P_DELETE_USER_BY_ID
(
	@o_userid nvarchar(36)
)
AS

-- do your settings here...
SET NOCOUNT ON

SET XACT_ABORT ON

-- declare and initialize local variables here...

-- do your business transaction
BEGIN
    
    DELETE FROM T_CMN001_USER
    WHERE USERID  = @o_userid;

    IF @@ROWCOUNT = 0
    BEGIN
        RAISERROR('ConcurrentUpdated', 16, 1)
      
        --Recommend when the stored procedure will be called by other stored procedure
        RETURN @@ERROR
    END
    
END
SET NOCOUNT OFF
SET XACT_ABORT OFF

GO

IF OBJECT_ID( 'dbo.P_QUERY_ALL_COURSES_EVENTS', 'P' ) IS NOT NULL
  DROP  PROCEDURE  dbo.P_QUERY_ALL_COURSES_EVENTS
GO

CREATE PROCEDURE P_QUERY_ALL_COURSES_EVENTS
AS
	
/*
Module  : 
Author  : SQL Generator
Date    : 23-02-2017
Desc    : Update records to T_BIZ002_COURSE_EVENT
Returns: 0 if successful, else SQL error code

Change Revision
-----------------------------------------------------
Date           Author            Remark

*/

-- do your settings here...
SET NOCOUNT ON

SET XACT_ABORT ON

-- declare and initialize local variables here...

-- do your business transaction
BEGIN
    SELECT 
      t.COURSEEVENTID,
      t.COURSEID,
      t.SCHEDULE,
      t.LOCATION,
      t.PRICE,
      t.START_DTTM,
      t.END_DTTM,
      t.CREATED_BY,
      t.CREATED_TIME,
      t.LAST_UPDATED_BY,
      t.LAST_UPDATED_TIME,
      t.VERSION_NO,
      t.TRANSACTION_ID
    FROM [AVAIABLE_COURSE_EVENT] t
	
	RETURN @@ERROR

END

SET NOCOUNT OFF
SET XACT_ABORT OFF
GO

IF OBJECT_ID( 'dbo.P_DELETE_COMPANY_BY_ID', 'P' ) IS NOT NULL
    DROP  PROCEDURE  dbo.P_DELETE_COMPANY_BY_ID
GO

CREATE PROCEDURE P_DELETE_COMPANY_BY_ID
(
	@o_companyid nvarchar(36)
)
AS

-- do your settings here...
SET NOCOUNT ON

SET XACT_ABORT ON

-- declare and initialize local variables here...

-- do your business transaction
BEGIN
    DELETE FROM T_CMN003_COMPANY
    WHERE COMPANY_ID  = @o_companyid;
	
	UPDATE T_CMN001_USER SET COMPANY_ID = NULL
    WHERE COMPANY_ID  = @o_companyid;
	
    IF @@ROWCOUNT = 0
    BEGIN
        RAISERROR('ConcurrentUpdated', 16, 1)
      
        --Recommend when the stored procedure will be called by other stored procedure
        RETURN @@ERROR
    END
    
END
SET NOCOUNT OFF
SET XACT_ABORT OFF

GO

IF OBJECT_ID( 'dbo.P_QUERY_ALL_COMPANY', 'P' ) IS NOT NULL
  DROP  PROCEDURE  dbo.P_QUERY_ALL_COMPANY
GO

CREATE PROCEDURE P_QUERY_ALL_COMPANY

AS
/*
Module  : 
Author  : SQL Generator
Date    : 25-02-2017
Desc    : Retrieves records from T_CMN003_COMPANY
Returns: 0 if successful, else SQL error code

Change Revision
-----------------------------------------------------
Date           Author            Remark

*/
SET XACT_ABORT ON

BEGIN
    SELECT 
      t.COMPANY_ID,
      t.COMPANY_NAME,
      t.COMPANY_DETAIL,
      t.COMPANY_CONTACT,
      t.COMPANY_LOCATION,
      t.CREATED_BY,
      t.CREATED_TIME,
      t.LAST_UPDATED_BY,
      t.LAST_UPDATED_TIME,
      t.VERSION_NO,
      t.TRANSACTION_ID
    FROM T_CMN003_COMPANY t
    
    --Recommend when the stored procedure will be called by other stored procedure
    RETURN @@ERROR

END
SET XACT_ABORT OFF
GO


IF OBJECT_ID( 'dbo.P_QUERY_COMPANY_BY_ID', 'P' ) IS NOT NULL
  DROP  PROCEDURE  dbo.P_QUERY_COMPANY_BY_ID
GO

CREATE PROCEDURE P_QUERY_COMPANY_BY_ID
(
  @p_companyid nvarchar(50)
)
AS
/*
Module  : 
Author  : SQL Generator
Date    : 25-02-2017
Desc    : Retrieves records from T_CMN003_COMPANY
Returns: 0 if successful, else SQL error code

Change Revision
-----------------------------------------------------
Date           Author            Remark

*/
SET XACT_ABORT ON

BEGIN
    SELECT 
      t.COMPANY_ID,
      t.COMPANY_NAME,
      t.COMPANY_DETAIL,
      t.COMPANY_CONTACT,
      t.COMPANY_LOCATION,
      t.CREATED_BY,
      t.CREATED_TIME,
      t.LAST_UPDATED_BY,
      t.LAST_UPDATED_TIME,
      t.VERSION_NO,
      t.TRANSACTION_ID
    FROM T_CMN003_COMPANY t
	WHERE t.COMPANY_ID = @p_companyid;
    
    --Recommend when the stored procedure will be called by other stored procedure
    RETURN @@ERROR

END
SET XACT_ABORT OFF
GO

IF OBJECT_ID( 'dbo.P_QUERY_COURSE_BY_DATETIME', 'P' ) IS NOT NULL
  DROP  PROCEDURE  dbo.P_QUERY_COURSE_BY_DATETIME
GO

CREATE PROCEDURE [dbo].[P_QUERY_COURSE_BY_DATETIME]
(
  @p_freetext nvarchar(50),
  @p_start_dttm nvarchar(50),
  @p_end_dttm nvarchar(50),
  @p_userID nvarchar(50)
)
AS
/*
Module  : 
Author  : SQL Generator
Date    : 30-01-2017
Desc    : Retrieves records from T_BIZ001_COURSE
Returns: 0 if successful, else SQL error code

Change Revision
-----------------------------------------------------
Date           Author            Remark

*/
SET XACT_ABORT ON

BEGIN
    SELECT 
      t.COURSEID,
      t.USERID,
      t.COURSE_NAME,
      t.COURSE_DETAIL,
	  t.COURSE_IMAGEPATH,
      t.COURSE_FILENAME,
	  t.COURSE_REG_URL,
      t.CREATED_BY,
      t.CREATED_TIME,
      t.LAST_UPDATED_BY,
      t.LAST_UPDATED_TIME,
      t.VERSION_NO,
      t.TRANSACTION_ID,
	  t.SOURCE
    FROM [AVAIABLE_COURSE] t
	LEFT JOIN [AVAIABLE_COURSE_EVENT] e ON e.COURSEID = t.COURSEID
	WHERE t.SOURCE = 'P'
	AND (@p_start_dttm IS NULL OR @p_start_dttm ='' OR e.START_DTTM >= CAST(@p_start_dttm as DATETIME))
	AND (@p_end_dttm IS NULL OR @p_end_dttm ='' OR e.END_DTTM <= CAST(@p_end_dttm as DATETIME))
	AND (@p_freetext IS NULL OR @p_freetext ='' OR COURSE_NAME like '%'+@p_freetext+'%' OR COURSE_DETAIL like '%'+@p_freetext+'%')
    AND STATUS = 'A' -- only approved will be search out.
	AND t.USERID is not null and t.SOURCE = 'P'
	--and Exists (select * from T_CMN001_USER where LOGINID =@p_userID and USER_ROLE_ARR='AO')
	UNION ALL
	SELECT 
      t.COURSEID,
      t.USERID,
      t.COURSE_NAME,
      t.COURSE_DETAIL,
	  t.COURSE_IMAGEPATH,
      t.COURSE_FILENAME,
	  t.COURSE_REG_URL,
      t.CREATED_BY,
      t.CREATED_TIME,
      t.LAST_UPDATED_BY,
      t.LAST_UPDATED_TIME,
      t.VERSION_NO,
      t.TRANSACTION_ID,
	  t.SOURCE
    FROM [AVAIABLE_COURSE] t
	LEFT JOIN [AVAIABLE_COURSE_EVENT] e ON e.COURSEID = t.COURSEID
	WHERE t.SOURCE != 'P'
	AND (@p_freetext IS NULL OR @p_freetext ='' OR COURSE_NAME like '%'+@p_freetext+'%' OR COURSE_DETAIL like '%'+@p_freetext+'%')
    AND STATUS = 'A' -- only approved will be search out.
	AND t.USERID is not null
	and Exists (select * from T_CMN001_USER where LOGINID =@p_userID and USER_ROLE_ARR='AO')
    --Recommend when the stored procedure will be called by other stored procedure
    RETURN @@ERROR

END
SET XACT_ABORT OFF

GO

IF OBJECT_ID( 'dbo.P_QUERY_COURSE_BY_ADMIN', 'P' ) IS NOT NULL
  DROP  PROCEDURE  dbo.P_QUERY_COURSE_BY_ADMIN
GO

CREATE PROCEDURE [dbo].[P_QUERY_COURSE_BY_ADMIN]
(
  @p_freetext nvarchar(50),
  @p_start_dttm nvarchar(50),
  @p_end_dttm nvarchar(50)
)
AS
/*
Module  : 
Author  : SQL Generator
Date    : 30-01-2017
Desc    : Retrieves records from T_BIZ001_COURSE
Returns: 0 if successful, else SQL error code

Change Revision
-----------------------------------------------------
Date           Author            Remark

*/
SET XACT_ABORT ON

BEGIN
    SELECT 
      t.COURSEID,
      t.USERID,
      t.COURSE_NAME,
      t.COURSE_DETAIL,
	  t.COURSE_IMAGEPATH,
      t.COURSE_FILENAME,
	  t.STATUS,
	  t.COURSE_REG_URL,
      t.CREATED_BY,
      t.CREATED_TIME,
      t.LAST_UPDATED_BY,
      t.LAST_UPDATED_TIME,
      t.VERSION_NO,
      t.TRANSACTION_ID
    FROM T_BIZ001_COURSE t
	LEFT JOIN T_BIZ002_COURSE_EVENT e ON e.COURSEID = t.COURSEID
	WHERE (@p_start_dttm IS NULL or @p_start_dttm IS NULL OR e.START_DTTM IS NULL OR e.START_DTTM <= CAST(@p_start_dttm as DATETIME))
	AND (@p_end_dttm IS NULL OR @p_end_dttm ='' OR e.END_DTTM IS NULL OR e.END_DTTM >= CAST(@p_end_dttm as DATETIME))
	AND (@p_freetext IS NULL OR @p_freetext ='' OR COURSE_NAME LIKE '%'+@p_freetext+'%' OR COURSE_DETAIL LIKE '%'+@p_freetext+'%')
    
    --Recommend when the stored procedure will be called by other stored procedure
    RETURN @@ERROR

END
SET XACT_ABORT OFF

GO

IF OBJECT_ID( 'dbo.P_QUERY_COURSE_BY_FREE_TEXT', 'P' ) IS NOT NULL
  DROP  PROCEDURE  dbo.P_QUERY_COURSE_BY_FREE_TEXT
GO

CREATE PROCEDURE [dbo].[P_QUERY_COURSE_BY_FREE_TEXT]
(
  @freetext nvarchar(50)
)
AS
/*
Module  : 
Author  : SQL Generator
Date    : 30-01-2017
Desc    : Retrieves records from T_BIZ001_COURSE
Returns: 0 if successful, else SQL error code

Change Revision
-----------------------------------------------------
Date           Author            Remark

*/
SET XACT_ABORT ON

BEGIN
    SELECT distinct
      t.COURSEID,
      t.USERID,
      t.COURSE_NAME,
      t.COURSE_DETAIL,
      t.COURSE_IMAGEPATH,
      t.COURSE_FILENAME,
	  t.COURSE_REG_URL,
      t.CREATED_BY,
      t.CREATED_TIME,
      t.LAST_UPDATED_BY,
      t.LAST_UPDATED_TIME,
      t.VERSION_NO,
      t.TRANSACTION_ID
    FROM [AVAIABLE_COURSE] t
    WHERE t.USERID is not null
	AND (COURSE_NAME like '%'+@freetext+'%'
    OR COURSE_DETAIL like '%'+@freetext+'%')
   
    --Recommend when the stored procedure will be called by other stored procedure
    RETURN @@ERROR

END
SET XACT_ABORT OFF

GO
