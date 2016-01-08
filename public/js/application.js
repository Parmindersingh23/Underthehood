$(document).ready(function() {
   $(".form-answer form").on("submit", function(event){
      event.preventDefault();
      var postAnswer = $(this).serialize();
      var action = $(this).attr("action");
      var request = $.ajax({method: "post", url: action, data: postAnswer});
      request.done(function(responseData){
        $(".answers").append(responseData);
      });
    });

    $(".comment-answer form").on("submit", function(event){
      event.preventDefault();
      var inputComment = $(this).serialize();
      var commentId = $(this).attr("action");
      var request = $.ajax({method: "post", url: commentId, data: inputComment});
      request.done(function(responseData){
        $(".all-comments").append(responseData);
        console.log(responseData)
      });
    });




    $(".answers a:first").on("click", function(event){
      event.preventDefault();
      var voteId = $(this).attr("href");
      var request = $.ajax({method: "post", url: voteId});
      request.done(function(responseData){
         var data = JSON.parse(responseData)
          $(".points").text(data.value);
      });
    });


     $(".answers a:last").on("click", function(event){
        event.preventDefault();
        var voteId = $(this).attr("href");
        var request = $.ajax({method: "post", url: voteId});
        request.done(function(responseData){
          var data = JSON.parse(responseData)
          $(".points").text(data.value);
        });
      });

});

