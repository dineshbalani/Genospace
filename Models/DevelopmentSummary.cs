using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.Web;

namespace PCSIDAM.Models
{
    public class DevelopmentSummary    
    {
        public Condition cond { get; set; }
		public PhaseHighest ph { get; set; }
		public bool ConditionInActiveDevelopment { get; set; }
		public List<Organizations> organizations { get; set; }
		public List<AdministrationRoutes> administrationRoutes { get; set; }
    }

}
