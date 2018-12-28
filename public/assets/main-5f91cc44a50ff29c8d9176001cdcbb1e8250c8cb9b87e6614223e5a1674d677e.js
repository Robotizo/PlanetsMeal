// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/


document.addEventListener('gesturestart', function (e) {
    e.preventDefault();
});



 $(document).ready(function() {
    $('#dropInfo').hide(); 
  $('.ecoStatsButton').click(function() {
    if(!$('#dropInfo').hasClass('opened')){
      $('#dropInfo').slideUp(function(){$(this).addClass('opened')});
    }
    else{
      $('#dropInfo').slideDown(function(){$(this).removeClass('opened')});
    }
   
   });
 });
