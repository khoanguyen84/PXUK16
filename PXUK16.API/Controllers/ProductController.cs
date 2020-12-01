using Microsoft.AspNetCore.Mvc;
using PXUK16.BAL.Interface;
using PXUK16.DAL.Interface;
using PXUK16.Domain.Request.Product;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PXUK16.API.Controllers
{
    [ApiController]
    public class ProductController : ControllerBase
    {
        private readonly IProductService productService;
        public ProductController(IProductService productService)
        {
            this.productService = productService;
        }

        [HttpGet]
        [Route("/api/product/gets")]
        public async Task<OkObjectResult> Gets()
        {
            return Ok(await productService.Gets());
        }

        [HttpPost]
        [Route("/api/product/create")]
        public async Task<OkObjectResult> Create(CreateProductRequest request)
        {
            return Ok(await productService.CreateProduct(request));
        }
    }
}
