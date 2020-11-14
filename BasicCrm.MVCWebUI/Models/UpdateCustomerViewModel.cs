using BasicCrm.Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BasicCrm.MVCWebUI.Models
{
    public class UpdateCustomerViewModel
    {
        public Customer Customer { get; set; }
        public List<Customer> Customers { get; set; }
    }
}
