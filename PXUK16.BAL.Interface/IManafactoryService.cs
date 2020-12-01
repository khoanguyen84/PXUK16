using PXUK16.Domain.Request.Manafactory;
using PXUK16.Domain.Response.Manafactory;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace PXUK16.BAL.Interface
{
    public interface IManafactoryService
    {
        Task<IEnumerable<Manafactory>> Gets();
        Task<CreateManafactoryResult> CreateManafactory(CreateManafactoryRequest request);
        Task<UpdateManafactoryResult> UpdateManafactory(UpdateManafactoryRequest request);

        Task<DeleteManafactoryResult> DeleteManafactory(DeleteManafactoryRequest request);
    }
}
