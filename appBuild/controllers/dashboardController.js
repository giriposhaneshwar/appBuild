(function () {
  // 'use strict'
  var app = angular.module('appBuild')

  var dashboardController = function ($scope,  $http, serviceCall, $location) {
    // $scope.msg = "Page loaded successfully"
    $scope.msg = 'Dashboard Page'

    // Request the server
    $scope.requestData();

    // main controller page function
    $scope.page()
  }

  // Defining the controller
  app.controller('dashboardController', dashboardController)
}())
