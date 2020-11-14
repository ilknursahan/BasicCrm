using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using BasicCrm.DAL.Concrete.EntityFramework;
using BasicCrm.Entities.Concrete;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace BasicCrm.MVCWebUI.Controllers
{
    public class SecurityController : Controller
    {
        BasicCrmContext c = new BasicCrmContext();
       
        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }
        
        public async Task<IActionResult> Login(User user)
        {
            var data = c.Users.FirstOrDefault(x => x.UserName == user.UserName && x.Password == user.Password);

            if (data!=null)
            {
                var claims = new List<Claim>
                {
                    new Claim(ClaimTypes.Name,user.UserName)
                };
                var useridentity = new ClaimsIdentity(claims, "Security");
                ClaimsPrincipal principal = new ClaimsPrincipal(useridentity);
                await HttpContext.SignInAsync(principal);
                return RedirectToAction("Index", "Home");

            }
            return View();

        }
        public async Task<IActionResult> Logout()
        {
            await  HttpContext.SignOutAsync();
            return RedirectToAction("Login");
        }
  

    } }