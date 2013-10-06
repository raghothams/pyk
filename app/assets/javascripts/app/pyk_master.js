$(document).ready(function(){

	$("#tooltip-below").tooltip({
	"placement": "bottom"
    });

	//textarea increase / decrease
	$(".text_area_animate").focus(function() {

	      var val_length = $(this).val().length;
	      var size = $(this).attr("expand-height");

	      if (val_length <= 0 ) {
	        $(this).animate({"height": size}, "fast" );
	      }
	    }
	  );

	  $(".text_area_animate").focusout(function() {

	      var val_length = $(this).val().length;
	      var row = $(this).attr("row"); // 1 row = 16px
	      var size = $(this).attr("expand-height");

	      if (val_length <= 0 ) {

	        $(this).animate({"height": "30px" }, "fast" );
	      }

	    }
	  );
	
	//form hint

	  $(".form-control").focus(function() {
	    var text_hint = $(this).attr("hint");
	    if (text_hint.length > 0) {
	      var text_id = $(this).attr("id");
	      var text_hint = $(this).attr("hint");
	      $("#" + text_id).after("<span class='input-error-hint'>"+ text_hint+ "</span>");
	      $(".input-error-hint").css("font-size", "11px").css("color", "grey");
	    }
	  });

Tinycon.setOptions({
    width: 7,
    height: 9,
    font: '10px arial',
    colour: '#ffffff',
    background: '#549A2F',
    fallback: true
});