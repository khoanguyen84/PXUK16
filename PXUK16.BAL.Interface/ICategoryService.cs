using PXUK16.Domain.Request.Category;
using PXUK16.Domain.Response.Category;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace PXUK16.BAL.Interface
{
    public interface ICategoryService
    {
        Task<IEnumerable<Category>> Gets();
        Task<CreateCategoryResult> CreateCategory(CreateCategoryRequest request);

        Task<UpdateCategoryResult> UpdateCategory(UpdateCategoryRequest request);

        Task<DeleteCategoryResult> DeleteCategory(DeleteCategoryRequest request);
    }
}
