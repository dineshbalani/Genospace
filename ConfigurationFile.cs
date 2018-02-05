using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;

namespace com.PCSIDAM.DirectoryHelper
{
    public class ConfigurationFile
    {
        public static XmlDocument sConfigurationFileData;
        static ConfigurationFile()
        {
            //sConfigurationFileData = CommonFunctions.fLoadXML(CommonFunctions.fReadFile("C:\\PCSIDAM\\Configurations.xml"));
            sConfigurationFileData = CommonFunctions.fLoadXML(CommonFunctions.fReadFile(AppDomain.CurrentDomain.BaseDirectory + "\\Configurations.xml"));
        }
    }
}
