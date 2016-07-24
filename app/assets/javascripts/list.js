var registerListContainer = function() {

  // Event: Show modal for creating a new list.
  $('#new-list').off('click').on('click', function(e) {
    $('#list_name').val('')
    $('#new-list-error-explanation').text('')
    $('#new-list-modal').modal('show');
  });

  // Each list...
  $('.list:not(#new-list)').each(function() {
    var $this = $(this);
    var listId = $this.attr('id').substr(5)

    // Event: Load a specific list.
    $this.off('click').on('click', function() {
      $.ajax({
        url: '/lists/' + listId,
        method: 'get',
        dataType: 'script'
      });
    })

  });

}