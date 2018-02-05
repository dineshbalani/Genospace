using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Configuration;
using System.Net;
using System.Xml;
using System.Web;


namespace com.PCSIDAM.DirectoryHelper
{
    public class CommonFunctions
    {
        public static String fGetValueByNode(XmlDocument doc, String nodeV)
        {
            foreach (XmlNode node in doc.DocumentElement.ChildNodes)
            {
                string text = node.InnerText; //or loop through its children as well
                if (node.Name.Equals(nodeV))
                {
                    return text;
                }
            }
            return null;
        }

        public static string[] getColumnNames(string query)
        {
            DataBase db = new DataBase();
            string[] result = db.getColumnsName(db.connection, query);
            return result;
        }
        
        public static List<List<object>> getResultFromTable(string query)
        {
            DataBase db = new DataBase();
            List<List<object>> result = db.getResultsFromSqlDb(db.connection, query);
            return result;
        }
        

    }
}
