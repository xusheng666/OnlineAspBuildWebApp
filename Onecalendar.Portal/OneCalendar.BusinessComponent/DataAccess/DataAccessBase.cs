using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Common;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data.Configuration;
using System.Reflection;
using System.Data;

namespace OneCalendar.BusinessComponent
{
    public class DataAccessBase : MarshalByRefObject
    {
        private InternetDbHelper _dbHelper;

        protected virtual InternetDbHelper Helper
        {
            get
            {
                if (_dbHelper == null)
                {
                    _dbHelper = new InternetDbHelper(databaseName);
                }
                return _dbHelper;
            }
        }
        private string databaseName = string.Empty;
        public DataAccessBase(string databaseName)
        {
            this.databaseName = databaseName;
        }

        public DataAccessBase()
            : this(((DatabaseSettings)(ConfigurationManager.GetSection(DatabaseSettings.SectionName))).DefaultDatabase)
            //: this(ConnectionStrings.ONECALENDARDATABASE)
        {

        }

        public void UpdateListTable(List<DataTable> datatable)
        {
            try
            {
                this.Helper.Update(datatable);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void UpdateTable(DataTable dt)
        {
            this.Helper.Update(dt);
        }

        public bool CommonCheckWithParameter(string SPName, params string[] queryParam)
        {
            bool isTrue = false;
            DbCommand command = Helper.BuildDbCommand(SPName);
            try
            {
                if (queryParam != null && queryParam.Length > 0)
                {
                    Helper.AssignParameterValues(command, queryParam);
                }
                Helper.ExecuteNonQuery(command);
                object obj = command.Parameters[Constants.COMMON_RET_NAME].Value;
                if (obj != DBNull.Value)
                {
                    isTrue = Convert.ToBoolean(obj);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return isTrue;
        }

        public void CommonExecuteWithParameter(string SPName, params string[] queryParam)
        {
            DbCommand command = Helper.BuildDbCommand(SPName);
            try
            {
                if (queryParam != null && queryParam.Length > 0)
                {
                    Helper.AssignParameterValues(command, queryParam);
                }
                Helper.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        // below is the general update method with dynamic parameters passed in up to 3
        public void UpdateSPWithParameters(string SPName, params string[] paramsArray)
        {
            if (paramsArray.Length == 0)
            {
                this.Helper.ExecuteNonQuery(SPName);
            }
            else if (paramsArray.Length == 1)
            {
                this.Helper.ExecuteNonQuery(SPName, paramsArray[0]);
            }
            else if (paramsArray.Length == 2)
            {
                this.Helper.ExecuteNonQuery(SPName, paramsArray[0], paramsArray[1]);
            }
            else if (paramsArray.Length == 3)
            {
                this.Helper.ExecuteNonQuery(SPName, paramsArray[0], paramsArray[1], paramsArray[2]);
            }
            else
            {
                throw new NotImplementedException("Parameters more than 3 is not implemented yet!");
            }
        }

        // below is the general query method with dynamic parameters passed in up to 3
        public DataTable QueryDataTableWithParameters(string SPName, params string[] paramsArray)
        {
            DataTable dt = new DataTable();
            if (paramsArray.Length == 0)
            {
                this.Helper.Fill(dt, SPName);
            }
            else if (paramsArray.Length == 1)
            {
                this.Helper.Fill(dt, SPName, paramsArray[0]);
            }
            else if (paramsArray.Length == 2)
            {
                this.Helper.Fill(dt, SPName, paramsArray[0], paramsArray[1]);
            }
            else if (paramsArray.Length == 3)
            {
                this.Helper.Fill(dt, SPName, paramsArray[0], paramsArray[1], paramsArray[2]);
            }
            else
            {
                throw new NotImplementedException("Parameters more than 3 is not implemented yet!");
            }
            return dt;
        }
    }
}
