using PXUK16.Domain.Response.Category;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace PXUK16.DAL.Interface
{
    public interface ICategoryRepository
    {
        Task<IEnumerable<Category>> Gets();
    }

}
