var svg = d3.select("body").append("svg").attr("height","100%").attr("width","100%");

var parseDate = d3.timeParse("%m/%d/%Y");

d3.csv("prices.csv")
    .row(function(d){ return {month: parseDate(d.month), price:Number(d.price.trim().slice(1))}; })
    .get(function(error,data){

//console.log(data);

    });


d3.tsv("data.tsv")
    .row(function(d){ return {month: parseDate(d.month), price:Number(d.price.trim().slice(1))}; })
    .get(function(error,data){

//console.log(data);

    });

// var psv = d3.dsvFormat("|");
// d3.text("data.txt")
//     .get(function(error,data){

//       var rows = psv.parse(data);
//       var newRows = [];
//       for (var p=0; p<rows.length; p++) {
//         newRows.push({month: parseDate(rows[p].month), price:Number(rows[p].price.trim().slice(1))});
//       }
// //console.log(newRows);
//     });




var a = [];


var height = 200;
var width = 500;
var margin = {left: 50,right:50,top:40,bottom:0};

var tree = d3.tree().size([width,height]);

var svg = d3.select('body').append('svg').attr('width','100%').attr('height','100%');
var chartGroup = svg.append('g').attr('transform','translate('+margin.left+','+margin.top+')');

//d3.json('expected-evolution-of-the-population-of-brussels-with-growth.json').get(function(error,data){

// console.log(data[0]);
// var root = d3.hierarchy(data);
// tree(root);
// console.log(root);
// chartGroup.selectAll("circle")
//   .data(root.descendants())
//   .enter().append("circle")
//           .attr("cx",function(d){ return d.x; })
//           .attr("cy",function(d){ return d.y; })
//           .attr("r","5");

// chartGroup.selectAll("path")
//   .data(root.descendants().slice(1))
//   .enter().append("path")
//           .attr("class","link")
//           .attr("d",function(d){ return "M"+d.x+","+d.y+"C"+d.x+","+(d.parent.y+d.y)/2+" "+d.parent.x+","+(d.y+d.parent.y)/2+" "+d.parent.x+","+d.parent.y; });
// });




d3.json("expected-evolution-of-the-population-of-brussels-with-growth.json").get(function(error,data){

    console.log(data);
//  data.forEach(function(d,i){
//      //console.log(d.fields.solde_naturel + " " + i);
    
//      var solde_nat = d.fields.solde_naturel;
//      var itterate = i;
//      b = {
//         'x': 50 + (itterate*5),
//         'y': data[itterate].fields.solde_naturel/5
//      };
    
//      a.push(b);
    
//      svg.append("line")
//                 .attr("x1", 50 + (itterate*100))
//                 .attr("stroke-width","10")
//                 .attr("y1",function(d,i){ return 600; })
//                 .attr("x2",function(d){ return 50 + (itterate*100); })
//                 .attr("y2",function(d,i){ return (data[itterate].fields.naissances/5); });

//                 svg.append("line")
//                 .attr("x1", 60 + (itterate*100))
//                 .attr("stroke-width","10")
//                 .attr("y1",function(d,i){ return 600; })
//                 .attr("x2",function(d){ return 60 + (itterate*100); })
//                 .attr("y2",function(d,i){ return (data[itterate].fields.immigration/1000); });

                
//  })
 //console.log(data[0].fields);

 //console.log("hier" + data.fields.solde_naturel);

 var interpolateTypes = [d3.curveLinear,d3.curveNatural,d3.curveStep, d3.curveBasis, d3.curveBundle,d3.curveCardinal];
 var line = d3.line()
                         .x(function(d,i){ return d.x; })
                         .y(function(d,i){ return d.y; })
                         .curve(interpolateTypes[1]);
 
                         console.log(a);
 svg.append("path")
               .attr("fill","none")
               .attr("stroke","blue")
               .attr("d",line(a));

 
});

// var newX = 300;
// var dataArray = a;


//var tree = d3.tree().size([width,height]);

//var svg = d3.select('body').append('svg').attr('width','100%').attr('height','100%');
//var chartGroup = svg.append('g').attr('transform','translate('+margin.left+','+margin.top+')');

