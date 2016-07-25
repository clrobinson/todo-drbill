// Function: Update List
var updateList = function(id, data) {
  $.ajax({
    url: '/lists/' + id,
    method: 'patch',
    data: data,
    dataType: 'script'
  });
}

// Function: Destroy List
var destroyList = function(id) {
  $.ajax({
    url: '/lists/' + id,
    method: 'delete',
    dataType: 'script'
  });
}

var registerListContainer = function() {

  // Event: Show modal for creating a new list.
  $('#new-list').off('click').on('click', function(e) {
    $('#list_name').val('')
    $('#new-list-modal').modal('show');
  });

  // Each list...
  $('.list:not(#new-list)').each(function() {
    var $this = $(this);
    var listId = $this.attr('id').substr(5)
    var $show = $this.find('.btn-show');
    var $rename = $this.find('.btn-rename');
    var $destroy = $this.find('.btn-destroy');

    // Event: Show this list.
    $show.off('click').on('click', function() {
      $.ajax({
        url: '/lists/' + listId,
        method: 'get',
        dataType: 'script'
      });
    })

    // Event: Rename this list.
    $rename.off('click').on('click', function() {
      var oldName = $this.find('.name').text();
      $('#form-list-rename').data('rename-id', listId);
      $('#form-list-rename').data('old-name', oldName);
      $('#rename-name').val(oldName);
      $('#rename-list-modal').modal('show');
    })

    // Event: Destroy this list.
    $destroy.off('click').on('click', function() {
      $('#destroy-name').text( $this.find('.name').text() );
      $('#destroy-list-confirm').data('list-id', listId);
      $('#destroy-list-modal').modal('show');
    })

  });

}