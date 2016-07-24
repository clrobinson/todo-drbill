$(document).ready(function(){

  $('#sign-in-modal').on('show.bs.modal', function(e) {
    $('#sign-in-error-explanation').text('');
    $('#name').val('');
    $('#password').val('');
  });

  $('#datepicker').datepicker();

  $('#due-date-submit').on('click', function() {
    var date = $('#datepicker').datepicker('getDate');
    if (date) {
      var id = $(this).data('item-id');
      var data = {item: {due_date: date} };
      updateItem(id, data);
    } else {
      $('#due-date-modal').modal('hide');
    }
  });

  $('#due-date-remove').on('click', function() {
    var id = $('#due-date-submit').data('item-id');
    var data = {item: {due_date: null} };
    updateItem(id, data);
  });

});