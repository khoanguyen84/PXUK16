using PXUK16.Domain.Response.Category;
using System;
using System.Collections;
using System.Collections.Generic;

namespace PXUK16.DAL.Interface
{
    public interface ICategoryRepository
    {
        IEnumerable<Category> Gets();
    }
}
