﻿using Dapper;
using PXUK16.DAL.Interface;
using PXUK16.Domain.Request.Category;
using PXUK16.Domain.Request.Update_Category;
using PXUK16.Domain.Response.Category;
using PXUK16.Domain.Response.Update_Category;
using System;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace PXUK16.DAL
{
    public class CategoryRepository : BaseRepository, ICategoryRepository
    {
        public async Task<CreateCategoryResult> CreateCategory(CreateCategoryRequest request)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@CategoryName", request.CategoryName);
                return await SqlMapper.QueryFirstOrDefaultAsync<CreateCategoryResult>(cnn: connect,
                                                    sql: "sp_CreateCategory",
                                                    param: parameters,
                                                    commandType: CommandType.StoredProcedure);
            }
            catch (Exception)
            {

                throw;
            }
        }

        

       public async Task<IEnumerable<Category>> Gets()
        {

            return await SqlMapper.QueryAsync<Category>(cnn: connect, 
                                                sql: "sp_GetCategories", 
                                                commandType: CommandType.StoredProcedure);
        }

        public async Task<Domain.Response.Category.UpdateCategoryResult> UpdateCategory(Domain.Request.Category.UpdateCategoryRequest request)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@CategoryId", request.CategoryId);
                parameters.Add("@CategoryName", request.CategoryName);

                return await SqlMapper.QueryFirstOrDefaultAsync<Domain.Response.Category.UpdateCategoryResult>(cnn: connect,
                                                    sql: "sp_UpdateCategory",
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
