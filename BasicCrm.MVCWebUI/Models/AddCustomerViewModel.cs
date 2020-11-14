using BasicCrm.Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BasicCrm.MVCWebUI.Models
{
    public class AddCustomerViewModel
    {
        public List<Customer> Customers { get; set; }

        public List<CustomerDetail> CustomerDetails { get; set; }
    }
}
