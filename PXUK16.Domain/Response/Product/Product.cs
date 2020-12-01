using System;
using System.Collections.Generic;
using System.Text;

namespace PXUK16.Domain.Response.Product
{
    public class Product
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public int CategoryId { get; set; }
        public int ManufactoryId { get; set; }
    }
}
