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
    public class GameController : Controller
    {
        private dbEntities db = new dbEntities();

        // GET: Game
        public ActionResult Index()
        {
            var games = db.Games.Include(g => g.GamePlatform).Include(g => g.Genre);
            return View(games.ToList());
        }
        public ActionResult uIndex()
        {
            var games = db.Games.Include(g => g.GamePlatform).Include(g => g.Genre);
            return View(games.ToList());
        }

        // GET: Game/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Game game = db.Games.Find(id);
            if (game == null)
            {
                return HttpNotFound();
            }
            return View(game);
        }

        public ActionResult uDetails(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Game game = db.Games.Find(id);
            if (game == null)
            {
                return HttpNotFound();
            }
            return View(game);
        }
        // GET: Game/Create
        public ActionResult Create()
        {
            ViewBag.platformID = new SelectList(db.GamePlatforms, "platformID", "platformName");
            ViewBag.genreID = new SelectList(db.Genres, "genreID", "genre1");
            return View();
        }

        // POST: Game/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "gameID,platformID,genreID,gameName,publisherName,developerName,releaseDate,price,rating,review,content")] Game game)
        {
            if (ModelState.IsValid)
            {
                db.Games.Add(game);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.platformID = new SelectList(db.GamePlatforms, "platformID", "platformName", game.platformID);
            ViewBag.genreID = new SelectList(db.Genres, "genreID", "genre1", game.genreID);
            return View(game);
        }

        // GET: Game/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Game game = db.Games.Find(id);
            if (game == null)
            {
                return HttpNotFound();
            }
            ViewBag.platformID = new SelectList(db.GamePlatforms, "platformID", "platformName", game.platformID);
            ViewBag.genreID = new SelectList(db.Genres, "genreID", "genre1", game.genreID);
            return View(game);
        }

        // POST: Game/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "gameID,platformID,genreID,gameName,publisherName,developerName,releaseDate,price,rating,review,content")] Game game)
        {
            if (ModelState.IsValid)
            {
                db.Entry(game).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.platformID = new SelectList(db.GamePlatforms, "platformID", "platformName", game.platformID);
            ViewBag.genreID = new SelectList(db.Genres, "genreID", "genre1", game.genreID);
            return View(game);
        }

        // GET: Game/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Game game = db.Games.Find(id);
            if (game == null)
            {
                return HttpNotFound();
            }
            return View(game);
        }

        // POST: Game/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Game game = db.Games.Find(id);
            db.Games.Remove(game);
            db.SaveChanges();
            return RedirectToAction("Index");
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
