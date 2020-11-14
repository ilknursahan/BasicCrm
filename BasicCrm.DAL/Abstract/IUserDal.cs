using BasicCrm.Core.DataAccess;
using BasicCrm.Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Text;

namespace BasicCrm.DAL.Abstract
{
   public interface IUserDal: IEntityRepository<User>
    {
    }
}
