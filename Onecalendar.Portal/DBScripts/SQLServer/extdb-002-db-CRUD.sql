
IF OBJECT_ID( 'dbo.P_CMN002_CODE_I', 'P' ) IS NOT NULL
    DROP  PROCEDURE  dbo.P_CMN002_CODE_I
GO

CREATE PROCEDURE P_CMN002_CODE_I
(
  @p_code_id nvarchar(50),
  @p_app_id nvarchar(50),
  @p_code_category nvarchar(128),
  @p_code nvarchar(50),
  @p_lowered_code_category nvarchar(128),
  @p_lowered_code nvarchar(50),
  @p_code_desc nvarchar(256),
  @p_code_remarks nvarchar(256),
  @p_effective_start_date datetime,
  @p_effective_end_date datetime,
  @p_code_seq int,
  @p_is_deleted nvarchar(50),
  @p_transaction_id nvarchar(50),
  @p_created_by nvarchar(256),
  @p_created_time datetime
)

AS
	
/*
Module  : 
Author  : SQL Generator
Date    : 22-02-2017
Desc    : Insert record into T_CMN002_CODE
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

    INSERT INTO T_CMN002_CODE
    (
      CODE_ID,
      APP_ID,
      CODE_CATEGORY,
      CODE,
      LOWERED_CODE_CATEGORY,
      LOWERED_CODE,
      CODE_DESC,
      CODE_REMARKS,
      EFFECTIVE_START_DATE,
      EFFECTIVE_END_DATE,
      CODE_SEQ,
      IS_DELETED,
      VERSION_NO,
      TRANSACTION_ID,
      CREATED_BY,
      CREATED_TIME,
      LAST_UPDATED_BY,
      LAST_UPDATED_TIME
    )
    VALUES 
    (
	  @p_code_id,
	  @p_app_id,
	  @p_code_category,
	  @p_code,
	  @p_lowered_code_category,
	  @p_lowered_code,
	  @p_code_desc,
	  @p_code_remarks,
	  @p_effective_start_date,
	  @p_effective_end_date,
	  @p_code_seq,
	  @p_is_deleted,
	  1,
	  @p_transaction_id,
	  @p_created_by,
	  @p_created_time,
	  @p_created_by,
	  @p_created_time
    )
   
    
    
    --Recommend when the stored procedure will be called by other stored procedure
    RETURN @@ERROR
END 
SET NOCOUNT OFF
SET XACT_ABORT OFF
GO
  

IF OBJECT_ID( 'dbo.P_CMN002_CODE_U', 'P' ) IS NOT NULL
  DROP  PROCEDURE  dbo.P_CMN002_CODE_U
GO

CREATE PROCEDURE P_CMN002_CODE_U
(
	@o_code_id nvarchar(50),
	@p_app_id nvarchar(50),
	@p_code_category nvarchar(128),
	@p_code nvarchar(50),
	@p_lowered_code_category nvarchar(128),
	@p_lowered_code nvarchar(50),
	@p_code_desc nvarchar(256),
	@p_code_remarks nvarchar(256),
	@p_effective_start_date datetime,
	@p_effective_end_date datetime,
	@p_code_seq int,
	@p_is_deleted nvarchar(50),
	@o_version_no int,
	@p_transaction_id nvarchar(50),
	@p_last_updated_by nvarchar(256),
	@p_last_updated_time datetime
)

AS
	
/*
Module  : 
Author  : SQL Generator
Date    : 22-02-2017
Desc    : Update records to T_CMN002_CODE
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
    UPDATE T_CMN002_CODE
    SET APP_ID = @p_app_id,
        CODE_CATEGORY = @p_code_category,
        CODE = @p_code,
        LOWERED_CODE_CATEGORY = @p_lowered_code_category,
        LOWERED_CODE = @p_lowered_code,
        CODE_DESC = @p_code_desc,
        CODE_REMARKS = @p_code_remarks,
        EFFECTIVE_START_DATE = @p_effective_start_date,
        EFFECTIVE_END_DATE = @p_effective_end_date,
        CODE_SEQ = @p_code_seq,
        IS_DELETED = @p_is_deleted,
        VERSION_NO = VERSION_NO+1,
        TRANSACTION_ID = @p_transaction_id,
        LAST_UPDATED_BY = @p_last_updated_by,
        LAST_UPDATED_TIME = @p_last_updated_time
        
    WHERE CODE_ID  = @o_code_id
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
  

IF OBJECT_ID( 'dbo.P_CMN002_CODE_D', 'P' ) IS NOT NULL
    DROP  PROCEDURE  dbo.P_CMN002_CODE_D
GO

CREATE PROCEDURE P_CMN002_CODE_D
(
	@o_code_id nvarchar(50),
	@o_version_no int,
	@p_transaction_id nvarchar(50),
	@p_last_updated_by nvarchar(256),
	@p_last_updated_time datetime
)
AS

/*
Module  : 
Author  : SQL Generator
Date    : 22-02-2017
Desc    : Delete records from T_CMN002_CODE
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
    UPDATE T_CMN002_CODE
	  SET TRANSACTION_ID = @p_transaction_id,
        LAST_UPDATED_BY = @p_last_updated_by,
        LAST_UPDATED_TIME = @p_last_updated_time
        
    WHERE CODE_ID  = @o_code_id
    AND VERSION_NO  = @o_version_no
    ;

    DELETE FROM T_CMN002_CODE
    WHERE CODE_ID  = @o_code_id
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
  

IF OBJECT_ID( 'dbo.P_CMN002_CODE_S', 'P' ) IS NOT NULL
  DROP  PROCEDURE  dbo.P_CMN002_CODE_S
GO

CREATE PROCEDURE P_CMN002_CODE_S
(
  @p_code_id nvarchar(50),
  @p_app_id nvarchar(50),
  @p_code_category nvarchar(128),
  @p_code nvarchar(50),
  @p_lowered_code_category nvarchar(128),
  @p_lowered_code nvarchar(50),
  @p_code_desc nvarchar(256),
  @p_code_remarks nvarchar(256),
  @p_effective_start_date datetime,
  @p_effective_end_date datetime,
  @p_code_seq int,
  @p_is_deleted nvarchar(50),
  @p_version_no int,
  @p_transaction_id nvarchar(50),
  @p_created_by nvarchar(256),
  @p_created_time datetime,
  @p_last_updated_by nvarchar(256),
  @p_last_updated_time datetime
)
AS
/*
Module  : 
Author  : SQL Generator
Date    : 22-02-2017
Desc    : Retrieves records from T_CMN002_CODE
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
      t.CODE_ID,
      t.APP_ID,
      t.CODE_CATEGORY,
      t.CODE,
      t.LOWERED_CODE_CATEGORY,
      t.LOWERED_CODE,
      t.CODE_DESC,
      t.CODE_REMARKS,
      t.EFFECTIVE_START_DATE,
      t.EFFECTIVE_END_DATE,
      t.CODE_SEQ,
      t.IS_DELETED,
      t.VERSION_NO,
      t.TRANSACTION_ID,
      t.CREATED_BY,
      t.CREATED_TIME,
      t.LAST_UPDATED_BY,
      t.LAST_UPDATED_TIME
    FROM T_CMN002_CODE t
    WHERE CODE_ID  = @p_code_id
    AND APP_ID  = @p_app_id
    AND CODE_CATEGORY  = @p_code_category
    AND CODE  = @p_code
    AND LOWERED_CODE_CATEGORY  = @p_lowered_code_category
    AND LOWERED_CODE  = @p_lowered_code
    AND CODE_DESC  = @p_code_desc
    AND CODE_REMARKS  = @p_code_remarks
    AND EFFECTIVE_START_DATE  = @p_effective_start_date
    AND EFFECTIVE_END_DATE  = @p_effective_end_date
    AND CODE_SEQ  = @p_code_seq
    AND IS_DELETED  = @p_is_deleted
    AND VERSION_NO  = @p_version_no
    AND TRANSACTION_ID  = @p_transaction_id
    AND CREATED_BY  = @p_created_by
    AND CREATED_TIME  = @p_created_time
    AND LAST_UPDATED_BY  = @p_last_updated_by
    AND LAST_UPDATED_TIME  = @p_last_updated_time
    

    --Recommend when the stored procedure will be called by other stored procedure
    RETURN @@ERROR

END
SET XACT_ABORT OFF
GO
  

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
  @p_password_hash_salt varbinary(max),
  @p_password_hist_hash varbinary(max),
  @p_last_activity_date datetime,
  @p_is_deleted char(1),
  @p_company_id nvarchar(50),
  @p_user_role_arr nvarchar(100),
  @p_status char(1),
  @p_created_by nvarchar(256),
  @p_created_time datetime,
  @p_transaction_id varchar(50)
)

AS
	
/*
Module  : 
Author  : SQL Generator
Date    : 22-02-2017
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
      PASSWORD_HASH_SALT,
      PASSWORD_HIST_HASH,
      LAST_ACTIVITY_DATE,
      IS_DELETED,
      COMPANY_ID,
      USER_ROLE_ARR,
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
	  @p_password_hash_salt,
	  @p_password_hist_hash,
	  @p_last_activity_date,
	  @p_is_deleted,
	  @p_company_id,
	  @p_user_role_arr,
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
	@p_password_hash_salt varbinary(max),
	@p_password_hist_hash varbinary(max),
	@p_last_activity_date datetime,
	@p_is_deleted char(1),
	@p_company_id nvarchar(50),
	@p_user_role_arr nvarchar(100),
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
Date    : 22-02-2017
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
        PASSWORD_HASH_SALT = @p_password_hash_salt,
        PASSWORD_HIST_HASH = @p_password_hist_hash,
        LAST_ACTIVITY_DATE = @p_last_activity_date,
        IS_DELETED = @p_is_deleted,
        COMPANY_ID = @p_company_id,
        USER_ROLE_ARR = @p_user_role_arr,
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
Date    : 22-02-2017
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
  @p_password_hash_salt varbinary(max),
  @p_password_hist_hash varbinary(max),
  @p_last_activity_date datetime,
  @p_is_deleted char(1),
  @p_company_id nvarchar(50),
  @p_user_role_arr nvarchar(100),
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
Date    : 22-02-2017
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
    AND LOGINID  = @p_loginid
    AND USER_NAME  = @p_user_name
    AND EMAIL_ADDRESS  = @p_email_address
    AND PASSWORD_HASH  = @p_password_hash
    AND PASSWORD_HASH_SALT  = @p_password_hash_salt
    AND PASSWORD_HIST_HASH  = @p_password_hist_hash
    AND LAST_ACTIVITY_DATE  = @p_last_activity_date
    AND IS_DELETED  = @p_is_deleted
    AND COMPANY_ID  = @p_company_id
    AND USER_ROLE_ARR  = @p_user_role_arr
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
  

IF OBJECT_ID( 'dbo.P_BIZ002_COURSE_EVENT_I', 'P' ) IS NOT NULL
    DROP  PROCEDURE  dbo.P_BIZ002_COURSE_EVENT_I
GO

CREATE PROCEDURE P_BIZ002_COURSE_EVENT_I
(
  @p_courseeventid nvarchar(36),
  @p_courseid nvarchar(36),
  @p_schedule nvarchar(500),
  @p_location nvarchar(500),
  @p_price nvarchar(50),
  @p_created_by nvarchar(256),
  @p_created_time datetime,
  @p_transaction_id varchar(50)
)

AS
	
/*
Module  : 
Author  : SQL Generator
Date    : 22-02-2017
Desc    : Insert record into T_BIZ002_COURSE_EVENT
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

    INSERT INTO T_BIZ002_COURSE_EVENT
    (
      COURSEEVENTID,
      COURSEID,
      SCHEDULE,
      LOCATION,
      PRICE,
      CREATED_BY,
      CREATED_TIME,
      LAST_UPDATED_BY,
      LAST_UPDATED_TIME,
      VERSION_NO,
      TRANSACTION_ID
    )
    VALUES 
    (
	  @p_courseeventid,
	  @p_courseid,
	  @p_schedule,
	  @p_location,
	  @p_price,
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
  

IF OBJECT_ID( 'dbo.P_BIZ002_COURSE_EVENT_U', 'P' ) IS NOT NULL
  DROP  PROCEDURE  dbo.P_BIZ002_COURSE_EVENT_U
GO

CREATE PROCEDURE P_BIZ002_COURSE_EVENT_U
(
	@o_courseeventid nvarchar(36),
	@p_courseid nvarchar(36),
	@p_schedule nvarchar(500),
	@p_location nvarchar(500),
	@p_price nvarchar(50),
	@p_last_updated_by nvarchar(256),
	@p_last_updated_time datetime,
	@o_version_no int,
	@p_transaction_id varchar(50)
)

AS
	
/*
Module  : 
Author  : SQL Generator
Date    : 22-02-2017
Desc    : Update records to T_BIZ002_COURSE_EVENT
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
    UPDATE T_BIZ002_COURSE_EVENT
    SET COURSEID = @p_courseid,
        SCHEDULE = @p_schedule,
        LOCATION = @p_location,
        PRICE = @p_price,
        LAST_UPDATED_BY = @p_last_updated_by,
        LAST_UPDATED_TIME = @p_last_updated_time,
        VERSION_NO = VERSION_NO+1,
        TRANSACTION_ID = @p_transaction_id
        
    WHERE COURSEEVENTID  = @o_courseeventid
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
  

IF OBJECT_ID( 'dbo.P_BIZ002_COURSE_EVENT_D', 'P' ) IS NOT NULL
    DROP  PROCEDURE  dbo.P_BIZ002_COURSE_EVENT_D
GO

CREATE PROCEDURE P_BIZ002_COURSE_EVENT_D
(
	@o_courseeventid nvarchar(36),
	@p_last_updated_by nvarchar(256),
	@p_last_updated_time datetime,
	@o_version_no int,
	@p_transaction_id varchar(50)
)
AS

/*
Module  : 
Author  : SQL Generator
Date    : 22-02-2017
Desc    : Delete records from T_BIZ002_COURSE_EVENT
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
    UPDATE T_BIZ002_COURSE_EVENT
	  SET LAST_UPDATED_BY = @p_last_updated_by,
        LAST_UPDATED_TIME = @p_last_updated_time,
        TRANSACTION_ID = @p_transaction_id
        
    WHERE COURSEEVENTID  = @o_courseeventid
    AND VERSION_NO  = @o_version_no
    ;

    DELETE FROM T_BIZ002_COURSE_EVENT
    WHERE COURSEEVENTID  = @o_courseeventid
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
  

IF OBJECT_ID( 'dbo.P_BIZ002_COURSE_EVENT_S', 'P' ) IS NOT NULL
  DROP  PROCEDURE  dbo.P_BIZ002_COURSE_EVENT_S
GO

CREATE PROCEDURE P_BIZ002_COURSE_EVENT_S
(
  @p_courseeventid nvarchar(36),
  @p_courseid nvarchar(36),
  @p_schedule nvarchar(500),
  @p_location nvarchar(500),
  @p_price nvarchar(50),
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
Date    : 22-02-2017
Desc    : Retrieves records from T_BIZ002_COURSE_EVENT
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
    FROM T_BIZ002_COURSE_EVENT t
    WHERE COURSEEVENTID  = @p_courseeventid
    AND COURSEID  = @p_courseid
    AND SCHEDULE  = @p_schedule
    AND LOCATION  = @p_location
    AND PRICE  = @p_price
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
  

IF OBJECT_ID( 'dbo.P_BIZ001_COURSE_I', 'P' ) IS NOT NULL
    DROP  PROCEDURE  dbo.P_BIZ001_COURSE_I
GO

CREATE PROCEDURE P_BIZ001_COURSE_I
(
  @p_courseid nvarchar(36),
  @p_userid nvarchar(36),
  @p_course_name nvarchar(66),
  @p_course_detail nvarchar(2000),
  @p_course_imagepath nvarchar(100),
  @p_course_filename nvarchar(100),
  @p_created_by nvarchar(256),
  @p_created_time datetime,
  @p_transaction_id varchar(50)
)

AS
	
/*
Module  : 
Author  : SQL Generator
Date    : 22-02-2017
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
      COURSE_IMAGEPATH,
      COURSE_FILENAME,
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
	  @p_course_imagepath,
	  @p_course_filename,
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
	@p_course_imagepath nvarchar(100),
	@p_course_filename nvarchar(100),
	@p_last_updated_by nvarchar(256),
	@p_last_updated_time datetime,
	@o_version_no int,
	@p_transaction_id varchar(50)
)

AS
	
/*
Module  : 
Author  : SQL Generator
Date    : 22-02-2017
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
        COURSE_IMAGEPATH = @p_course_imagepath,
        COURSE_FILENAME = @p_course_filename,
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
Date    : 22-02-2017
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
  @p_course_imagepath nvarchar(100),
  @p_course_filename nvarchar(100),
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
Date    : 22-02-2017
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
    AND COURSE_IMAGEPATH  = @p_course_imagepath
    AND COURSE_FILENAME  = @p_course_filename
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
  
