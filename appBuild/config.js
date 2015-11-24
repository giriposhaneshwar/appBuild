(function () {
  // 'use strict'
  var app = angular.module('appBuild')

  var conf = function ($scope, $http, serviceCall, $location) {
    // Configuration Settings
    $scope.pageTitle = 'Application'

    // Web
    $scope.webNav = ['home', 'aboutus', 'ourProducts', 'ourServices', 'contactus', 'login']

    // Application
    $scope.appNav = ['dashboard', 'dc', 'customers', 'products', 'reports', 'logout']

  }

  

  // Defining the controller
  app.controller('conf', conf)
}())
