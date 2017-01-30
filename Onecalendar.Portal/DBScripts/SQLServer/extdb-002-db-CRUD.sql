
IF OBJECT_ID( 'dbo.P_CMN001_USER_I', 'P' ) IS NOT NULL
    DROP  PROCEDURE  dbo.P_CMN001_USER_I
GO

CREATE PROCEDURE P_CMN001_USER_I
(
  @p_userid nvarchar(36),
  @p_loginid nvarchar(50),
  @p_user_name nvarchar(66),
  @p_email_address nvarchar(255),
  @p_password_hash varbinary(max),
  @p_password_hist_hash varbinary(max),
  @p_last_activity_date datetime,
  @p_is_deleted char(1),
  @p_company_id nvarchar(50),
  @p_status char(1),
  @p_created_by nvarchar(256),
  @p_created_time datetime,
  @p_transaction_id varchar(50)
)

AS
	
/*
Module  : 
Author  : SQL Generator
Date    : 22-01-2017
Desc    : Insert record into T_CMN001_USER
Returns: 0 if successful, else SQL error code

Change Revision
-----------------------------------------------------
Date           Author            Remark

*/

-- do your settings here...
SET NOCOUNT ON
--It will stop stored procedure when there is error, but if the stored procedure will be called by others, the caller stored procedure should check the return value.
--For example, 
/*
	--Application ID Validation and Retrieval
	EXEC @v_error = P_IC_APP_GET_ID @p_app_name, @v_app_id OUTPUT
	IF @v_error <> 0 RETURN  @v_error

*/
SET XACT_ABORT ON

-- declare and initialize local variables here... 

-- do your business transaction   
BEGIN

    INSERT INTO T_CMN001_USER
    (
      USERID,
      LOGINID,
      USER_NAME,
      EMAIL_ADDRESS,
      PASSWORD_HASH,
      PASSWORD_HIST_HASH,
      LAST_ACTIVITY_DATE,
      IS_DELETED,
      COMPANY_ID,
      STATUS,
      CREATED_BY,
      CREATED_TIME,
      LAST_UPDATED_BY,
      LAST_UPDATED_TIME,
      VERSION_NO,
      TRANSACTION_ID
    )
    VALUES 
    (
	  @p_userid,
	  @p_loginid,
	  @p_user_name,
	  @p_email_address,
	  @p_password_hash,
	  @p_password_hist_hash,
	  @p_last_activity_date,
	  @p_is_deleted,
	  @p_company_id,
	  @p_status,
	  @p_created_by,
	  @p_created_time,
	  @p_created_by,
	  @p_created_time,
	  1,
	  @p_transaction_id
    )
   
    
    
    --Recommend when the stored procedure will be called by other stored procedure
    RETURN @@ERROR
END 
SET NOCOUNT OFF
SET XACT_ABORT OFF
GO
  

IF OBJECT_ID( 'dbo.P_CMN001_USER_U', 'P' ) IS NOT NULL
  DROP  PROCEDURE  dbo.P_CMN001_USER_U
GO

CREATE PROCEDURE P_CMN001_USER_U
(
	@o_userid nvarchar(36),
	@p_loginid nvarchar(50),
	@p_user_name nvarchar(66),
	@p_email_address nvarchar(255),
	@p_password_hash varbinary(max),
	@p_password_hist_hash varbinary(max),
	@p_last_activity_date datetime,
	@p_is_deleted char(1),
	@p_company_id nvarchar(50),
	@p_status char(1),
	@p_last_updated_by nvarchar(256),
	@p_last_updated_time datetime,
	@o_version_no int,
	@p_transaction_id varchar(50)
)

AS
	
/*
Module  : 
Author  : SQL Generator
Date    : 22-01-2017
Desc    : Update records to T_CMN001_USER
Returns: 0 if successful, else SQL error code

Change Revision
-----------------------------------------------------
Date           Author            Remark

*/

-- do your settings here...
SET NOCOUNT ON
--It will stop stored procedure when there is error, but if the stored procedure will be called by others, the caller stored procedure should check the return value.
--For example, 
/*
	--Application ID Validation and Retrieval
	EXEC @v_error = P_IC_APP_GET_ID @p_app_name, @v_app_id OUTPUT
	IF @v_error <> 0 RETURN  @v_error

*/
SET XACT_ABORT ON

-- declare and initialize local variables here...

-- do your business transaction
BEGIN
    UPDATE T_CMN001_USER
    SET LOGINID = @p_loginid,
        USER_NAME = @p_user_name,
        EMAIL_ADDRESS = @p_email_address,
        PASSWORD_HASH = @p_password_hash,
        PASSWORD_HIST_HASH = @p_password_hist_hash,
        LAST_ACTIVITY_DATE = @p_last_activity_date,
        IS_DELETED = @p_is_deleted,
        COMPANY_ID = @p_company_id,
        STATUS = @p_status,
        LAST_UPDATED_BY = @p_last_updated_by,
        LAST_UPDATED_TIME = @p_last_updated_time,
        VERSION_NO = VERSION_NO+1,
        TRANSACTION_ID = @p_transaction_id
        
    WHERE USERID  = @o_userid
    AND VERSION_NO  = @o_version_no
    ;

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
  

IF OBJECT_ID( 'dbo.P_CMN001_USER_D', 'P' ) IS NOT NULL
    DROP  PROCEDURE  dbo.P_CMN001_USER_D
GO

CREATE PROCEDURE P_CMN001_USER_D
(
	@o_userid nvarchar(36),
	@p_last_updated_by nvarchar(256),
	@p_last_updated_time datetime,
	@o_version_no int,
	@p_transaction_id varchar(50)
)
AS

/*
Module  : 
Author  : SQL Generator
Date    : 22-01-2017
Desc    : Delete records from T_CMN001_USER
Returns: 0 if successful, else SQL error code

Change Revision
-----------------------------------------------------
Date           Author            Remark

*/

-- do your settings here...
SET NOCOUNT ON
--It will stop stored procedure when there is error, but if the stored procedure will be called by others, the caller stored procedure should check the return value.
--For example, 
/*
	--Application ID Validation and Retrieval
	EXEC @v_error = P_IC_APP_GET_ID @p_app_name, @v_app_id OUTPUT
	IF @v_error <> 0 RETURN  @v_error

*/
SET XACT_ABORT ON

-- declare and initialize local variables here...

-- do your business transaction
BEGIN
    --Update transaction id to current transaction id, then, trigger can log data correctly for audit trail.
    UPDATE T_CMN001_USER
	  SET LAST_UPDATED_BY = @p_last_updated_by,
        LAST_UPDATED_TIME = @p_last_updated_time,
        TRANSACTION_ID = @p_transaction_id
        
    WHERE USERID  = @o_userid
    AND VERSION_NO  = @o_version_no
    ;

    DELETE FROM T_CMN001_USER
    WHERE USERID  = @o_userid
    AND VERSION_NO  = @o_version_no
    ;

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
  

IF OBJECT_ID( 'dbo.P_CMN001_USER_S', 'P' ) IS NOT NULL
  DROP  PROCEDURE  dbo.P_CMN001_USER_S
GO

CREATE PROCEDURE P_CMN001_USER_S
(
  @p_userid nvarchar(36),
  @p_loginid nvarchar(50),
  @p_user_name nvarchar(66),
  @p_email_address nvarchar(255),
  @p_password_hash varbinary(max),
  @p_password_hist_hash varbinary(max),
  @p_last_activity_date datetime,
  @p_is_deleted char(1),
  @p_company_id nvarchar(50),
  @p_status char(1),
  @p_created_by nvarchar(256),
  @p_created_time datetime,
  @p_last_updated_by nvarchar(256),
  @p_last_updated_time datetime,
  @p_version_no int,
  @p_transaction_id varchar(50)
)
AS
/*
Module  : 
Author  : SQL Generator
Date    : 22-01-2017
Desc    : Retrieves records from T_CMN001_USER
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
      t.USERID,
      t.LOGINID,
      t.USER_NAME,
      t.EMAIL_ADDRESS,
      t.PASSWORD_HASH,
      t.PASSWORD_HIST_HASH,
      t.LAST_ACTIVITY_DATE,
      t.IS_DELETED,
      t.COMPANY_ID,
      t.STATUS,
      t.CREATED_BY,
      t.CREATED_TIME,
      t.LAST_UPDATED_BY,
      t.LAST_UPDATED_TIME,
      t.VERSION_NO,
      t.TRANSACTION_ID
    FROM T_CMN001_USER t
    WHERE USERID  = @p_userid
    AND LOGINID  = @p_loginid
    AND USER_NAME  = @p_user_name
    AND EMAIL_ADDRESS  = @p_email_address
    AND PASSWORD_HASH  = @p_password_hash
    AND PASSWORD_HIST_HASH  = @p_password_hist_hash
    AND LAST_ACTIVITY_DATE  = @p_last_activity_date
    AND IS_DELETED  = @p_is_deleted
    AND COMPANY_ID  = @p_company_id
    AND STATUS  = @p_status
    AND CREATED_BY  = @p_created_by
    AND CREATED_TIME  = @p_created_time
    AND LAST_UPDATED_BY  = @p_last_updated_by
    AND LAST_UPDATED_TIME  = @p_last_updated_time
    AND VERSION_NO  = @p_version_no
    AND TRANSACTION_ID  = @p_transaction_id
    

    --Recommend when the stored procedure will be called by other stored procedure
    RETURN @@ERROR

END
SET XACT_ABORT OFF
GO
------------------------------------------ 
-- below is for business tables;
------------------------------------------
IF OBJECT_ID( 'dbo.P_BIZ001_COURSE_I', 'P' ) IS NOT NULL
    DROP  PROCEDURE  dbo.P_BIZ001_COURSE_I
GO

CREATE PROCEDURE P_BIZ001_COURSE_I
(
  @p_courseid nvarchar(36),
  @p_userid nvarchar(36),
  @p_course_name nvarchar(66),
  @p_course_detail nvarchar(2000),
  @p_created_by nvarchar(256),
  @p_created_time datetime,
  @p_transaction_id varchar(50)
)

AS
	
/*
Module  : 
Author  : SQL Generator
Date    : 30-01-2017
Desc    : Insert record into T_BIZ001_COURSE
Returns: 0 if successful, else SQL error code

Change Revision
-----------------------------------------------------
Date           Author            Remark

*/

-- do your settings here...
SET NOCOUNT ON
--It will stop stored procedure when there is error, but if the stored procedure will be called by others, the caller stored procedure should check the return value.
--For example, 
/*
	--Application ID Validation and Retrieval
	EXEC @v_error = P_IC_APP_GET_ID @p_app_name, @v_app_id OUTPUT
	IF @v_error <> 0 RETURN  @v_error

*/
SET XACT_ABORT ON

-- declare and initialize local variables here... 

-- do your business transaction   
BEGIN

    INSERT INTO T_BIZ001_COURSE
    (
      COURSEID,
      USERID,
      COURSE_NAME,
      COURSE_DETAIL,
      CREATED_BY,
      CREATED_TIME,
      LAST_UPDATED_BY,
      LAST_UPDATED_TIME,
      VERSION_NO,
      TRANSACTION_ID
    )
    VALUES 
    (
	  @p_courseid,
	  @p_userid,
	  @p_course_name,
	  @p_course_detail,
	  @p_created_by,
	  @p_created_time,
	  @p_created_by,
	  @p_created_time,
	  1,
	  @p_transaction_id
    )
   
    
    
    --Recommend when the stored procedure will be called by other stored procedure
    RETURN @@ERROR
END 
SET NOCOUNT OFF
SET XACT_ABORT OFF
GO
  

IF OBJECT_ID( 'dbo.P_BIZ001_COURSE_U', 'P' ) IS NOT NULL
  DROP  PROCEDURE  dbo.P_BIZ001_COURSE_U
GO

CREATE PROCEDURE P_BIZ001_COURSE_U
(
	@o_courseid nvarchar(36),
	@p_userid nvarchar(36),
	@p_course_name nvarchar(66),
	@p_course_detail nvarchar(2000),
	@p_last_updated_by nvarchar(256),
	@p_last_updated_time datetime,
	@o_version_no int,
	@p_transaction_id varchar(50)
)

AS
	
/*
Module  : 
Author  : SQL Generator
Date    : 30-01-2017
Desc    : Update records to T_BIZ001_COURSE
Returns: 0 if successful, else SQL error code

Change Revision
-----------------------------------------------------
Date           Author            Remark

*/

-- do your settings here...
SET NOCOUNT ON
--It will stop stored procedure when there is error, but if the stored procedure will be called by others, the caller stored procedure should check the return value.
--For example, 
/*
	--Application ID Validation and Retrieval
	EXEC @v_error = P_IC_APP_GET_ID @p_app_name, @v_app_id OUTPUT
	IF @v_error <> 0 RETURN  @v_error

*/
SET XACT_ABORT ON

-- declare and initialize local variables here...

-- do your business transaction
BEGIN
    UPDATE T_BIZ001_COURSE
    SET USERID = @p_userid,
        COURSE_NAME = @p_course_name,
        COURSE_DETAIL = @p_course_detail,
        LAST_UPDATED_BY = @p_last_updated_by,
        LAST_UPDATED_TIME = @p_last_updated_time,
        VERSION_NO = VERSION_NO+1,
        TRANSACTION_ID = @p_transaction_id
        
    WHERE COURSEID  = @o_courseid
    AND VERSION_NO  = @o_version_no
    ;

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
  

IF OBJECT_ID( 'dbo.P_BIZ001_COURSE_D', 'P' ) IS NOT NULL
    DROP  PROCEDURE  dbo.P_BIZ001_COURSE_D
GO

CREATE PROCEDURE P_BIZ001_COURSE_D
(
	@o_courseid nvarchar(36),
	@p_last_updated_by nvarchar(256),
	@p_last_updated_time datetime,
	@o_version_no int,
	@p_transaction_id varchar(50)
)
AS

/*
Module  : 
Author  : SQL Generator
Date    : 30-01-2017
Desc    : Delete records from T_BIZ001_COURSE
Returns: 0 if successful, else SQL error code

Change Revision
-----------------------------------------------------
Date           Author            Remark

*/

-- do your settings here...
SET NOCOUNT ON
--It will stop stored procedure when there is error, but if the stored procedure will be called by others, the caller stored procedure should check the return value.
--For example, 
/*
	--Application ID Validation and Retrieval
	EXEC @v_error = P_IC_APP_GET_ID @p_app_name, @v_app_id OUTPUT
	IF @v_error <> 0 RETURN  @v_error

*/
SET XACT_ABORT ON

-- declare and initialize local variables here...

-- do your business transaction
BEGIN
    --Update transaction id to current transaction id, then, trigger can log data correctly for audit trail.
    UPDATE T_BIZ001_COURSE
	  SET LAST_UPDATED_BY = @p_last_updated_by,
        LAST_UPDATED_TIME = @p_last_updated_time,
        TRANSACTION_ID = @p_transaction_id
        
    WHERE COURSEID  = @o_courseid
    AND VERSION_NO  = @o_version_no
    ;

    DELETE FROM T_BIZ001_COURSE
    WHERE COURSEID  = @o_courseid
    AND VERSION_NO  = @o_version_no
    ;

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
  

IF OBJECT_ID( 'dbo.P_BIZ001_COURSE_S', 'P' ) IS NOT NULL
  DROP  PROCEDURE  dbo.P_BIZ001_COURSE_S
GO

CREATE PROCEDURE P_BIZ001_COURSE_S
(
  @p_courseid nvarchar(36),
  @p_userid nvarchar(36),
  @p_course_name nvarchar(66),
  @p_course_detail nvarchar(2000),
  @p_created_by nvarchar(256),
  @p_created_time datetime,
  @p_last_updated_by nvarchar(256),
  @p_last_updated_time datetime,
  @p_version_no int,
  @p_transaction_id varchar(50)
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
      t.CREATED_BY,
      t.CREATED_TIME,
      t.LAST_UPDATED_BY,
      t.LAST_UPDATED_TIME,
      t.VERSION_NO,
      t.TRANSACTION_ID
    FROM T_BIZ001_COURSE t
    WHERE COURSEID  = @p_courseid
    AND USERID  = @p_userid
    AND COURSE_NAME  = @p_course_name
    AND COURSE_DETAIL  = @p_course_detail
    AND CREATED_BY  = @p_created_by
    AND CREATED_TIME  = @p_created_time
    AND LAST_UPDATED_BY  = @p_last_updated_by
    AND LAST_UPDATED_TIME  = @p_last_updated_time
    AND VERSION_NO  = @p_version_no
    AND TRANSACTION_ID  = @p_transaction_id
    

    --Recommend when the stored procedure will be called by other stored procedure
    RETURN @@ERROR

END
SET XACT_ABORT OFF
GO
  
IF OBJECT_ID( 'dbo.P_QUERY_COURSES_FOR_VIEW', 'P' ) IS NOT NULL
  DROP  PROCEDURE  dbo.P_QUERY_COURSES_FOR_VIEW
GO

CREATE PROCEDURE P_QUERY_COURSES_FOR_VIEW
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
      t.CREATED_BY,
      t.CREATED_TIME,
      t.LAST_UPDATED_BY,
      t.LAST_UPDATED_TIME,
      t.VERSION_NO,
      t.TRANSACTION_ID
    FROM T_BIZ001_COURSE t
   
    --Recommend when the stored procedure will be called by other stored procedure
    RETURN @@ERROR

END
SET XACT_ABORT OFF
GO