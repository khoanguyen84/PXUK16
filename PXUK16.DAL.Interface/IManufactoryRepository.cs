using PXUK16.Domain.Response.Category;
using System;
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
