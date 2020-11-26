using PXUK16.Domain.Response.Manufactory;
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
