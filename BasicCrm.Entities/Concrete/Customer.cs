using BasicCrm.Core.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace BasicCrm.Entities.Concrete
{
   public class Customer:IEntity
    {
        public int CustomerID { get; set; }
        public int CustomerDetailID { get; set; }
        public string CompanyName { get; set; }
        public string ContactName { get; set; }
        public string ContactTitle { get; set; }
        public string Address { get; set; }
        public string Country { get; set; }
        public string Mail { get; set; }
    }
}
