using Dapper;
using PXUK16.DAL.Interface;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;
using PXUK16.Domain.Response.Manafactory;
using PXUK16.Domain.Request.Manafactory;
using System;

namespace PXUK16.DAL
{
    public class ManafactoryRepository : BaseRepository, IManafactoryRepository
    {
        public async Task<CreateManafactoryResult> CreateManafactory(CreateManafactoryRequest request)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@ManufactoryName", request.Name);
                return await SqlMapper.QueryFirstOrDefaultAsync<CreateManafactoryResult>(cnn: connect,
                                                    sql: "sp_CreateManufactory",
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
                                                sql: "sp_GetManafactory",
                                                commandType: CommandType.StoredProcedure);
        }

        public async Task<UpdateManafactoryResult> UpdateManafactory(UpdateManafactoryRequest request)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@ManufactoryName", request.Name);
                parameters.Add("@ManafactoryId", request.ManafactoryId);
                return await SqlMapper.QueryFirstOrDefaultAsync<UpdateManafactoryResult>(cnn: connect,
                                                    sql: "sp_UpdateManufactory",
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
