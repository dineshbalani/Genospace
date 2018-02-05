using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.Web;

namespace PCSIDAM.Models
{
    public class MechanismMolecular    
    {
        public int id { get; set; }
        public String name { get; set; }
        public List<Medicine> medicine {get; set;}        
    }

}
