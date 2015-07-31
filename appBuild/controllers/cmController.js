(function () {
  // 'use strict'
  var app = angular.module('appBuild')

  var cmController = function ($scope, sTest, $http, serviceCall, $location) {
    $scope.msg = 'CM Page'

    // main controller page function
    $scope.page()

    // $scope.msg = $http.get(url)
    $scope.curNav = $location.path().substring(1)
    $scope.tabActive = 'customerList'

    // Customer Page Tab Functions
    $scope.addCustomerTab = function () {
      $scope.tabActive = 'addCustomer'
    }
    $scope.customerListTab = function () {
      // Acitvating the Tab
      $scope.tabActive = 'customerList'

      $scope.cList = appData.customers
    }
    if($scope.tabActive == 'customerList') {
      $scope.customerListTab()
    }

    // Get List of Customers
    var url = ''
    var obj = {}

    obj.method = 'customers/getList'
    obj.data = ''

    console.log('Sending object ', obj)

    var dt = serviceCall.getService(url, obj, function (res) {
      $scope.msg = res
    })

  }

  // Defining the controller
  app.controller('cmController', cmController)
}())
