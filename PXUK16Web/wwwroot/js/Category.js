var Category = {} || Category;

Category.showCategory = function () {
    $.ajax({
        url: 'https://localhost:44398/api/category/gets',
        method: 'GET',
        contentType: 'JSON',
        success: function (data) {
            $.each(data, function (i, v) {
                $('#catetories').append(`<a href="#" class="list-group-item">${v.categoryName}</a>`);
            })

        }
    });
}


Category.initCategory = function () {
    $.ajax({
        url: 'https://localhost:44398/api/category/gets',
        method: 'GET',
        contentType: 'JSON',
        success: function (data) {
            $.each(data, function (i, v) {
                $('#cat').append(`<option value="${v.categoryId}">${v.categoryName}</option>`);
            })

        }
    });
}

Category.tbCategory = function () {
    $.ajax({
        url: 'https://localhost:44398/api/category/gets',
        method: 'GET',
        contentType: 'JSON',
        success: function (data) {
            $.each(data, function (i, v) {
                $('#tbCat>tbody').append(`<tr>
                                            <td>${v.categoryId}</td>
                                            <td>${v.categoryName}</td>
                                            <td></td>
                                        </tr>`);
            })

        }
    });
}

Category.initNav = function () {
    $.ajax({
        url: 'https://localhost:44398/api/category/gets',
        method: 'GET',
        contentType: 'JSON',
        success: function (data) {
            $.each(data, function (i, v) {
                $('#subNav ul').append(`<li class="nav-item">
                                            <a class="nav-link" href="#">${v.categoryName}</a>
                                        </li>`);
            })

        }
    });
}

Category.init = function () {
    Category.showCategory();
    Category.initCategory();
    Category.tbCategory();
    Category.initNav();
}

$(document).ready(function () {
    Category.init();
});