$(document).ready(function(){

  $('#sign-in-modal').on('show.bs.modal', function(e) {
    $('#sign-in-error-explanation').text('');
    $('#name').val('');
    $('#password').val('');
  });

});