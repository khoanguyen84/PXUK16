var manufactory = {} || manufactory;

manufactory.showManufactory = function () {
    $.ajax({
        url: 'https://localhost:44398/api/manufactory/gets',
        method: 'GET',
        contentType: 'JSON',
        success: function (data) {
            $.each(data, function (i, v) {
                $('#manufactories').append(`<a href="#" class="list-group-item">${v.name}</a>`);
            })

        }
    });
}


manufactory.initManufactory = function () {
    $.ajax({
        url: 'https://localhost:44398/api/manufactory/gets',
        method: 'GET',
        contentType: 'JSON',
        success: function (data) {
            $.each(data, function (i, v) {
                $('#man').append(`<option value="${v.manufactoryId}">${v.name}</option>`);
            })

        }
    });
}

manufactory.tbManufactory = function () {
    $.ajax({
        url: 'https://localhost:44398/api/manufactory/gets',
        method: 'GET',
        contentType: 'JSON',
        success: function (data) {
            $.each(data, function (i, v) {
                $('#tbMan>tbody').append(`<tr>
                                            <td>${v.manufactoryId}</td>
                                            <td>${v.name}</td>
                                            <td></td>
                                        </tr>`);
            })

        }
    });
}

manufactory.initNav = function () {
    $.ajax({
        url: 'https://localhost:44398/api/manufactory/gets',
        method: 'GET',
        contentType: 'JSON',
        success: function (data) {
            $.each(data, function (i, v) {
                $('#subNav ul').append(`<li class="nav-item">
                                            <a class="nav-link" href="#">${v.name}</a>
                                        </li>`);
            })

        }
    });
}

manufactory.init = function () {
    manufactory.showManufactory();
    manufactory.initManufactory();
    manufactory.tbManufactory();
    manufactory.initNav();
}

$(document).ready(function () {
    manufactory.init();
});