// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready( function() {
  $('input[title!=""]').hint();  
  $('textarea[title!=""]').hint();
  $("#postage_stamp").draggable();
  
  $("#draggable").draggable();
  $("#stamp_target").droppable({
    hoverClass: "hover",
    drop: function(event, ui) {
      alert("dropped");
    }
  });
})
