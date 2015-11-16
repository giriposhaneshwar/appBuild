(function(){
	
	var app = angular.module("appBuild");

	app.service("sTest", function(){
		// console.log("sample test service is intergrated");
		return {
			t : "message from t object"
		}
	});
}());