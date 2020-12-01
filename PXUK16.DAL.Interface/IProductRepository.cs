using PXUK16.Domain.Request.Product;
using PXUK16.Domain.Response.Product;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace PXUK16.DAL.Interface
{
    public interface IProductRepository
    {
        Task<IEnumerable<Product>> Gets();
        Task<CreateProductResult> CreateProduct(CreateProductRequest request);
    }
}
