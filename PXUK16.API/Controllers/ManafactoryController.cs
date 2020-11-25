﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PXUK16.BAL.Interface;

namespace PXUK16.API.Controllers
{
    [ApiController]
    public class ManafactoryController : ControllerBase
    {
        private readonly IManafactoryService manafactoryService;

        public ManafactoryController(IManafactoryService manafactoryService)
        {
            this.manafactoryService = manafactoryService;
        }
        [HttpGet]
        [Route("/api/manafactory/gets")]
        public async Task<OkObjectResult> Gets()
        {
            return Ok(await manafactoryService.Gets());
        }

    }
}
