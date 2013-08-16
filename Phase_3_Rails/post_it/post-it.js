$(document).ready (function(){

  function deletePostIt($postIt) {
    $postIt.remove();
  }

  $('#board').on ('click', function(event){

    var x_coord = event.pageX;
    var y_coord = event.pageY;
    var postIt = $('#cloneme').clone().removeAttr('id').show().css("top", y_coord).css("left", x_coord);

    $(this).append(postIt);

    $('#board').on ('click', '.delete', function(event){
      event.stopPropagation();
      event.preventDefault();
      deletePostIt($(this).closest('.post-it'));
    });

    $('#board').on ('click', '.content', function(event){
      event.stopPropagation();
    });
  });

  $('#board').on ('mouseenter', '.header', function(event){
    $(this).closest('.post-it').draggable().resizable();
  });

});

