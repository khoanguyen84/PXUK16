﻿using PXUK16.Domain.Request.Category;
using PXUK16.Domain.Request.Update_Category;
using PXUK16.Domain.Response.Category;
using PXUK16.Domain.Response.Update_Category;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace PXUK16.BAL.Interface
{
    public interface ICategoryService
    {
        Task<IEnumerable<Category>> Gets();
        Task<CreateCategoryResult> CreateCategory(CreateCategoryRequest request);

        Task<Domain.Response.Category.UpdateCategoryResult> UpdateCategory(Domain.Request.Category.UpdateCategoryRequest request);
    }
}
