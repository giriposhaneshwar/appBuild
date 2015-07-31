(function () {
  // 'use strict'
  var app = angular.module('appBuild')

  var dashboardController = function ($scope, sTest, $http, serviceCall, $location) {
    // $scope.msg = "Page loaded successfully"
    $scope.msg = 'Dashboard Page'

    // Request the server
    var url = ''
    var obj = {}
    obj.method = 'dashboard/getStats'
    obj.data = ''

    console.log('Sending data', obj)

    var dt = serviceCall.getService(url, obj, function (data) {
      $scope.msg = data
      console.log('dashboard/getStats', data)
    })

    // main controller page function
    $scope.page()
  }

  // Defining the controller
  app.controller('dashboardController', dashboardController)
}())
