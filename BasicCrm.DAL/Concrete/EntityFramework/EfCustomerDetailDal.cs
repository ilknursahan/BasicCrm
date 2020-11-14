using BasicCrm.Core.DataAccess.Entityframework;
using BasicCrm.DAL.Abstract;
using BasicCrm.Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Text;

namespace BasicCrm.DAL.Concrete.EntityFramework
{
   public class EfCustomerDetailDal : EfEntityRepositoryBase<CustomerDetail, BasicCrmContext>, ICustomerDetailDal
    {
    }
}
