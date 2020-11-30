using Dapper;
using PXUK16.DAL.Interface;
using PXUK16.Domain.Request.Manafactory;
using PXUK16.Domain.Response.Category;
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
        public async Task<CreateManafactoryResult> CreateManafactory(CreateManafactoryRequest request)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@Name", request.Name);
                return await SqlMapper.QueryFirstOrDefaultAsync<CreateManafactoryResult>(cnn: connect,
                                                    sql: "sp_CreateManafactory",
                                                    param: parameters,
                                                    commandType: CommandType.StoredProcedure);
            }
            catch (Exception ex)
            {

                throw;
            }
        }
        public async Task<IEnumerable<Manafactory>> Gets()
        {
           
            return await SqlMapper.QueryAsync<Manafactory>(cnn: connect,
                                                sql: "sp_GetManufactories",
                                                commandType: CommandType.StoredProcedure);
        }

        public async Task<UpdateManafactoryResult> UpdateManafactory(UpdateManafactoryRequest request)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@ManufactoryId", request.ManufactoryId);
                parameters.Add("@Name", request.Name);
                return await SqlMapper.QueryFirstOrDefaultAsync<UpdateManafactoryResult>(cnn: connect,
                                                    sql: "sp_UpdateManafactory",
                                                    param: parameters,
                                                    commandType: CommandType.StoredProcedure);
            }
            catch (Exception ex)
            {

                throw;
            }

        }
    }
}
