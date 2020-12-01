using System;
using System.Collections.Generic;
using System.Text;

namespace PXUK16.Domain.Response.Product
{
    public class CreateProductResult
    {
        public int ProductId { get; set; }
        public int CategoryId { get; set; }
        public int ManufactoryId { get; set; }
        public string Message { get; set; }
    }
}
