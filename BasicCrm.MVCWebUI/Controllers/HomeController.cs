using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BasicCrm.DAL.Abstract;
using BasicCrm.MVCWebUI.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace BasicCrm.MVCWebUI.Controllers
{
    public class HomeController : Controller
    {

        private ICustomerDal _customerDal;

        private IUserDal _userDal;

        public HomeController(ICustomerDal customerDal, IUserDal userDal)
        {
            _customerDal = customerDal;
            _userDal = userDal;
           
        }
        [Authorize]
        public IActionResult Index()
        {

            var model = new CustomerListViewModel
            {
                Customers = _customerDal.GetList()
            };

            @ViewBag.UsersCount = _userDal.GetList().Count();
            return View(model);

         
          
        }
        
       



       
    }
}