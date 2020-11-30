﻿using Dapper;
using PXUK16.DAL.Interface;
using PXUK16.Domain.Request.Manufactory;
using PXUK16.Domain.Response.Category;
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
                                                    sql: "sp_CreateManufactory",
                                                    param: parameters,
                                                    commandType: CommandType.StoredProcedure);
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        public async Task<IEnumerable<Manufactory>> Gets()
        {
            return await SqlMapper.QueryAsync<Manufactory>(cnn: connect,
                                                sql: "sp_GetManufactories",
                                                commandType: CommandType.StoredProcedure);
        }

        public async Task<UpdateManufactoryResult> UpdateManufactory(UpdateManufactoryRequest request)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@ManufactoryId", request.ManufactoryId);
                parameters.Add("@Name", request.Name);
                return await SqlMapper.QueryFirstOrDefaultAsync<UpdateManufactoryResult>(cnn: connect,
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
