$(document).ready(function(){
    //tooltip
    $("#title-help").tooltip({
	"placement": "left"
    });

    // scroll to top
    $("#scroll-topper").hide();
    $("#scroll-topper").click(function(){
	$("html, body").animate({ scrollTop: 0 }, 600);
    });

    // header collapser
    $("#collapse-header").click(function(){
	$("#main-nav").toggle();
	$(".breadcrumb-holder").toggle();
	$("#collapse-header span").toggleClass("glyphicon-chevron-up");
	$("#collapse-header span").toggleClass("glyphicon-chevron-down");
	if($("#collapse-header span").hasClass("glyphicon-chevron-down")){
	    $("body").animate({"padding-top": "50px"});
	}else{
	    $("body").animate({"padding-top": "124px"});
	}
    });

    // If the toolbar is not present then there should't be extra
    // padding on the body top
    $("body").css("padding-top", $("#main-header").height());


    // load all the sparklines
    $(".sparkline-holder").each(function(i, e){
	var data = $(e).attr("data-csv").split(",");
	var graph = $(e).attr("data-graph");
	var color = $(e).attr("data-color");

	if(color === "false"){
	    $(e).sparkline(data, {
		type: graph,
		barColor: '#2d2d2d',
		negBarColor: '#2d2d2d',
		zeroColor: '#2d2d2d',

		lineColor: '#2d2d2d',
		fillColor: '#eee',
		spotColor: '#2d2d2d',
		minSpotColor: '#2d2d2d',
		maxSpotColor: '#2d2d2d',
		highlightSpotColor: '#2d2d2d',
		highlightLineColor: '#2d2d2d',

		sliceColors: ["#000","#222","#444","#666","#888","#aaa"],

		tooltipOffsetX: 10,
		tooltipOffsetY: 10,
	    });
	}else{
	    $(e).sparkline(data, {
		type: graph,
		tooltipOffsetX: 10,
		tooltipOffsetY: 10,
	    });
	}
    });


    // remove flashed after a while
    var removeFlashes = setTimeout(function(){
	$(".alert-success").fadeOut();
	$(".alert-info").fadeOut();
	$(".alert-warning").fadeOut();
    }, 3000);
});


// show scroller
$(window).scroll(function(){
    if ($(this).scrollTop() > 100) {
        $("#scroll-topper").fadeIn();
    } else {
        $("#scroll-topper").fadeOut();
    }
});
