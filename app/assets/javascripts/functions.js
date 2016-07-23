var registerListContainerEvents = function() {

  $('#new-list').on('click', function(e) {
    //// activate modal for new list
  });

  $('.list:not(#new-list)').each(function() {

    var listId = $(this).attr('id').substr(5)
    $(this).on('click', function() {
      //// AJAX 'show' call for a specific list
    })

  });

}