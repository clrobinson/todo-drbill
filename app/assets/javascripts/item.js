// Function: Register Enter Key
var registerEnter = function($elem) {
  $elem.on('keydown', function(e) {
    if (e.keyCode == 13) {
      e.preventDefault();
      $elem.trigger('blur');
    }
  });
}

// Function: Deregister Enter Key
var deregisterEnter = function($elem) {
  $elem.off('keydown');
}

// Function: Create Item
var createItem = function(data) {
  $.ajax({
    url: '/items',
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
var registerItem = function($item) {
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
        var data = {item: {done: true} };
        updateItem(itemId, data);
      });
    }

    if ( $btnDone.hasClass('btn-success') ) {
      // Event: Item is to be flagged as not done.
      $btnDone.on('click', function() {
        var data = {item: {done: false} };
        updateItem(itemId, data);
      });
    }
  }

  if ($content) {
    $content.off('focus');
    $content.off('blur');
    var originalContent = $content.text();

    // Event: Item is to start editing.
    $content.on('focus', function() {
      registerEnter($content);
    });

    // Event: Item is to finish editing.
    $content.on('blur', function() {
      deregisterEnter($content);
      var newText = $content.text();
      if ( newText != originalContent) {
        var data = {item: {content: newText} };
        updateItem(itemId, data);
      }
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
      destroyItem(itemId);
    });
  }
}

// Function: Register All Items in Item Container
var registerItemContainer = function() {
  var $newItemContent = $('#new-item-content');
  var newPrompt = $newItemContent.text();

  // Event: Start making a new item.
  $newItemContent.off('focus').on('focus', function(e) {
    registerEnter($newItemContent);
    $newItemContent.text('');
  });

  // Event: Finish making a new item.
  $newItemContent.off('blur').on('blur', function(e) {
    deregisterEnter($newItemContent);
    if ( $newItemContent.text() ) {
      data = {item: {
        content: $newItemContent.text(), 
        list_id: $('.item-container-name').attr('id').substr(5)
      } };
      createItem(data);
    }
    $newItemContent.text(newPrompt);
  });

  // Register all items...
  $('.item').each(function() { registerItem( $(this) ); });
}

// Function: Sort Item Display
var sortItemContainer = function() {
  rows = $('#item-container').find('.row');
  rows.sort(function(a, b) {
    if ( parseInt(a.getAttribute('data-sortstamp')) > parseInt(b.getAttribute('data-sortstamp')) ) { return -1; }
    if ( parseInt(a.getAttribute('data-sortstamp')) < parseInt(b.getAttribute('data-sortstamp')) ) { return 1; }
    return 0;
  });
  var runningTop = $('.item-container-name').outerHeight(true);
  $.each(rows, function(index, row) {
    var $row = $(row);
    $row.animate({top: runningTop});
    runningTop += $row.outerHeight(true);
  });
}
