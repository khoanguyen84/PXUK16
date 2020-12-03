using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace PXUK16.Web.Controllers
{
    public class ManufactoryController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
