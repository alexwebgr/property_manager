$(document).on("turbolinks:load", function () {
    $('#property_area').on('keyup', _.debounce(retrieve_areas, 1000));

    $('#areas-dd').on('click', 'button', function () {
        $('#property_area').val($(this).text());
        $('#property_placeId').val($(this).attr('data-placeId'));
        $('#areas-dd').hide();
    });

    $(document).on('keyup', function (event) {
        if(event.code === 'Escape' && $('#areas-dd').length) {
            $('#areas-dd').hide();
        }
    });
});

function retrieve_areas(event) {
    if (!keyAllowed(event.code)) {
        return false;
    }

    let query = event.target.value;

    if(query.length < 3) {
        return false;
    }

    $.get(`/places/search?input=${query}`, function (response) {
        let html = '';
        $.each(response, function (i, value) {
            html  += `<button type="button" class="list-group-item list-group-item-action" data-placeId="${value.placeId}">${value.mainText} - ${value.secondaryText}</button>`;
        });

        $('#areas-dd')
            .html(html)
            .show()
        ;
    });
}

function keyAllowed(key) {
    const regex = RegExp('Key*|Escape|Delete', 'i');

    return regex.test(key);
}