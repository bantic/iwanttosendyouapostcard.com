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
      $("#new_recipient").submit();
    }
  });
  
  $("#new_recipient").submit( function() {
    if ( $("#recipient_name").hasClass("blur") ||
         $("#recipient_address").hasClass("blur") ) {
           alert("I need both your name and address!");
      $("#postage_stamp").animate({left: "30px", top: "40px"});
      return false;
    }
  });
});


function sendPostcard() {
  $("#postage_stamp").fadeOut(); $("#hidden_postage_stamp").fadeIn();
  setTimeout( function() { $("#cancel_postage_stamp").fadeIn(); }, 500);
  setTimeout( function() {
    $("#postcard").animate({left: "1000px"});
  }, 1500);
  setTimeout( function() {
    $("#postcard").hide();
    $("#thanks").fadeIn();
  }, 2000);
}