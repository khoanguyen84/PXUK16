using PXUK16.BAL.Interface;
using PXUK16.DAL.Interface;
using PXUK16.Domain.Response.Manafactory;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace PXUK16.BAL
{
    public class ManafactoryService : IManafactoryService
    {
        private readonly IManafactoryRepository manafactoryRepository;

        public ManafactoryService(IManafactoryRepository manafactoryRepository)
        {
            this.manafactoryRepository = manafactoryRepository;
        }
        public async Task<IEnumerable<Manafactory>> Gets()
        {
            return await manafactoryRepository.Gets();
        }


    }
}
