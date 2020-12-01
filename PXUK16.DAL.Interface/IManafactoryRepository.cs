using System;
using PXUK16.Domain.Response.Manafactory;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using PXUK16.Domain.Request.Manafactory;
namespace PXUK16.DAL.Interface
{
    public interface IManafactoryRepository
    {
        Task<IEnumerable<Manafactory>> Gets();

        Task<CreateManafactoryResult> CreateManafactory(CreateManafactoryRequest request);
        Task<UpdateManafactoryResult> UpdateManafactory(UpdateManafactoryRequest request);
        Task<DeleteManufactoryResult> DeleteManufactory(DeleteManufactoryRequest request);
    }
}