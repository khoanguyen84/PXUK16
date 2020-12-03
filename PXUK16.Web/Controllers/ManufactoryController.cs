using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using PXUK16.Web.Models;

namespace PXUK16.Web.Controllers
{
    public class ManufactoryController : Controller
    {
       // private readonly ILogger<ManufactoryController> _logger;

       // public ManufactoryController(ILogger<ManufactoryController> logger)
       // {
          //  _logger = logger;
       // }

        public IActionResult Index()
        {
            return View();
        }

       

      //  [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
      //  public IActionResult Error()
      //  {
        //    return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
      //  }
    }
}
