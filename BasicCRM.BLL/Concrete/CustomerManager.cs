using BasicCrm.BLL.Abstract;
using BasicCrm.DAL.Abstract;
using BasicCrm.DAL.Concrete.EntityFramework;
using BasicCrm.Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Text;

namespace BasicCrm.BLL.Concrete
{
    public class CustomerManager : ICustomerService

    {
        private ICustomerDal _customerDAL;

        public CustomerManager(ICustomerDal customerDAL)
        {
            _customerDAL = customerDAL;
        }
        public void Add(Customer customer)
        {
            _customerDAL.Add(customer);
        }

        public void Delete(Customer customer)
        {
            _customerDAL.Delete(customer);
        }

        public List<Customer> GetList()
        {
           return _customerDAL.GetList();
        }
        public Customer Get(int id)
        {
            return _customerDAL.Get(x=>x.CustomerID==id);
        }

        public void Update(Customer customer)
        {
            _customerDAL.Update(customer);
        }
    }
}
