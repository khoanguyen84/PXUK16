using PXUK16.BAL.Interface;
using PXUK16.DAL.Interface;
using PXUK16.Domain.Response.Category;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace PXUK16.BAL
{
    public class CategoryService : ICategoryService
    {
        private readonly ICategoryRepository categoryRepository;

        public CategoryService(ICategoryRepository categoryRepository)
        {
            this.categoryRepository = categoryRepository;
        }
        public async Task<IEnumerable<Category>> Gets()
        {
            return await categoryRepository.Gets();
        }
    }
}
