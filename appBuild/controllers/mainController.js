(function () {
  // 'use strict'
  var app = angular.module('appBuild')

  var mainController = function ($scope, sTest, $http, serviceCall, $location) {
    // $scope.msg = "Page loaded successfully"
    // $scope.msg = $http.get(url)

    // get preset page
    // console.log("$scope.webNav", $scope.webNav)
    // console.log("$scope.appNav", $scope.appNav)

    // Check login
    if(window.localStorage['login'] != 'undefined') {
      $scope.getOn = window.localStorage['user']
    } else {
      $scope.getOn = ''
    }

    if($scope.getOn == null) {
      console.log($scope.getOn)
      window.location.hash = '#/login'
    }
    // //// Login Check End

    // detect the page actions and pate title
    $scope.page = function () {
      var path = window.location.hash
      $scope.linkLoc = path.substring(2)

      angular.forEach($scope.webNav, function (i, n) {
        var link = path.substring(2)
        // console.log(i, n, path)
        if(link == i) {
          $scope.inLoc = 'web'
        }
      })

      // detect the active link
      angular.forEach($scope.appNav, function (i, n) {
        var link = path.substring(2)
        // console.log(i, n, link)

        if(link == i) {
          // console.log(link, i, " Are matched")
          $scope.inLoc = 'app'
          $scope.setActive = 'active'
        } else {
          $scope.setActive = 'inactive'
        // console.log(link, i, " Are Not matched")
        }
      })

      if($scope.inLoc == 'web') {
        // console.log("I am at web side")
        $scope.path = 'out'
      }else if($scope.inLoc == 'app') {
        // console.log("This is application")
        $scope.path = 'in'
      }

      // Logged user information pulling form the local store
      $scope.logged = window.localStorage['user']
      if($scope.logged != undefined && $scope.logged != '') {
        $scope.userLogged = $scope.logged
      // console.log("From nav controller", window.localStorage['user']);       
      }

      // if logged values are undefined then removing the local store
      if(window.localStorage['user'] == undefined && window.localStorage['login'] == undefined) {
        window.localStorage.removeItem('user')
        window.localStorage.removeItem('login')
      }
    }

    // Loading the list of products and customers
    $scope.getList = function () {
      var url = ''
      var obj = {}
      obj.method = 'getdata/getList'
      obj.data = null

      console.log('Sending Data', obj)

      var dt = serviceCall.getService(url, obj, function (res) {
        console.log('getdata/getList\n', res)
        appData.products = res.productList
        appData.customers = res.customerList
      })
    }
    $scope.getList()

  // setting up the navigation menu
  // $scope.page()
  }

  // Defining the controller
  app.controller('mainController', mainController)
}())
