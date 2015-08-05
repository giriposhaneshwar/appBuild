(function () {
  // 'use strict'
  var app = angular.module('appBuild')

  var dashboardController = function ($scope, sTest, $http, serviceCall, $location) {
    // $scope.msg = "Page loaded successfully"
    $scope.msg = 'Dashboard Page'

    // Request the server
    $scope.dataObject.method = 'dashboard/getStats'
    $scope.dataObject.data.res = ''

    console.log('Sending data', $scope.dataObject)

    var dt = serviceCall.getService($scope.dataObject, function (data) {
      $scope.msg = data
      console.log('dashboard/getStats', data)
    })

    // main controller page function
    $scope.page()
  }

  // Defining the controller
  app.controller('dashboardController', dashboardController)
}())
