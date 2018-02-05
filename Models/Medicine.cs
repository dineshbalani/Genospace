using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.Web;

namespace PCSIDAM.Models
{
    public class Medicine    
    {
        public int id { get; set; }
        public string name{get;set;}
        public List<String> namesCode { get; set; }
        public List<String> namesBrand { get; set; }
        public List<String> namesGeneric { get; set; }
        public List<MechanismMolecular> mechanisnMolecular { get; set; }
        public List<DevelopmentSummary> developmentSummary { get; set; }
    }

}
