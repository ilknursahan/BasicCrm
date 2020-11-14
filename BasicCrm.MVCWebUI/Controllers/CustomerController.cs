using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BasicCrm.BLL.Abstract;
using BasicCrm.DAL.Abstract;
using BasicCrm.DAL.Concrete.EntityFramework;
using BasicCrm.Entities.Concrete;
using BasicCrm.MVCWebUI.Models;
using Microsoft.AspNetCore.Mvc;

namespace BasicCrm.MVCWebUI.Controllers
{
    public class CustomerController : Controller
    {
        private ICustomerDal _customerDal;
        private ICustomerDetailDal _customerDetailDal;

        public CustomerController(ICustomerDal customerDal, ICustomerDetailDal customerDetailDal)
        {
            _customerDal = customerDal;
            _customerDetailDal = customerDetailDal;
        }
       
       
        public IActionResult Customers()
        {
            var model = new CustomerListViewModel
            {
                Customers = _customerDal.GetList()
            };
            return View(model);
        }
        public IActionResult AddCustomer()
        {
            
           var data = new AddCustomerViewModel
            {
                Customers = _customerDal.GetList(),
                CustomerDetails =_customerDetailDal.GetList()
            };
            
            
            return View(data);
        }

        [HttpPost]
        public IActionResult AddCustomer(Customer customer)
        {
             _customerDal.Add(customer);

            return RedirectToAction("customers");
        }

        public ActionResult UpdateCustomer(int id)
        {
            var data = new UpdateCustomerViewModel
            {
                Customers = _customerDal.GetList(),
                Customer =  _customerDal.Get(x=>x.CustomerID==id)
                
               
             };
            ViewBag.CustomerDetails = _customerDetailDal.GetList();



            return View(data);
        }

        public ActionResult CustomerDetail(int id)
        {
            var data = new CostumerDetailViewModel
            {
                Customers = _customerDal.GetList(),
                Customer = _customerDal.Get(x => x.CustomerID == id),
                //CustomerDetail= _customerDetailDal.Get(x=>x.CustomerDetailID==)


            };

            ViewBag.CustomerDetail = _customerDetailDal.Get(x=>x.CustomerDetailID==data.Customer.CustomerDetailID);


            return View(data);
        }
        [HttpPost]
        public IActionResult UpdateCustomer(Customer customer)
        {
            _customerDal.Update(customer);

            return RedirectToAction("customers");
        }

        public IActionResult RemoveCustomer(int id)
        {
            var customer = _customerDal.Get(x => x.CustomerID == id);


               _customerDal.Delete(customer);

            return RedirectToAction("customers");
        }

    }
}