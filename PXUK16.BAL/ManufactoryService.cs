using PXUK16.BAL.Interface;
using PXUK16.DAL.Interface;
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
        public async Task<IEnumerable<Manufactory>> Gets()
        {
            return await manufactoryRepository.Gets();
        }
    }
}
