using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NCS.IConnect.Helpers.Data;
using System.Data.Common;
using System.Data;
using NCS.IConnect.Transactions;

namespace OneCalendar.BusinessComponent
{
    public class InternetDbHelper
    {
        private readonly DbHelper _dbHelper;

        public InternetDbHelper()
        {
            _dbHelper = new DbHelper();
        }

        public InternetDbHelper(string databaseName)
        {
            _dbHelper = new DbHelper(databaseName);
        }

        public object ExecuteScalar(DbCommand dbCommand)
        {
            return _dbHelper.ExecuteScalar(dbCommand);
        }

        public object ExecuteScalar(string storedProcedureName, params object[] parameterValues)
        {
            return _dbHelper.ExecuteScalar(storedProcedureName, parameterValues);
        }

        public int ExecuteNonQuery(string storedProcedureName, params object[] parameterValues)
        {
            return _dbHelper.ExecuteNonQuery(storedProcedureName, parameterValues);
        }

        public int ExecuteNonQuery(DbCommand dbCommand)
        {
            return _dbHelper.ExecuteNonQuery(dbCommand);
        }

        public DbCommand BuildDbCommand(string storedProcedureName)
        {
            return _dbHelper.BuildDbCommand(storedProcedureName);
        }

        public CommandList BuildFillCommandList(DataSet dataSet, Dictionary<string, string> storedProcedureNames)
        {
            return _dbHelper.BuildFillCommandList(dataSet, storedProcedureNames);
        }

        public void Fill(DataSet dataSet, CommandList commandList)
        {
            try
            {
                _dbHelper.Fill(dataSet, commandList);
            }
            catch (ConstraintException)
            {
                throw;
            }
        }

        public void Fill(DataTable dataTable, DbCommand dbCommand)
        {
            try
            {
                _dbHelper.Fill(dataTable, dbCommand);
            }
            catch (ConstraintException)
            {
                throw;
            }

        }

        public void Fill(DataSet dataSet, string[] tableNames, string storedProcedureName,
                         params object[] parameterValues)
        {
            try
            {
                _dbHelper.Fill(dataSet, tableNames, storedProcedureName, parameterValues);
            }
            catch (ConstraintException)
            {
                throw;
            }
            
        }

        public void Fill(DataSet dataSet, string[] tableNames, DbCommand dbCommand)
        {
            try
            {
                _dbHelper.Fill(dataSet, tableNames, dbCommand);
            }
            catch (ConstraintException)
            {
                throw;
            }
        }

        public void Fill(DataTable dataTable, string storedProcedureName, params object[] parameterValues)
        {
            try
            {
                _dbHelper.Fill(dataTable, storedProcedureName, parameterValues);
            }
            catch (ConstraintException)
            {
                throw;
            }
        }


        public CommandList BuildUpdateCommandList(DataSet dataSet)
        {
            return _dbHelper.BuildUpdateCommandList(dataSet);
        }

        public CommandList BuildUpdateCommandList(DataTable dataTable)
        {
            return _dbHelper.BuildUpdateCommandList(dataTable);
        }

        public int Update(DataSet dataSet)
        {
            int iResult = 0;
            using (Transaction tran = new Transaction())
            {
                iResult = _dbHelper.Update(dataSet);
                tran.Complete();
                return iResult;
            }

        }

        public int Update(DataSet dataSet, bool acceptChangesAfterUpdated)
        {
            int iResult = 0;
            using (Transaction tran = new Transaction())
            {
                iResult = _dbHelper.Update(dataSet, acceptChangesAfterUpdated);
                tran.Complete();
                return iResult;
            }
        }

        public int Update(DataSet dataSet, CommandList commandList)
        {
            int iResult = 0;
            using (Transaction tran = new Transaction())
            {
                iResult = _dbHelper.Update(dataSet, commandList);
                tran.Complete();
                return iResult;
            }
        }

        public int Update(DataSet dataSet, CommandList commandList, bool acceptChangesAfterUpdated)
        {
            int iResult = 0;
            using (Transaction tran = new Transaction())
            {
                iResult = _dbHelper.Update(dataSet, commandList, acceptChangesAfterUpdated);
                tran.Complete();
                return iResult;
            }
        }

        public int Update(DataTable dataTable1, DataTable dataTable2)
        {
            int iResult = 0;
            using (Transaction tran = new Transaction())
            {
                iResult = _dbHelper.Update(dataTable1);
                iResult = _dbHelper.Update(dataTable2);
                tran.Complete();
                return iResult;
            }
        }

        public int Update(DataTable dataTable)
        {
            int iResult = 0;
            using (Transaction tran = new Transaction())
            {
                iResult = _dbHelper.Update(dataTable);
                tran.Complete();
                return iResult;
            }
        }
        public int Update(DataTable dataTable1, DataSet dataSet1)
        {
            int iResult = 0;
            using (Transaction transaction = new Transaction())
            {
                iResult = _dbHelper.Update(dataTable1);
                iResult = _dbHelper.Update(dataSet1);
                transaction.Complete();
            }
            return iResult;
        }
        public int Update(DataTable dataTable, bool acceptChangesAfterUpdated)
        {
            int iResult = 0;
            using (Transaction tran = new Transaction())
            {
                iResult = _dbHelper.Update(dataTable, acceptChangesAfterUpdated);
                tran.Complete();
                return iResult;
            }
        }

        public int Update(DataTable dataTable, CommandList commandList)
        {
            int iResult = 0;
            using (Transaction tran = new Transaction())
            {
                iResult = _dbHelper.Update(dataTable, commandList);
                tran.Complete();
                return iResult;
            }
        }

        public int Update(DataTable dataTable, CommandList commandList, bool acceptChangesAfterUpdated)
        {
            int iResult = 0;
            using (Transaction tran = new Transaction())
            {
                iResult = _dbHelper.Update(dataTable, commandList, acceptChangesAfterUpdated);
                tran.Complete();
                return iResult;
            }
        }

        public List<int> Update(List<DataTable> dataTable)
        {
            using (Transaction tran = new Transaction())
            {
                List<int> res = new List<int>();
                foreach (DataTable dt in dataTable)
                {
                    res.Add(_dbHelper.Update(dt));
                }
                tran.Complete();
                return res;
            }
        }
        public void ClearParameterCache()
        {
            _dbHelper.ClearParameterCache();
        }

        public void AssignParameterValues(DbCommand dbCommand, params object[] parameterValues)
        {
            _dbHelper.AssignParameterValues(dbCommand, parameterValues);
        }

        public object GetParameterValue(DbCommand dbCommand, string parameterName)
        {
            return _dbHelper.GetParameterValue(dbCommand, parameterName);
        }
    }
}
