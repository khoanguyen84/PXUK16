using PXUK16.BAL.Interface;
using PXUK16.DAL.Interface;
using PXUK16.Domain.Request.Category;
using PXUK16.Domain.Request.Manafactory;
using PXUK16.Domain.Response.Manufactory;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace PXUK16.BAL
{
    public class ManufactoryService : IManufactoryService
    {
        private readonly IManufactoryRepository manufactoryRepository;
        public ManufactoryService(IManufactoryRepository manufactoryRepository)
        {
            this.manufactoryRepository = manufactoryRepository;
        }

        public async Task<CreateManufactoryResult> CreateManufactory(CreateManufactoryRequest request)
        {
            return await manufactoryRepository.CreateManufactory(request);
        }

        public async Task<DeleteManufactoryResult> DeleteManufactory(DeleteManufactoryRequest request)
        {
            return await manufactoryRepository.DeleteManufactory(request);
        }

        public async Task<IEnumerable<Manufactory>> Gets()
        {
            return await manufactoryRepository.Gets();
        }

        public async Task<UpdateManufactoryResult> UpdateManufactory(UpdateManufactoryRequest request)
        {
            return await manufactoryRepository.UpdateManufactory(request);
        }
    }
}
