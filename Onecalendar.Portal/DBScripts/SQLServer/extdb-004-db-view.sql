IF OBJECT_ID( 'dbo.AVAIABLE_COURSE', 'V' ) IS NOT NULL
  DROP  VIEW  dbo.AVAIABLE_COURSE
GO
IF OBJECT_ID( 'dbo.AVAIABLE_COURSE_EVENT', 'V' ) IS NOT NULL
  DROP  VIEW  dbo.AVAIABLE_COURSE_EVENT
GO
--drop view dbo.[AVAIABLE_COURSE];
CREATE VIEW [dbo].[AVAIABLE_COURSE]
as
select 
	  t.COURSEID,
      t.USERID,
      t.COURSE_NAME,
      t.COURSE_DETAIL,
      t.COURSE_IMAGEPATH,
      t.COURSE_FILENAME,
	  t.COURSE_TAG,
	  t.STATUS,
	  t.COURSE_REG_URL,
      t.CREATED_BY,
      t.CREATED_TIME,
      t.LAST_UPDATED_BY,
      t.LAST_UPDATED_TIME,
      t.VERSION_NO,
      t.TRANSACTION_ID,
	  'P' as Source
from T_BIZ001_COURSE t
UNION
select CONVERT(nvarchar, EventID),
 ISNULL(Owner, ''), 
 SUBSTRING(Title, 0, CHARINDEX('(', Title)), 
 Title, 
 null, 
 null,
 null,
 'A', 
 null,  
 ISNULL(CreatedBy, ''), 
 ISNULL(CreatedDate, ''), 
 ISNULL(ModifiedBy, ''), 
 ISNULL(ModifiedDate, ''), 
 '', 
 NEWID(),
 'T' as Source
		  from [tms3.iss.calendarone.com].[dbo].[EMS_EventDetail] TMS
		  where TMS.ACTION_TYPE <> 'DELETED'
UNION
SELECT CONVERT(nvarchar(50), [UniqueID]),
	null,
	name, 
	name, 
	null,
	null,
	null,
	'A',
	null,
	null,
	null,
	null,
	null,
	 '', 
 NEWID(),
 'O' as Source
FROM [oms.lp.calendarone.com_Client].[dbo].[ProgramSession];
GO
-- your join logic goes here

CREATE VIEW [dbo].[AVAIABLE_COURSE_EVENT]
as
SELECT distinct
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
    FROM T_BIZ002_COURSE_EVENT t
