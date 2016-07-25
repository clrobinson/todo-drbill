$(document).ready(function(){

  // Event: On sign in modal show, clear name and password.
  $('#sign-in-modal').on('show.bs.modal', function(e) {
    $('#name').val('');
    $('#password').val('');
  });

  // Register datepicker in due date modal.
  $('#datepicker').datepicker();

  // Event: Submit due date modal to add due date.
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

  // Event: Submit due date modal to remove due date.
  $('#due-date-remove').on('click', function() {
    var id = $('#due-date-submit').data('item-id');
    var data = {item: {due_date: null} };
    updateItem(id, data);
  });

  // Event: Intercept list rename form submit, and handle with list functions. 
  $('#form-list-rename').on('submit', function(e) {
    e.preventDefault();
    var $form = $('#form-list-rename');
    var oldName = $form.data('old-name');
    var newName = $('#rename-name').val();
    if (oldName != newName) {
      var id = $form.data('rename-id');
      var data = {list: {name: newName} };
      updateList(id, data);
    } else {
      $('#rename-list-modal').modal('hide');
    }
  });

  // Event: Intercept list destroy form submit, and handle with list functions. 
  $('#destroy-list-confirm').on('click', function(e) {
    e.preventDefault();
    destroyList( $('#destroy-list-confirm').data('list-id') );
  });

  // Event: Clicking on flash message interrupts and removes fade out animation.
  $('#flash-msg').on('click', function() {
    $(this).stop().css('z-index', -1).html('');
  });

});