(function() {
  // 'use strict'
  var app = angular.module('appBuild')

  var cmController = function($scope, $http, serviceCall, $location, $routeParams, $rootScope) {
    $scope.msg = 'CM Page'

    // main controller page function
    $scope.page()

    // $scope.msg = $http.get(url)
    $scope.curNav = $location.path().substring(1)
    $scope.tabActive = 'customerList'

    // Get List of Customers
    $scope.getCustomers = function() {
      $scope.dataObject.method = 'customers/getList'
      $scope.dataObject.data.res = ''

      // console.log('Sending object ', $scope.dataObject)

      var dt = serviceCall.getService($scope.dataObject, function(res) {
        $scope.msg = res

        if (res.status == "success") {
          appData.customers = res.data;
          $scope.cList = res.data;
          // console.log("Response Data From Server ::::: ", res);
        }
      })
    }
    $scope.getCustomers();



    // Customer Page Tab Functions
    $scope.addCustomerTab = function() {
      $scope.tabActive = 'addCustomer'
    }
    $scope.customerListTab = function() {
      // Acitvating the Tab
      $scope.tabActive = 'customerList'

      $scope.getCustomers();
      $scope.cList = appData.customers
    }
    if ($scope.tabActive == 'customerList') {
      $scope.customerListTab()
    }



    // Adding customer to database
    $scope.addCustomer = function(d, data) {
      d.preventDefault()

      // check whether the name is existing or not
      // console.log('Adding Customer is ', $scope.dataObject, data, $scope.dcReport)


      // $scope.dataObject.data = $scope.dcReport
      $scope.dataObject.data.res = data;
      if ('cid' in data) {
        // console.log("this is update statement", data);
        $scope.dataObject.method = 'customers/updateCustomer'
      } else {
        $scope.dataObject.method = 'customers/insertCustomer'
          // console.log("this is Adding State", data);
      }

      console.log("Sending object to add customer", $scope.dataObject);

      var dt = serviceCall.getService($scope.dataObject, function(data) {
        $scope.msg = data
        console.log('data', data)
          // {status: "Success", message: "Data added successfully"}

        console.log("Return Data", data)
        if (data.status == 'success') {
          // Calling All Data
          $scope.requestData();
          window.location.href = '#/customers';
          $scope.customerListTab();
          // $scope.formCancel(d, data)
        } else {
          console.log(data)
            // Handle the errors here
        }
      });
    }

    // Edit Customer 
    $scope.reportId = $routeParams.id

    $scope.paramAction = function(data) {
      // delete data.cid;
      $rootScope.editCust = data;
      // console.log($rootScope.editCust);
    }

    if ($scope.reportId != undefined) {
      // get data according to the 
      if ($rootScope.editCust != undefined) {

        // $scope.nrProductList = $rootScope.;
        $scope.company = $rootScope.editCust;

      }
    } else {
      window.location.hash = '#/customers'
    }

    // onclick cancel at form
    $scope.addCancel = function(e, data) {
      window.location.href = '#/customers';
    }

    // Deleting the customer
    $scope.delCustomer = function(evt, data) {
      // $scope.dataObject.data = $scope.dcReport
      $scope.dataObject.data.res = data;
      $scope.dataObject.method = 'customers/deleteCustomer'
      

      console.log("Sending object to add customer", $scope.dataObject);

      var dt = serviceCall.getService($scope.dataObject, function(data) {
        // $scope.msg = data

        if (data.status == 'success') {
          // Calling All Data
          console.log("Return Data", data)
          $scope.requestData();
          $scope.customerListTab();
          // window.location.href = '#/customers';
          // $scope.formCancel(d, data)
        } else {
          console.log("Failed Data", data)
            // Handle the errors here
        }
      });
    }

  }

  // Defining the controller
  app.controller('cmController', cmController)
}())