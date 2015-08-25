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

    $scope.dataObject.method = 'customers/getList'
    $scope.dataObject.data.res = ''

    console.log('Sending object ', $scope.dataObject)

    var dt = serviceCall.getService($scope.dataObject, function (res) {
      $scope.msg = res
    })

    // Adding customer to database
    $scope.addCustomer = function (d, data) {
      d.preventDefault()
      console.log('Adding Customer is ', d, data, $scope.dcReport)


       $scope.dataObject.data = $scope.dcReport
       $scope.dcReport.data.res = data;
      $scope.dataObject.method = 'customers/insertCustomer'

      var dt = serviceCall.getService($scope.dataObject, function (data) {
        $scope.msg = data
        console.log('data', data)
        // {status: "Success", message: "Data added successfully"}

        if(data.status == 'success') {
          alert(data.message)
          $scope.formCancel(d, data)
        } else {
          // Handle the errors here
        }
      })


    }
  }

  // Defining the controller
  app.controller('cmController', cmController)
}())
