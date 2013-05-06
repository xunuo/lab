// npm install wind

var Wind = require("wind");


/* demo-1 */
/*
function loadData(cb) {
  setTimeout(function() { cb(null, "blabla", "blabla333"); }, 2000);
}
function loadError(cb) {
  setTimeout(function() { cb("Some error"); }, 2000);
}
 


var loadDataAsync = Wind.Async.Binding.fromStandard(loadData);
var loadErrorAsync = Wind.Async.Binding.fromStandard(loadError);


var someTestFunction = eval(Wind.compile('async', function() {


  var data = $await(loadDataAsync());
  console.log('Some Result: ' + data);


  var data2 = $await(loadDataAsync());

console.log('Some Result: ' + data2);

  try {
    $await(loadErrorAsync());
  } catch(e) {
    console.log('Some Error Occurred: ' + e);
  }
}));
 
someTestFunction().start();
*/

/* ------------------------ */

/* demo-2 */
// from : http://windjs.org/cn/docs/async/helpers.html

var binding = Wind.Async.Binding.fromCallback;

var load1 = binding(function(finishCallback) {
  setTimeout(function() { finishCallback("finish blabla"); }, 2000);
});

var load2 = binding(function(finishCallback) {
  setTimeout(function() { finishCallback("finish abababa"); }, 2000);
});
 

var groupLoad = eval(Wind.compile('async', function() {
	
	var result1 = $await(load1());
	if(result1){
		console.log(result1);
	}
	// $await(Wind.Async.sleep(1000));

	var result1 = $await(load1());
	if(result1){
		console.log(result1);
	}


	var result1 = $await(load1());
	if(result1){
		console.log(result1);
	}

	var result2 = $await(load2());
	if(result2){
		console.log(result2);
	}

}));


groupLoad().start();
