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

  $('#form-list-rename').on('submit', function(e) {
    e.preventDefault();
    var $form = $('#form-list-rename');
    var oldName = $form.data('old-name');
    var newName = $('#rename-name').val();
    if (oldName != newName) {
      var id = $form.data('rename-id');
      var data = {list: {name: newName} };
      updateList(id, data);
    }
  });

  $('#destroy-list-confirm').on('click', function(e) {
    e.preventDefault();
    destroyList( $('#destroy-list-confirm').data('list-id') );
  });

});