using Dapper;
using PXUK16.DAL.Interface;
using PXUK16.Domain.Response.Manafactory;
using System;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace PXUK16.DAL
{
    public class ManafactoryRepository : BaseRepository, IManafactoryRepository
    {
        public async Task<IEnumerable<Manafactory>> Gets()
        {
            //var sql = "SELECT CategoryId, CategoryName FROM [dbo].[Category] WHERE IsDeleted =0";
            //return await SqlMapper.QueryAsync<Category>(cnn: connect, sql: sql, commandType: CommandType.Text);
            return await SqlMapper.QueryAsync<Manafactory>(cnn: connect, 
                                                sql: "sp_Manufactories", 
                                                commandType: CommandType.StoredProcedure);
        }
    }
}
