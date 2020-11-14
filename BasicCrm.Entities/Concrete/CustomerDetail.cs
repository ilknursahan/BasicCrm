using BasicCrm.Core.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace BasicCrm.Entities.Concrete
{
  public  class CustomerDetail:IEntity
    {
        public int CustomerDetailID { get; set; }

        public  string CustomerType { get; set; }

    }
}
