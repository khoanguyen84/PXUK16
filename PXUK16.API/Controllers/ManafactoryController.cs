using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PXUK16.BAL.Interface;
using PXUK16.Domain.Request.Manafactory;

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

        [HttpPost]
        [Route("/api/manafactory/create")]
        public async Task<OkObjectResult> Create(CreateManafactoryRequest request)
        {
            return Ok(await manafactoryService.CreateManafactory(request));
        }

        [HttpPost]
        [Route("/api/manafactory/update")]
        public async Task<OkObjectResult> Update(UpdateManafactoryRequest request)
        {
            return Ok(await manafactoryService.UpdateManafactory(request));
        }

        [HttpDelete]
        [Route("/api/manafactory/delete")]
        public async Task<OkObjectResult> Delete(DeleteManafactoryRequest request)
        {
            return Ok(await manafactoryService.DeleteManafactory(request));
        }
    }
}
