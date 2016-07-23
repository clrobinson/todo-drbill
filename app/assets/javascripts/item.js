// Function: Create Item
var createItem = function(id, data) {
  $.ajax({
    url: '/items/' + id,
    method: 'post',
    data: data,
    dataType: 'script'
  });
}

// Function: Update Item
var updateItem = function(id, data) {
  $.ajax({
    url: '/items/' + id,
    method: 'patch',
    data: data,
    dataType: 'script'
  });
}

// Function: Destroy Item
var destroyItem = function(id) {
  $.ajax({
    url: '/items/' + id,
    method: 'delete',
    dataType: 'script'
  });
}

// Function: Register Item
var registerItem = function(elem) {
  var $item = $(elem);
  var itemId = $item.attr('id').substr(5);
  var $btnDone = $item.find('.btn-done');
  var $content = $item.find('.item-content:not(.done)');
  var $due = $item.find('.due');
  var $btnClear = $item.find('.btn-clear');

  if ($btnDone) {
    $btnDone.off('click');

    if ( $btnDone.hasClass('btn-info') ) {
      // Event: Item is to be flagged as done.
      $btnDone.on('click', function() {
        console.log(itemId + ' is to be flagged as done');
        ////
      });
    }

    if ( $btnDone.hasClass('btn-success') ) {
      // Event: Item is to be flagged as not done.
      $btnDone.on('click', function() {
        console.log(itemId + ' is to be flagged as NOT done');
        ////
      });
    }
  }

  if ($content) {
    $content.off('focus');
    $content.off('blur');

    // Event: Item is to start editing.
    $content.on('focus', function() {
      console.log(itemId + ' is editing');
      ////
    });

    // Event: Item is to finish editing.
    $content.on('blur', function() {
      console.log(itemId + ' is DONE editing');
      ////
    });
  }

  if ($due) {
    $due.off('click');

    // Event: Item due date is to start editing.
    $due.on('click', function() {
      console.log(itemId + ' needs to edit due date')
      ////
    });
  }

  if ($btnClear) {
    $btnClear.off('click');

    // Event: Item 'btn-clear' is clicked.
    $btnClear.on('click', function() {
      console.log(itemId + ' should be CLEARED')
      ////
    });
  }
}

// Function: Register All Items in Item Container
var registerItemContainer = function() {
  var $newItemContent = $('#new-item-content');
  var newPrompt = $newItemContent.text();

  // Event: Start making a new item.
  $newItemContent.off('focus').on('focus', function(e) {
    $newItemContent.text('');
  });

  // Event: Finish making a new item.
  $newItemContent.off('blur').on('blur', function(e) {
    $newItemContent.text(newPrompt);
  });

  // Register all items...
  $('.item').each(function() { registerItem(this); });
}
