using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using System.Data.Entity.Validation;
using System.Xml.Xsl;
using System.Xml;
using System.Net;
using System.Text;

namespace Genospace.Controllers
{
    public class RequestController : Controller
    {
        public JsonResult suggestMedicines(String id)
        {
            string query = "SELECT id,namemain FROM Medicine where (namemain, "+id+")";
            string[] columnNames = CommonFunctions.getColumnNames(query);
            List<string> Headers = columnNames.ToList<String>();
            
            List<object> result = CommonFunctions.getResultFromTable(query);

            List<List<object>> mappingToColumnName = new List<List<object>>();
            foreach (string columnName in Headers)
            {
                List<object> mapping = new List<object> { columnName.ToUpper(), result[Headers.IndexOf(columnName.ToLower())].ToString() };
                mappingToColumnName.Add(mapping);
            }
            return Json(mappingToColumnName, JsonRequestBehavior.AllowGet);
        }
        public JsonResult suggestMechanism(String id)
        {            
            string query = "SELECT id,name FROM MechanismMolecurar where (name, "+id+")";
            string[] columnNames = CommonFunctions.getColumnNames(query);
            List<string> Headers = columnNames.ToList<String>();
            
            List<object> result = CommonFunctions.getResultFromTable(query);

            List<List<object>> mappingToColumnName = new List<List<object>>();
            foreach (string columnName in Headers)
            {
                List<object> mapping = new List<object> { columnName.ToUpper(), result[Headers.IndexOf(columnName.ToLower())].ToString() };
                mappingToColumnName.Add(mapping);
            }
            return Json(mappingToColumnName, JsonRequestBehavior.AllowGet);
        }

        public JsonResult getMedicineInfo(String id){
            Medicine med = new Medicine();
            string query1 = "SELECT * from Medicine_V where id="+id;
            
            string[] columnNames = CommonFunctions.getColumnNames(query);
            List<string> Headers = columnNames.ToList<String>();

            List<object> result = CommonFunctions.getResultFromTable(query);

            List<List<object>> mappingToColumnName = new List<List<object>>();
            foreach (string columnName in Headers)
            {
                List<object> mapping = new List<object> { columnName.ToUpper(), result[Headers.IndexOf(columnName.ToLower())].ToString() };
                mappingToColumnName.Add(mapping);
            }
            return Json(mappingToColumnName, JsonRequestBehavior.AllowGet);

        }

        public JsonResult getMechanismInfo(String id){
            MechanismMolecular mm = new MechanismMolecular();
            string query = "SELECT * Mechanism_V where id="+id;
            string[] columnNames = CommonFunctions.getColumnNames(query);
            List<string> Headers = columnNames.ToList<String>();
            
            List<List<object>> mappingToColumnName = new List<List<object>>();
            foreach (string columnName in Headers)
            {
                List<object> mapping = new List<object> { columnName.ToUpper(), result[Headers.IndexOf(columnName.ToLower())].ToString() };
                mappingToColumnName.Add(mapping);
            }
            return Json(mappingToColumnName, JsonRequestBehavior.AllowGet);
        }


    }
}















//   if ((req.RequestType == "Change") && (req.CCLItem == null) && (req.CCLItem == "non standard change"))
//   {
//       errors = "Standard Change requires CCL Item, please select one";
//       return Json(new { result = 0, message = errors }, "text/html");

//   }





//if ((req.RequestType == "Change") && (req.Attachment[0] == null) && (req.CCLItem != null) && (GetCCLItem2(req.CCLItem) == 1))
//{
//    errors = "Please don’t forget to download the CCL item and attach it";
//    return Json(new { result = 0, message = errors }, "text/html");
//}
//if ((req.RequestType == "Change") && (req.CCLItem != null) && (req.Attachment != null) && (req.Tier2 == "Code (Release)") && (req.CCLChanges == 0))
//{

//}

//if (System.Text.Encoding.UTF8.GetByteCount(req.Details) > 2000000000)
//{
//    errors = "The Details message is very long, kindly save it to word file and attach it in the attachment option";
//    return Json(new { result = 0, message = errors }, "text/html");
//}












// URL with KEY AND ACT
//if ((r.approverCode == key) && (act != ""))
//{
//    //if request has already been approved or rejected..dont reprocess

//    if (r.reqStatus != 0)
//    {
//        ViewBag.result = "This request has already been approved/rejected. No action is possible now.";
//        return View();
//    }
//    //Check whether he is valid approver by check is current alias against list of approvers
//    if (r.approverList != null)
//    {
//        if (!r.approverList.ToLower().Contains(info.alias.ToLower()))
//        {
//            ViewBag.result = "Only one of the Approvers can approve this request.";
//            return View();
//        }
//        else
//        {
//            //verfies that person approving is valid approver
//            validapprover = 1;
//        }
//    }
//}



/*
public ActionResult ViewRemedyTicket(string id)
{
  string serviceURL = "http://nlwsl790.ddns.slb.atosorigin-asp.com:8080/arsys/services/ARService?server=nlxsl718&webService=HPD_IncidentInterface_WS";
        WebRequest hw = WebRequest.Create(serviceURL);
        //HttpWebRequest hw = (HttpWebRequest)hw1;
        string postData1 = System.IO.File.ReadAllText(@"D:\Documents\Visual Studio 2013\Projects\RDY_AtosEmails1.1\request.txt");
        string postData = postData1.Replace("[[INNumber]]", id);

        byte[] byteArray = Encoding.UTF8.GetBytes(postData);
        //hw.UseDefaultCredentials = true;
        hw.Method = "POST";
        //hw.Accept = "gazip,deflate";
        hw.ContentType = "text/xml;charset=utf-8";
        hw.Headers.Add("SOAPAction", "urn:HPD_IncidentInterface_WS/HelpDesk_Query_Service");
        hw.ContentLength = byteArray.Length;
        ////hw.Host = "nlwsl790.ddns.slb.atosorigin-asp.com:8080";
        ////hw.Connection = "true";
        //hw.UserAgent = "Apache-HttpClient/4.1.1 (java 1.5)";
        //hw.Headers.Add("Host", "nlwsl790.ddns.slb.atosorigin-asp.com:8080");
        //hw.Headers.Add("Except", "100-continue");
        //hw.Headers.Add("User-Agent", "Apache-HttpClient/4.1.1 (java 1.5)");

        Stream dataStream = hw.GetRequestStream();
        dataStream.Write(byteArray, 0, byteArray.Length);
        dataStream.Close();

        WebResponse hr = hw.GetResponse();

        dataStream = hr.GetResponseStream();
        using (StreamReader reader = new StreamReader(dataStream))
        {
            string responseFromServer = reader.ReadToEnd();
            reader.Close();
            XmlDocument xmldoc = new XmlDocument();
            XmlNode contact;
            xmldoc.LoadXml(responseFromServer);
            List<string> nodenames = new List<string>();
            List<string> nodevalues = new List<string>();
            contact = xmldoc.FirstChild.NextSibling.FirstChild.FirstChild.FirstChild;
            nodenames.Add(contact.LocalName);
            nodevalues.Add(contact.InnerText);
            while (contact.NextSibling != null)
            {
                nodenames.Add(contact.NextSibling.LocalName);
                nodevalues.Add(contact.NextSibling.InnerText);
                contact = contact.NextSibling;
            }

            ViewBag.names = nodenames;
            ViewBag.nodevalues = nodevalues;

        }
        dataStream.Close();
}

*/
