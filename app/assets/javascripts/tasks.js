// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$( window ).load(function() {
    console.log( "ready!" );

 button_listener();

});


var button_listener =  function() {
  //$(".task-container" ).on('click','.checkbox',function(event)

  $(".checkbox " ).on('click',function(event) {
  var data = $(this).parents("form").serialize() + "&completed=" + $(this).is(':checked')
  var url = "http://localhost:3000/tasks/" + $(this).parent().attr('id');
  var type = "PUT";

  $.ajax({
    url: url,
    type: type,
    data: data,
    dataType: "json"
  }).done(function(response){

    console.log(response)

  });
});
}


