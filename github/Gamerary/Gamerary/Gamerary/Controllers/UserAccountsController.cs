using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Security;
using Gamerary.Models;

namespace Gamerary.Controllers
{
    public class UserAccountsController : Controller
    {
        private dbEntities db = new dbEntities();
        // GET: UserAccounts
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(UserAccount model)
        {
            using (var context = new dbEntities())
            {
                bool isValid = context.UserAccounts.Any(x => x.uEMail == model.uEMail && x.uPasswrd == model.uPasswrd);
                if (isValid)
                {
                    FormsAuthentication.SetAuthCookie(model.uEMail, false);
                    return RedirectToAction("uIndex", "Game");
                }
                ModelState.AddModelError("", "Geçersiz bilgi!");
                return View();
            }

        } 

        // GET: UserAccounts/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: UserAccounts/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Create(UserAccount model)
        {
            using (var context = new dbEntities())
            {
                if (db.UserAccounts.Any(x => x.uEMail == model.uEMail))
                {
                    ModelState.AddModelError("", "E-mail sistemde zaten kayıtlı!");
                    return View("Create", model);
                }
                context.UserAccounts.Add(model);
                context.SaveChanges();
            }
            ModelState.Clear();
            return RedirectToAction("Login");
        }
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Login", "UserAccounts");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
