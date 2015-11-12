(function() {
  // 'use strict'
  var app = angular.module('appBuild')

  var cmController = function($scope, sTest, $http, serviceCall, $location) {
    $scope.msg = 'CM Page'

    // main controller page function
    $scope.page()

    // $scope.msg = $http.get(url)
    $scope.curNav = $location.path().substring(1)
    $scope.tabActive = 'addCustomer'

    // Customer Page Tab Functions
    $scope.addCustomerTab = function() {
      $scope.tabActive = 'addCustomer'
    }
    $scope.customerListTab = function() {
      // Acitvating the Tab
      $scope.tabActive = 'customerList'

      $scope.cList = appData.customers
    }
    if ($scope.tabActive == 'customerList') {
      $scope.customerListTab()
    }

    // Get List of Customers

    $scope.dataObject.method = 'customers/getList'
    $scope.dataObject.data.res = ''

    console.log('Sending object ', $scope.dataObject)

    var dt = serviceCall.getService($scope.dataObject, function(res) {
      $scope.msg = res
    })

    // Adding customer to database
    $scope.addCustomer = function(d, data) {
      d.preventDefault()

      // check whether the name is existing or not
      // if($scope.checkDuplicate(appData.customers, data) < 1){

      console.log('Adding Customer is ', $scope.dataObject, data, $scope.dcReport)


      // $scope.dataObject.data = $scope.dcReport
      $scope.dataObject.data.res = data;
      $scope.dataObject.method = 'customers/insertCustomer'

      console.log("Sending object to add customer", $scope.dataObject);

      var dt = serviceCall.getService($scope.dataObject, function(data) {
          $scope.msg = data
          console.log('data', data)
            // {status: "Success", message: "Data added successfully"}

          if (data.status == 'success') {
            console.log("Return Data", data)
              // Calling All Data
            $scope.requestData();
            $scope.customerListTab();
            // $scope.formCancel(d, data)
          } else {
            console.log(data)
              // Handle the errors here
          }
        })
        /*}else{
          console.log("Duplicates found");
        }*/


    }

    // Edit Customer 
    $scope.editCustomer = function(d, a, b) {
      console.log(d, a, b);
    }
  }

  // Defining the controller
  app.controller('cmController', cmController)
}())