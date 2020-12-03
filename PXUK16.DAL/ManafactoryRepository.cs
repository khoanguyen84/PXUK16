using Dapper;
using PXUK16.DAL.Interface;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;
using PXUK16.Domain.Response.Manafactory;
using PXUK16.Domain.Request.Manafactory;
using System;
using PXUK16.Domain.Response.Category;

namespace PXUK16.DAL
{
    public class ManafactoryRepository : BaseRepository, IManafactoryRepository
    {
        public async Task<CreateManafactoryResult> CreateManafactory(CreateManafactoryRequest request)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@Name", request.Name);
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
                                                sql: "sp_GetManufactory",
                                                commandType: CommandType.StoredProcedure);
        }

        public async Task<UpdateManafactoryResult> UpdateManafactory(UpdateManafactoryRequest request)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@Name", request.Name);
                parameters.Add("@ManufactoryId", request.ManafactoryId);
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

        public async Task<DeleteManufactoryResult> DeleteManafactory(DeleteManufactoryRequest request)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@ManufactoryId", request.ManufactoryId);


                return await SqlMapper.QueryFirstOrDefaultAsync<DeleteManufactoryResult>(cnn: connect,
                                                    sql: "sp_DeleteManufactories",
                                                    param: parameters,
                                                    commandType: CommandType.StoredProcedure);
            }
            catch (Exception)
            {

                throw;
            }
        }

       
    }
}
