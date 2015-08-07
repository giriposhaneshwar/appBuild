(function () {
  // 'use strict'
  var app = angular.module('appBuild')

  var logoutController = function ($scope, $http, serviceCall, $location) {
    // Check login
    if(window.localStorage['inUser'] != 'undefined') {
      $scope.getOn = window.localStorage['inUser']
    } else {
      $scope.getOn = ''
    }

    if($scope.getOn.length == 0) {
      console.log($scope.getOn)
      window.location.hash = '#/login'
    } else {
      window.location.hash = '#/login'
      window.localStorage.clear()
    // window.localStorage.removeItem('user')
    }

    // main controller page function
    $scope.page()
  }

  // Defining the controller
  app.controller('logoutController', logoutController)
}())
