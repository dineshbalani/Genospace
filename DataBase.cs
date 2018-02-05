using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Xml;


namespace com.PCSIDAM.DirectoryHelper
{
    public class DataBase
    {
        public SqlConnection connection;
        public DataBase()
        {
            this.connection = makeConnection(CommonFunctions.fGetValueByNode(ConfigurationFile.sConfigurationFileData, "DBIP"), CommonFunctions.fGetValueByNode(ConfigurationFile.sConfigurationFileData, "DBPort"), CommonFunctions.fGetValueByNode(ConfigurationFile.sConfigurationFileData, "DBSchema"), CommonFunctions.fGetValueByNode(ConfigurationFile.sConfigurationFileData, "DBUserName"), CommonFunctions.fGetValueByNode(ConfigurationFile.sConfigurationFileData, "DBPassword"), "ADDataCollections");
        }

       
        public void closeConnection(String methodName)
        {
            //Log("DEBUG", "Closing database connection for method " + methodName);
            try
            {
                CommonFunctions.WriteInfoLog("Closing DB Conection - " + methodName);
                this.connection.Close();
                //Log("INFO", "Connection closed successfully for method " + methodName);
            }
            catch (Exception e)
            {
                //Log("ERROR", "Error while connecting to database :: " + e.Message);
                CommonFunctions.WriteErrorLog(e);
                throw e;
            }

        }

        public List<List<object>> getResultsFromSqlDb(SqlConnection conn, string query)
        {
            List<List<object>> resultSet = new List<List<object>>();
            //Log("INFO", "Select Query to be executed : " + query);
            try
            {
                SqlCommand command = new SqlCommand(query, conn);
                CommonFunctions.WriteInfoLog("Query: " + query);
                SqlDataReader reader = command.ExecuteReader();
                List<object> rowSet = null;
                int colCounter;
                while (reader.Read())
                {
                    colCounter = 0;
                    rowSet = new List<object>();
                    while (colCounter < reader.FieldCount)
                    {
                        rowSet.Add(reader.GetValue(colCounter));
                        colCounter++;
                    }
                    resultSet.Add(rowSet);
                }
                reader.Close();
            }
            catch (Exception e)
            {
                CommonFunctions.WriteErrorLog(e);
            }
            string resultStr = "";
            foreach (List<object> row in resultSet)
            {
                if (resultStr.Length > 0)
                {
                    resultStr += "\n";
                }
                foreach (object cell in row)
                {
                    if (resultStr.Length > 0)
                    {
                        resultStr += "," + cell;
                    }
                    else
                    {
                        resultStr += cell;
                    }
                }
            }
            CommonFunctions.WriteInfoLog("Result for the Query is : " + resultStr);

            return resultSet;
        }

        public SqlConnection makeConnection(String host, String port, String databaseName, String username, String password, String methodName)
        {
            //Log("DEBUG", "Trying to establish connection to the database for method " + methodName);
            //Log("DEBUG", "retryCount = " + iRetryCount + " connect timout= " + iConnectionTimeout);
            //Log("DEBUG", "Parameters host : " + host + " port : "+port + " serviceName : "+serviceName + " username : "+username +" password : "+password);  
            this.connection = new SqlConnection();
            try
            {
                String connString = "Data Source=" + host + "," + port + ";Initial Catalog=" + databaseName + ";User ID=" + username + ";Password=" + password+ "; Integrated Security=true";

                connection.ConnectionString = connString;

                connection.Open();
                //Log("INFO", "Successfully connected to the database for method " + methodName);
            }
            catch (Exception e)
            {
                CommonFunctions.WriteErrorLog(e);
                //Log("ERROR", "Error while connecting to database for method " + methodName + " :: " + e.Message);
                throw e;
            }
            return this.connection;
        }

        public int setResultsToSqlDb(SqlConnection conn, string query)
        {
            int rowsEffected = -1;
            CommonFunctions.WriteInfoLog("Query : " + query);
            //Log("INFO", "Query to be executed : " + query);
            try
            {
                SqlCommand command = conn.CreateCommand();
                command.CommandText = query;
                rowsEffected = command.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                CommonFunctions.WriteErrorLog(e);
            }
            //Log("INFO", "Number of rows effected by query are : " + rowsEffected);
            return rowsEffected;
        }

       
        public void fDeleteENTYExisting(DataBase db, String sEntity, String sApplication)
        {

            List<List<object>> results = new List<List<object>>();
            if (sEntity.ToString().ToLower().Equals("useraccount"))
            {
                db.setResultsToSqlDb(db.connection, "delete from USER_ACCOUNT_MAPPING_T where APPLICATION_ID = (select APPLICATION_ID from APPLICATION_T where APPLICATION_NAME = '" + sApplication.ToString() + "')");
            }
            else if (sEntity.ToString().ToLower().Equals("entacc"))
            {
                db.setResultsToSqlDb(db.connection, "delete from ACCOUNT_ENTITLEMENT_MAPPING_T where ENTITLEMENT_ID IN (Select ENTITLEMENT_ID from ENTITLEMENT_T where APPLICATION_ID = (Select APPLICATION_ID from APPLICATION_T where APPLICATION_NAME = '" + sApplication.ToString() + "'))");
            }

        }

        public string[] getColumnsName(SqlConnection sConn, String sQuery)
        {
            List<string> listacolumnas = new List<string>();
            using (SqlConnection connection = sConn)
            using (SqlCommand command = connection.CreateCommand())
            {
                command.CommandText = sQuery.ToUpper().Replace("SELECT", "SELECT TOP 1").ToString();
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        DataTable table = reader.GetSchemaTable();

                        foreach (DataRow myField in table.Rows)
                        {
                            //For each property of the field...
                            foreach (DataColumn myProperty in table.Columns)
                            {
                                //Display the field name and value.
                                if (myProperty.ColumnName.ToString().ToLower().Equals("columnname"))
                                {
                                    listacolumnas.Add(myField[myProperty].ToString().ToLower());
                                }
                            }
                        }
                    }
                }
            }
            return listacolumnas.ToArray();
        }
    }
}
