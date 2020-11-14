using BasicCrm.Core.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace BasicCrm.Entities.Concrete
{
   public class User:IEntity
    {
        public int UserID { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
    }

}
