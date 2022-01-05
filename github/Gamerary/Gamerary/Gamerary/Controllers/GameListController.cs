using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Gamerary.Models;

namespace Gamerary.Controllers
{
    [Authorize]
    public class GameListController : Controller
    {

        private dbEntities db = new dbEntities();

        // GET: GameList

        public ActionResult Index(int? id)
        {
            var games = db.GameLists.Include(g => g.Game).Include(g => g.UserAccount);
            if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                GameList ua = db.GameLists.Find(id);
                if (ua == null)
                {
                    return HttpNotFound();
                }
            return View(games.ToList());
        }

        // GET: GameList/Create
        public ActionResult Create()
        {
            ViewBag.uAccountID = new SelectList(db.UserAccounts, "uAccountID", "uEMail").Where(p=>p.Text == User.Identity.Name);
            ViewBag.gameID = new SelectList(db.Games, "gameID", "gameName");
            return View();
        }

        // POST: GameList/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "gameListID,uAccountID,gameID")] GameList gameList)
        {
            if (ModelState.IsValid)
            {
                db.GameLists.Add(gameList);
                db.SaveChanges();
                return RedirectToAction("Index/1");
            }

            ViewBag.uAccountID = new SelectList(db.UserAccounts, "uAccountID", "uEMail", gameList.uAccountID);
            ViewBag.gameID = new SelectList(db.Games, "gameID", "gameName", gameList.gameID);
            return View(gameList);
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
