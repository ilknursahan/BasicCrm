using BasicCrm.Core.DataAccess.Entityframework;
using BasicCrm.Core.Entities;
using BasicCrm.DAL.Abstract;
using BasicCrm.Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;

namespace BasicCrm.DAL.Concrete.EntityFramework
{
    public class EfUserDal : EfEntityRepositoryBase<User, BasicCrmContext>, IUserDal
    {
       
    }
}
