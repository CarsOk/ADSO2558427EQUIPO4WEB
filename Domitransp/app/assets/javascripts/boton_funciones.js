$(document).on('turbolinks:load', function() {
    $('form').on('click', '.remove_record', function(event) {
        $(this).prev('input[type=hidden]').val('1');
        $(this).closest('.nested-fields').remove(); 
        console.log('Se hizo clic en el botón de eliminar');
        return event.preventDefault();
    });
    

    $('form').on('click', '.add_fields', function(event) {
        var regexp, time;
        time = new Date().getTime();
        regexp = new RegExp($(this).data('id'), 'g');
        var fields = $(this).data('fields').replace(regexp, time);
        $('.fields').append(fields);
        console.log('Se hizo clic en el botón de agregar');
        return event.preventDefault();
    });
});
