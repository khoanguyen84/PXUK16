using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PXUK16.BAL.Interface;
using PXUK16.Domain.Request.Category;
using PXUK16.Domain.Request.Manafactory;

namespace PXUK16.API.Controllers
{
    [Route("api/[controller]")]
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

        [HttpPost]
        [Route("/api/manufactory/create")]
        public async Task<OkObjectResult> Create(CreateManufactoryRequest request)
        {
            return Ok(await manufactoryService.CreateManufactory(request));
        }

        [HttpPost]
        [Route("/api/manufactory/Update")]
        public async Task<OkObjectResult> Update(UpdateManufactoryRequest request)
        {
            return Ok(await manufactoryService.UpdateManufactory(request));
        }

        [HttpDelete]
        [Route("/api/manufactory/Delete")]
        public async Task<OkObjectResult> Delete(DeleteManufactoryRequest request)
        {
            return Ok(await manufactoryService.DeleteManufactory(request));
        }
    }
}
