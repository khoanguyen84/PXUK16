var home = {} || home;

home.showCategory = function () {
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


home.initCategory = function () {
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

home.tbCategory = function () {
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

home.initNav = function () {
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

home.init = function () {
    home.showCategory();
    home.initCategory();
    home.tbCategory();
    home.initNav();
}

$(document).ready(function () {
    home.init();
});
