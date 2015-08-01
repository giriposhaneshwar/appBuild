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

    $scope.addCustomer = function(d, data){
      d.preventDefault();

      $scope.company = {};
      console.log("Adding customer here", d, data);
      

      var url = ''
      var obj = {}
      obj.method = 'customer/addCustomer'
      obj.data = data

      console.log('Sending Data', obj)

      var dt = serviceCall.getService(url, obj, function (res) {
        $scope.msg = res
        console.log('DATA GET \n', res)

        /*if(res.result == 'success') {
          console.log('data', res)
          $scope.er = true
          $scope.resText = res.result
          console.log(res)
          window.localStorage['inUser'] = res.data.username
          window.localStorage['user'] = res.data.personName
          window.location.hash = '#/dashboard'
        } else {
          $scope.er = false
          $scope.resText = 'Failed to login'
        // window.location.hash = '#/login'
        }*/

      })


    }

  }

  // Defining the controller
  app.controller('cmController', cmController)
}())
