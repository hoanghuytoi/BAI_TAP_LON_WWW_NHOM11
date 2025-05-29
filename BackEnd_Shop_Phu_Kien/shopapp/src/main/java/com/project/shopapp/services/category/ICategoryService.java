package com.project.shopapp.services.category;


import com.project.shopapp.dtos.requests.category.CategoryDTO;
import com.project.shopapp.models.Category;

import java.util.List;

public interface ICategoryService {
    Category createCategory(CategoryDTO category);

    Category getCategoryById(int id);

    List<Category> getAllCategories();

    Category updateCategory(int categoryId, CategoryDTO category);

    Category deleteCategory(int id) throws Exception;
}
