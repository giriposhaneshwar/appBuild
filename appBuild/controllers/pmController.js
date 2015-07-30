(function(){
	// 'use strict';
	var app = angular.module("appBuild");

	var pmController = function($scope, sTest, $http, serviceCall, $location){
		// Check login
		if(window.localStorage['login'] != 'undefined'){
			$scope.getOn = window.localStorage['login'];
		}else{
			$scope.getOn = "";
		}

		if($scope.getOn.length == 0){
			console.log($scope.getOn);
			window.location.hash = "#/login";
		}
		////// Login Check End

		
		// $scope.msg = "Page loaded successfully";
		$scope.msg = "PM Page";
		// main controller page function
		$scope.page();
		// $scope.msg = $http.get(url);
		$scope.curNav = $location.path().substring(1);
		console.log("page", $scope.curNav);	

	}


	// Defining the controller
	app.controller("pmController", pmController);
}());