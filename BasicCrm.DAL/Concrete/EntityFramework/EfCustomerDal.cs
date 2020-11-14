using BasicCrm.Core.DataAccess.Entityframework;
using BasicCrm.DAL.Abstract;
using BasicCrm.Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;

namespace BasicCrm.DAL.Concrete.EntityFramework
{
    public class EfCustomerDal : EfEntityRepositoryBase<Customer, BasicCrmContext>, ICustomerDal
    {
      
    }
}
