using System;
using PXUK16.Domain.Response.Manufactory;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using PXUK16.Domain.Request.Category;
using PXUK16.Domain.Request.Manafactory;

namespace PXUK16.DAL.Interface
{
    public interface IManufactoryRepository
    {
        Task<IEnumerable<Manufactory>> Gets();

        Task<CreateManufactoryResult> CreateManufactory(CreateManufactoryRequest request);

        Task<UpdateManufactoryResult> UpdateManufactory(UpdateManufactoryRequest request);

        Task<DeleteManufactoryResult> DeleteManufactory(DeleteManufactoryRequest request);


    }
}
