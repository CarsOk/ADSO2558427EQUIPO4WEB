
$(document).on('turbolinks:load', function() {
    $('form').on('click', '.remove_record', function(event) {
        $(this).prev('input[type=hidden]').val('1');
        $(this).closest('tr').hide();
        console.log('Se hizo clic en el botón de eliminar');
        return event.preventDefault();
    });

    $('form').on('click', '.add_fields', function(event) {
        var regexp, time;
        time = new Date().getTime();
        regexp = new RegExp($(this).data('id'), 'g');
        $('.fields').append($(this).data('fields').replace(regexp, time));
        console.log('Se hizo clic en el botón de agregar');
        return event.preventDefault();
    });
});