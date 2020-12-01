using System;
using System.Collections.Generic;
using System.Text;

namespace PXUK16.Domain.Request.Product
{
    public class CreateProductRequest
    {
        public string ProductName { get; set; }
        public int CategoryId { get; set; }
        public int ManufactoryId { get; set; }
    }
}
