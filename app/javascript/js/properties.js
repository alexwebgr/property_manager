$(document).on("turbolinks:load", function () {
    $('#property_area').on('keyup', function (e) {
        let query = e.target.value;

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
    });

    $('#areas-dd').on('click', 'button', function () {
        $('#property_area').val($(this).text());
        $('#property_placeId').val($(this).attr('data-placeId'));
        $('#areas-dd').hide();
    });
});
