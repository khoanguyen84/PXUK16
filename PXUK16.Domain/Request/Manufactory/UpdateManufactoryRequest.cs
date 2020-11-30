using System;
using System.Collections.Generic;
using System.Text;

namespace PXUK16.Domain.Request.Manufactory
{
    public class UpdateManufactoryRequest
    {
        public int ManufactoryId { get; set; }
        public string ManufactoryName { get; set; }
    }
}
