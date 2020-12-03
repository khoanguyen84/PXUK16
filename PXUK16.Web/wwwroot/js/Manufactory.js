var home1 = {} || home1;

home1.showManufactory = function () {
    $.ajax({
        url: 'https://localhost:44398/api/manufactory/gets',
        method: 'GET',
        contentType: 'JSON',
        success: function (data) {
            $.each(data, function (i, v) {
                $('#Manufactories').append(`<a href="#" class="list-group-item">${v.name}</a>`);
            })

        }
    });
}

home1.initManufactory = function () {
    $.ajax({
        url: 'https://localhost:44398/api/manufactory/gets',
        method: 'GET',
        contentType: 'JSON',
        success: function (data) {
            $.each(data, function (i, v) {
                $('#cat1').append(`<option value="${v.manufactoryId}">${v.name}</option>`);
            })

        }
    });
}

home1.tbManufactory = function () {
    $.ajax({
        url: 'https://localhost:44398/api/manufactory/gets',
        method: 'GET',
        contentType: 'JSON',
        success: function (data) {
            $.each(data, function (i, v) {
                $('#tbCat1>tbody').append(`<tr>
                                            <td>${v.manufactoryId}</td>
                                            <td>${v.name}</td>
                                            <td></td>
                                        </tr>`);
            })

        }
    });
}

home1.initNavManu = function () {
    $.ajax({
        url: 'https://localhost:44398/api/manufactory/gets',
        method: 'GET',
        contentType: 'JSON',
        success: function (data) {
            $.each(data, function (i, v) {
                $('#subNavManu ul').append(`<li class="nav-item">
                                            <a class="nav-link" href="#">${v.name}</a>
                                        </li>`);
            })

        }
    });
}




home1.init = function () {
    home1.showManufactory();
    home1.initManufactory();
    home1.tbManufactory();
    home1.initNavManu();

   
}

$(document).ready(function () {
    home1.init();
    
});
