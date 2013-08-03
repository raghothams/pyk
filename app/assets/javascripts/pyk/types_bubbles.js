
var custom_bubble_chart = (function(d3, CustomTooltip
  ) {
  "use strict";

  var width = 800,
      height = 600,
      tooltip = CustomTooltip("gates_tooltip", 240),
      layout_gravity = -0.01,
      damper = 0.1,
      nodes = [],
      year_centers = [],
      years_x = [],
      vis, force, circles, radius_scale;

  var center = {x: width /2, y: height/3};


function find_unique_elements(data, param, deltaWidthParam) {
    var birthDates = {};
    $.each(data, function() {
      if (!birthDates[this[param]])
        birthDates[this[param]] = []; 
      birthDates[this[param]].push(this);
    })
    var length = 0;
    for (var d in birthDates) {
      length ++;
    };
    var rows = Math.floor(length / 3) + 1;
    var col =3;
    var deltaWidth = (height /rows);
    var h = deltaWidthParam;
    for(var d in birthDates) {
      var key = d;
      var w;
      if (col > 0) {
        switch(col) {
          case 3 : w = width /5; break;
          case 2 : w = width /2; break;
          case 1 : w = 4 * width /5;break;

        }
      year_centers[key] = {
          x: w,
          y: h
      }
      years_x[key] = {
          x:w
      }
      console.log("key:"+ key + " x:" + w+ "y:"+h);
      if (col == 3) {
        rows --; 

      }
      col --;
      if (col == 0) {col = 3;h += deltaWidth;}
      }

    }
}

  function custom_chart(data, type, divId) {
    var max_amount = d3.max(data, function(d) { return parseInt(d.weight/10, 10); } );
    radius_scale = d3.scale.pow().exponent(0.5).domain([0, max_amount]).range([10, 100]);
    
    //create node objects from original data
    //that will serve as the data behind each
    //bubble in the vis, then add each node
    //to nodes to be used later
    data.forEach(function(d){
      var node = {
        id: d.id,
        radius: radius_scale(parseInt(d.weight/10, 10)),
        value: d.weight,
        name: d.name,
        visits: d.visits,
        calls: d.calls,
        leads: d.leads,
        color: d.color,
        genre: d.genre,
		genre2:d.genre2,
        x: Math.random() * 900,
        y: Math.random() * 800
      }
      nodes.push(node);
    });

    nodes.sort(function(a, b) {return b.value- a.value; });

    vis = d3.select("#"+ divID).append("svg") 
                .attr("width", width)
                .attr("height", height)
                .attr("id", "svg_vis");

    circles = vis.selectAll("circle")
                 .data(nodes, function(d) { return d.id ;});

    circles.enter().append("circle")
      .attr("r", 0)
      .attr("fill", function(d) { return d.color ;})
      .attr("stroke-width", 2)
      .attr("stroke", function(d) {return d3.rgb(d.color).darker();})
      .attr("id", function(d) { return  "bubble_" + d.id; })
      .on("mouseover", function(d, i) {show_details(d, i, this);} )
      .on("mouseout", function(d, i) {hide_details(d, i, this);} )

    circles.transition().duration(2000).attr("r", function(d) { return d.radius; });
  }

  function charge(d) {
    return -Math.pow(d.radius, 2.0) / 8;
  }

  function start() {
    force = d3.layout.force()
            .nodes(nodes)
            .size([width, height]);
  }

  function display_group_all() {
    force.gravity(layout_gravity)
         .charge(charge)
         .friction(0.9)
         .on("tick", function(e) {
            circles.each(move_towards_center(e.alpha))
                   .attr("cx", function(d) {return d.x;})
                   .attr("cy", function(d) {return d.y;});
         });
    force.start();
    hide_years();
  }

  function move_towards_center(alpha) {
    return function(d) {
      d.x = d.x + (center.x - d.x) * (damper + 0.02) * alpha;
      d.y = d.y + (center.y - d.y) * (damper + 0.02) * alpha;
    };
  }

  function display_by_year(type) {
    force.gravity(layout_gravity)
         .charge(charge)
         .friction(0.9)
        .on("tick", function(e) {
          circles.each(move_towards_year(e.alpha, type))
                 .attr("cx", function(d) {return d.x;})
                 .attr("cy", function(d) {return d.y;});
        });
    force.start();
    display_years();
  }

  function move_towards_year(alpha, type1) {
    return function(d) {
      var key1 = "";
      for(var k in d) {
        if (type1 == k) {
          key1 = d[k];
          break;
        }
      }
      var target = year_centers[key1];
      d.x = d.x + (target.x - d.x) * (damper + 0.02) * alpha * 1.1;
      d.y = d.y + (target.y - d.y) * (damper + 0.02) * alpha * 1.1;
    };
  }


  function display_years() {
      var years_data = d3.keys(year_centers);
      var years = vis.selectAll(".years")
                 .data(years_data);

      years.enter().append("text")
                   .attr("class", "years")
                   .attr("x", function(d) { return year_centers[d].x; }  )
                   .attr("y", function(d) { return year_centers[d].y;})
                   .attr("text-anchor", "middle")
                   .attr("fill", "white")
                   .text(function(d) { return d;});

  }

  function hide_years() {
      var years = vis.selectAll(".years").remove();
  }


  function show_details(data, i, element) {
    d3.select(element).attr("stroke", "black");
    var content = "<h3>" + data.name + "</h3>";
    content +="<span class=\"name\">Visits:</span><span class=\"value\"> " + data.visits + "</span><br/>";
    content +="<span class=\"name\">Calls:</span><span class=\"value\"> " + data.calls + "</span><br/>";
    content +="<span class=\"name\">Leads:</span><span class=\"value\"> " + data.leads + "</span><br/>";

    tooltip.showTooltip(content, d3.event);
  }

  function hide_details(data, i, element) {
    d3.select(element).attr("stroke", function(d) { return d3.rgb(d.color).darker();} );
    tooltip.hideTooltip();
  }

  var my_mod = {};
  my_mod.init = function (_data, type, deltaWidthParam,divId) {
    custom_chart(_data, type, divId);
    find_unique_elements(_data, type, deltaWidthParam);
    start();
  };

  my_mod.display_all = display_group_all;
  my_mod.display_year = display_by_year;
  my_mod.toggle_view = function(view_type, type) {
    if (view_type == 'year') {
      display_by_year(type);
    } else {
      display_group_all();
      }
    };

  return my_mod;
})(d3, CustomTooltip
);
