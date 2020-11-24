using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace PXUK16.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CatetoryController : ControllerBase
    {
        public OkObjectResult Gets()
        {
            return Ok(new Object());
        }
    }
}
