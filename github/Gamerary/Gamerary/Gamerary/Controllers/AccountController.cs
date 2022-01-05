using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Gamerary.Models;
using System.Web.Security;
namespace Gamerary.Controllers
{
    public class AccountController : Controller
    {
        // GET: Account
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(Account model)
        {
            using(var context = new dbEntities())
            {
                bool isValid = context.Accounts.Any(x=>x.eMail == model.eMail && x.passwrd == model.passwrd);
                if (isValid)
                {
                    FormsAuthentication.SetAuthCookie(model.eMail, false);
                    return RedirectToAction("Index", "Game");
                }
                ModelState.AddModelError("", "Geçersiz bilgi!");
                return View();
            }
            
        }
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Login","Account");
        }
    }
}