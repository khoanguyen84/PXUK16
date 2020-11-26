using System;
using PXUK16.Domain.Response.Manufactory;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace PXUK16.DAL.Interface
{
    public interface IManufactoryRepository
    {
        Task<IEnumerable<Manufactory>> Gets();
    }
}
