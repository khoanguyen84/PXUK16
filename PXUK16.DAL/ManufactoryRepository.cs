using Dapper;
using PXUK16.DAL.Interface;
using PXUK16.Domain.Request.Category;
using PXUK16.Domain.Response.Manufactory;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Threading.Tasks;

namespace PXUK16.DAL
{
    public class ManufactoryRepository : BaseRepository, IManufactoryRepository
    {
        public async Task<CreateManufactoryResult> CreateManufactory(CreateManufactoryRequest request)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@Name", request.Name);
                return await SqlMapper.QueryFirstOrDefaultAsync<CreateManufactoryResult>(cnn: connect,
                                                sql: "sp_GetManufactory",
                                                commandType: CommandType.StoredProcedure);
            }
            catch (Exception)
            {

                throw;
            }
        }

        public async Task<IEnumerable<Manufactory>> Gets()
        {
            return await SqlMapper.QueryAsync<Manufactory>(cnn: connect,
                                                sql: "sp_GetManufactory",
                                                commandType: CommandType.StoredProcedure);
        }
    }
}
