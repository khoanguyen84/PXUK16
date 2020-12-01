using PXUK16.BAL.Interface;
using PXUK16.DAL.Interface;
using PXUK16.Domain.Request.Product;
using PXUK16.Domain.Response.Product;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace PXUK16.BAL
{
    public class ProductService : IProductService
    {
        private readonly IProductRepository productRepository;
        public ProductService(IProductRepository productRepository)
        {
            this.productRepository = productRepository;
        }
        public async Task<CreateProductResult> CreateProduct(CreateProductRequest request)
        {
            return await productRepository.CreateProduct(request);
        }

        public async Task<IEnumerable<Product>> Gets()
        {
            return await productRepository.Gets();
        }
    }
}
