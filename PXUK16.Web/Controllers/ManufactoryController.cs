﻿
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PXUK16.Web.Controllers
{
    public class Manufactory : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}