$(document).on("turbolinks:load", function () {
    $('#property_area').on('keyup', function (e) {
        let query = e.target.value;

        //TODO limit the type of keys only to alphanum, excluding tab, enter, ctrl and so on
        //TODO hide area_dd on esc

        if(query.length < 3) {
            return false;
        }
        _.debounce(make_ajax_call(query), 1300);
    });

    $('#areas-dd').on('click', 'button', function () {
        $('#property_area').val($(this).text());
        $('#property_placeId').val($(this).attr('data-placeId'));
        $('#areas-dd').hide();
    });

    function make_ajax_call(query) {
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
});
