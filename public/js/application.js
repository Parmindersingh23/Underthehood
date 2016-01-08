$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

   $(".form-answer form").on("submit", function(event){
      event.preventDefault();
      var postAnswer = $(this).serialize();
      var action = $(this).attr("action");
      var request = $.ajax({method: "post", url: action, data: postAnswer});
      request.done(function(responseData){
        $(".answers").append(responseData);
      });
    });





    $(".comment-answer form").on("submit", function(event) {
          event.preventDefault();
      var inputComment = $(this).serialize();
      var commentId = $(this).attr("action");
      var request = $.ajax({method: "post", url: commentId, data: inputComment});
      request.done(function(responseData){
        $(".all-comments").append(responseData);
        console.log(responseData)
      });
    });









});

