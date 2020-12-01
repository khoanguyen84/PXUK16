using PXUK16.Domain.Request.Manafactory;
using PXUK16.Domain.Response.Manafactory;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace PXUK16.DAL.Interface
{
    public interface IManafactoryRepository
    {
        Task<IEnumerable<Manafactory>> Gets();
        Task<CreateManafactoryResult> CreateManafactory(CreateManafactoryRequest request);
        Task<UpdateManafactoryResult> UpdateManafactory(UpdateManafactoryRequest request);
        Task<DeleteManafactoryResult> DeleteManafactory(DeleteManafactoryRequest request);
    }
}
