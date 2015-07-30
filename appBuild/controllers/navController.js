(function(){
	// 'use strict';
	var app = angular.module("appBuild");

	var navController = function($scope, sTest, $http, serviceCall, $location, $window){
		$scope.msg = "Navigation container";

		$scope.curNav;


		$scope.navData = [
			{'Dashboard': "#/dashboard"},
			{'Delivery Challan': "#/dc"},
			{'Customer List': "#/customers"},
			{'Products List': "#/products"},
			{'Report': "#/reports"},
			{'Logout': "#/logout"}
		];

		$scope.navDataBasic = [
			{'Home': "#/home"},
			{'About Us': "#/aboutus"},
			{'Products': "#/ourProducts"},
			{'Services': "#/ourServices"},
			{'Contact Us': "#/contactUs"},
			{'Login': "#/login"}
		];

	}


	// Defining the controller
	app.controller("navController", navController);
}());