(function () {
  // 'use strict'
  var app = angular.module('appBuild')

  var reportController = function ($scope, sTest, $http, serviceCall, $location) {
    // $scope.msg = "Page loaded successfully"
    $scope.msg = 'Reports Page'
    // main controller page function
    $scope.page()
    // $scope.msg = $http.get(url)
    $scope.curNav = $location.path().substring(1)
    console.log('page', $scope.curNav)

  }

  // Defining the controller
  app.controller('reportController', reportController)
}())
