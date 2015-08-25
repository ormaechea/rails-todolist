// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$( window ).load(function() {
    console.log( "ready!" );

 button_listener();

});


var button_listener =  function() {

  $(".task-container" ).on('click','.checkbox',function(event) {

 console.log("CLICKED MOTHERGUCK");

 event.preventDefault();

});

}