$(function() {
  $(".feed-title").click(function() {
    var $this = $(this);
    var feedId = $this.data("feed-id");

    $.ajax({
      url: "/feeds/" + feedId + "/strips/random",
      type: "GET",
      dataType: "json",
      success: function(data) {
        console.log(data);
      }
    });
  });
});