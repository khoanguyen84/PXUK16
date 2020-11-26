using Dapper;
using PXUK16.DAL.Interface;
using PXUK16.Domain.Request.Category;
using PXUK16.Domain.Response.Category;
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
            catch (Exception ex)
            {

                throw;
            }
        }

        public async Task<IEnumerable<Category>> Gets()
        {
            //var sql = "SELECT CategoryId, CategoryName FROM [dbo].[Category] WHERE IsDeleted =0";
            //return await SqlMapper.QueryAsync<Category>(cnn: connect, sql: sql, commandType: CommandType.Text);
            return await SqlMapper.QueryAsync<Category>(cnn: connect, 
                                                sql: "sp_GetCategories", 
                                                commandType: CommandType.StoredProcedure);
        }
    }
}
