using System;
using System.Collections.Generic;
using System.Text;

namespace PXUK16.Domain.Request.Category
{
   public class UpdateCategoryRequest
    {
        public int CategoryId { get; set; }
        public string CategoryName { get; set; }
    }
}
