(function () {
  // 'use strict'
  var app = angular.module('appBuild')

  var cmController = function ($scope, sTest, $http, serviceCall, $location) {
    $scope.msg = 'CM Page'

    // main controller page function
    $scope.page()

    // $scope.msg = $http.get(url)
    $scope.curNav = $location.path().substring(1)

    // Get List of Customers
    var url = 'customer/'
    var method = 'getList'
    var data = {action: method}

    var dt = serviceCall.getService(url, data, function (res) {
      $scope.msg = res
    })
  }

  // Defining the controller
  app.controller('cmController', cmController)
}())
