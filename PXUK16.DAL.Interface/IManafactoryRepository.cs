using System;
using PXUK16.Domain.Response.Manafactory;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace PXUK16.DAL.Interface
{
    public interface IManafactoryRepository
    {
        Task<IEnumerable<Manafactory>> Gets();
    }
}