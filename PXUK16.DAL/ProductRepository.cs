using Dapper;
using PXUK16.DAL.Interface;
using PXUK16.Domain.Request.Product;
using PXUK16.Domain.Response.Product;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Threading.Tasks;

namespace PXUK16.DAL
{
    public class ProductRepository : BaseRepository, IProductRepository
    {
        public async Task<CreateProductResult> CreateProduct(CreateProductRequest request)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@ProductName", request.ProductName);
                parameters.Add("@CategoryId", request.CategoryId);
                parameters.Add("@ManufactoryId", request.ManufactoryId);
                return await SqlMapper.QueryFirstOrDefaultAsync<CreateProductResult>(cnn: connect,
                                                    sql: "sp_CreateProduct",
                                                    param: parameters,
                                                    commandType: CommandType.StoredProcedure);
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        public async Task<IEnumerable<Product>> Gets()
        {
            return await SqlMapper.QueryAsync<Product>(cnn: connect,
                                                sql: "sp_GetProducts",
                                                commandType: CommandType.StoredProcedure);
        }
    }
}
