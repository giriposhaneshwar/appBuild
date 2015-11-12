(function () {
  // 'use strict'
  var app = angular.module('appBuild')

  var homeController = function ($scope, sTest, $http, serviceCall, $location) {
    // $scope.msg = "Page loaded successfully"
    $scope.msg = 'Home Page'
    // $scope.msg = $http.get(url)

    /*var obj = ""
    var url = "dcServer/home"
    //service call
    var dt = serviceCall.getService(url, {id:152, name:'giriy'}, function(data){
    		$scope.msg = data
    		console.log("data", data);		
    	});*/

    

    $scope.page()

  }

  // Defining the controller
  app.controller('homeController', homeController)
}())
