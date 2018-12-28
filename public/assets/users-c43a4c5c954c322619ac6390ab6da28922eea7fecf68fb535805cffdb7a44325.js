/*# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/*/



 $(document).ready(function() {
    $('#orderInfo').hide(); 
  $('.ordersButton').click(function() {
    if(!$('#orderInfo').hasClass('opened')){
      $('#orderInfo').slideUp(function(){$(this).addClass('opened')});
    }
    else{
      $('#orderInfo').slideDown(function(){$(this).removeClass('opened')});
    }
   
   });
 });
