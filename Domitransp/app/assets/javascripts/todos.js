// $(document).on('turbolinks:load', function() {

//     $('tbody').on('click', '.delete-todo', function(event) {
//       event.preventDefault();
//       var todoId = $(this).data('id');
//       var todoRow = $(this).closest('tr');
  
//       $.ajax({
//         url: '/todos/' + todoId,
//         type: 'DELETE',
//         dataType: 'json',
//         success: function(response) {
//           todoRow.remove();
//         },
//         error: function(xhr) {
//           console.log(xhr.responseText);
//         }
//       });
//     });
// });