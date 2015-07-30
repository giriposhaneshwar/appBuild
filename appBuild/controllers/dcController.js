(function () {
  // 'use strict'
  var app = angular.module('appBuild')

  var dcController = function ($scope, sTest, $http, serviceCall, $location) {
    // Local Storage Values set
    window.localStorage['customerRows'] = ''
    window.localStorage['productRows'] = ''
    // Global Defaults
    $scope.productLocal != {} ? window.localStorage['customerRows'] : {}
    $scope.customerLocal != {} ? window.localStorage['productRows'] : {}
    $scope.customerFormVal = {}

    // $scope.msg = "Page loaded successfully"
    var url = 'http://localhost/appBuildServer'
    $scope.msg = 'DC Form'

    // main controller page function
    $scope.page()

    // setting up the navigation menu
    $scope.curNav = $location.path().substring(1)
    // console.log("page", $scope.curNav)

    // Product List Holder
    if($scope.productLocal != null) {
      if(Object.keys($scope.productLocal).length > 0) {
        $scope.productList = window.localStorage['productRows']
      } else {
        $scope.productList = []
      }
    }

    // collecting the customer details and date

    $scope.setDateForm = function (val) {
      $scope.customerFormVal.date = val
      appData.customerFormVal = $scope.customerFormVal
    }
    $scope.setCustomerForm = function (val) {
      $scope.customerFormVal.customer = val
      appData.customerFormVal = $scope.customerFormVal
    }

    $scope.getProducts = appData.products

    $('.date').datetimepicker({
      'pickTime':false,
      'format' : 'DD-MM-YYYY'
    })
    $('.date').data('DateTimePicker').setMinDate(new Date())

    console.log($scope.getProducts)

    // restricting to the numbres only
    // $scope.onlyNumbers = /^\d+$/

    $scope.formSubmit = function (d, sData) {
      d.preventDefault()

      console.log(sData)

    /*var obj = ''
    var url = 'dcServer/dc/'

    var dt = serviceCall.getService(url, sData, function (data) {
      $scope.msg = data
      console.log('data', data)
    })*/
    }

    $scope.addProductRow = function (evt, pData) {
      evt.preventDefault()

      console.log(evt, pData)

      $scope.getSizeObject = Object.keys(pData).length

      if($scope.getSizeObject == 3) {
        $scope.productList.push(pData)
        window.localStorage['productRows'] = JSON.stringify($scope.productList)
        $scope.product = {}
      } else {
        angular.forEach($scope.product, function (a, b) {
          console.log(a, a.length, b, b.length)
        })
      }
    }

    $scope.editRow = function (evt, key, val) {
      evt.preventDefault()
      console.log(key, val)
    }

    $scope.delRow = function (evt, key, val) {
      evt.preventDefault()

      var index = $scope.productList.indexOf(val)
      $scope.productList.splice(index, 1)
      window.localStorage['productRows'] = JSON.stringify($scope.productList)
    }

    $scope.formCancel = function (evt, data) {
      evt.preventDefault()
    // $scope.productList.splice()
    }
    // console.log($scope.productList)

  }

  // Defining the controller
  app.controller('dcController', dcController)
}())
