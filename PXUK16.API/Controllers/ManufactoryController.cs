using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PXUK16.BAL.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PXUK16.API.Controllers
{
    [ApiController]
    public class ManufactoryController : ControllerBase
    {
        private readonly IManufactoryService manufactoryService;

        public ManufactoryController(IManufactoryService manufactoryService)
        {
            this.manufactoryService = manufactoryService;
        }
        [HttpGet]
        [Route("/api/manufactory/gets")]
        public async Task<OkObjectResult> Gets()
        {
            return Ok(await manufactoryService.Gets());
        }
    }
}
