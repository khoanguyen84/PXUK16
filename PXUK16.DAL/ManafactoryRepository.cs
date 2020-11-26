using Dapper;
using PXUK16.DAL.Interface;
using PXUK16.Domain.Response.Manafactory;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Threading.Tasks;

namespace PXUK16.DAL
{
   public  class ManafactoryRepository: BaseRepository, IManafactoryRepository
    {
        public async Task<IEnumerable<Manafactory>> Gets()
        {
           
            return await SqlMapper.QueryAsync<Manafactory>(cnn: connect,
                                                sql: "sp_GetManufactories",
                                                commandType: CommandType.StoredProcedure);
        }
    }
}
