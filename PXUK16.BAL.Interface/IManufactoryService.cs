using PXUK16.Domain.Response.Category;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace PXUK16.BAL.Interface
{
    public interface IManufactoryService
    {
        Task<IEnumerable<Manufactory>> Gets();
    }
}
