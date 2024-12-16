using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using urlShortener_eb.Models;

namespace urlShortener_eb.Controllers
{
    public class urlshortenerController : Controller
    {
        private us_eraEntities db = new us_eraEntities();

        public ActionResult Index()
        {
            var viewModel = new urlShortenerViewModel
            {
                UrlShortener = new urlshortener_history(),
                UrlShortenerList = db.urlshortener_history.ToList()
            };
            return View(viewModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(urlShortenerViewModel viewModel)
        {
            if (ModelState.IsValid)
            {
                string shortLink = GenerateShortLink(viewModel.UrlShortener.previous_url);
                viewModel.UrlShortener.shortened_url = shortLink;

                if (int.TryParse(viewModel.UrlShortener.expirate_time, out int expirationMinutes))
                {
                    viewModel.UrlShortener.expiration_time = DateTime.Now.AddMinutes(expirationMinutes);
                }
                else
                {
                    viewModel.UrlShortener.expiration_time = null;
                }
                viewModel.UrlShortener.click_count = 0;
                db.urlshortener_history.Add(viewModel.UrlShortener);
                await db.SaveChangesAsync();

                return RedirectToAction("Index");
            }

            viewModel.UrlShortenerList = await db.urlshortener_history.ToListAsync();
            return View(viewModel);
        }

        private string GenerateShortLink(string originalUrl)
        {
            const string baseUrl = "https://short.link/";

            Uri uri = new Uri(originalUrl);
            string[] pathSegments = uri.AbsolutePath.Trim('/').Split('/');

            string number = string.Empty;
            string letters = string.Empty;

            string lastSegment = pathSegments[pathSegments.Length - 1];
            foreach (char c in lastSegment)
            {
                if (char.IsDigit(c))
                {
                    number = c.ToString();
                    break;
                }
            }

            string part1 = pathSegments.Length > 0 && pathSegments[0].Length >= 3
                            ? pathSegments[0].Substring(0, 3)
                            : pathSegments.Length > 0 ? pathSegments[0] : "";

            string part2 = pathSegments.Length > 2 && pathSegments[2].Length >= 2
                            ? pathSegments[2].Substring(0, 2)
                            : "";

            int substringLength = Math.Min(5 - number.Length, part1.Length + part2.Length);
            letters = $"{part1}{part2}".Substring(0, substringLength);

            return $"{baseUrl}{number}{letters}";
        }

        public ActionResult Redirect(int id)
        {
            var urlRecord = db.urlshortener_history.Find(id);

            if (urlRecord != null)
            {
                if (urlRecord.expiration_time.HasValue && urlRecord.expiration_time.Value < DateTime.Now)
                {
                    return new HttpStatusCodeResult(204);
                }

                urlRecord.click_count = (urlRecord.click_count ?? 0) + 1;
                db.SaveChanges();

                return Redirect(urlRecord.previous_url);
            }

            return HttpNotFound();
        }
        public ActionResult Delete(int? id)
        {
            urlshortener_history urlshortener_history = db.urlshortener_history.Find(id);
            db.urlshortener_history.Remove(urlshortener_history);
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