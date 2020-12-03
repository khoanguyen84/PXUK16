var Manufactory = {} || Manufactory;

Manufactory.showManufactory = function () {
    $.ajax({
        url: 'https://localhost:44398/api/manafactory/gets',
        method: 'GET',
        contentType: 'JSON',
        success: function (data) {
            $.each(data, function (i, v) {
                $('#Manufactory').append(`<a href="#" class="list-group-item">${v.name}</a>`);
            })

        }
    });
}

Manufactory.initManufactory = function () {
    $.ajax({
        url: 'https://localhost:44398/api/manafactory/gets',
        method: 'GET',
        contentType: 'JSON',
        success: function (data) {
            $.each(data, function (i, v) {
                $('#Man').append(`<option value="${v.manufactoryId}">${v.name}</option>`);
            })

        }
    });
}

Manufactory.tbManufactory = function () {
    $.ajax({
        url: 'https://localhost:44398/api/manafactory/gets',
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

Manufactory.initNav = function () {
    $.ajax({
        url: 'https://localhost:44398/api/manafactory/gets',
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




Manufactory.init = function () {
    Manufactory.showManufactory();
    Manufactory.initManufactory();
    Manufactory.tbManufactory();
    Manufactory.initNav();


}

$(document).ready(function () {
    Manufactory.init();

});