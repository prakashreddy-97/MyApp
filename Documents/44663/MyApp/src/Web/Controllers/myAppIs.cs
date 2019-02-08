using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Web.Models;

namespace Web.Controllers
{
    public class myAppIs : Controller
    {
        public IActionResult showText()
        {
            return Content("Hey, how are you?");
        }

        public IActionResult showJson()
        {
            return Json(new
            {
                name = "Prakash Reddy"
            });
        }

        public IActionResult showHtml()
        {
            var v = "<!DOCTYPE HTML><html><head>Amazing! Zing Zing!!</head><body>Hey, it's working!</body></html>";
            return Content(v, "text/html");
        }

        public IActionResult AppC()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
