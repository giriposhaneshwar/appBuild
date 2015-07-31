(function () {
  // 'use strict'
  var app = angular.module('appBuild')

  var pmController = function ($scope, sTest, $http, serviceCall, $location) {
    // $scope.msg = "Page loaded successfully"
    $scope.msg = 'PM Page'
    // main controller page function
    $scope.page()
    // $scope.msg = $http.get(url)
    $scope.curNav = $location.path().substring(1)
    console.log('page', $scope.curNav)

    // Get List of Customers
    var url = ''
    var obj = {}

    obj.method = 'products/getStats'
    obj.data = ''

    console.log('Sending object ', obj)

    var dt = serviceCall.getService(url, obj, function (res) {
      $scope.msg = res
    })

  }

  // Defining the controller
  app.controller('pmController', pmController)
}())
