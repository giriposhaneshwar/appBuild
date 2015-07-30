(function () {
  // 'use strict'
  var app = angular.module('appBuild')

  var loginController = function ($scope, sTest, $http, serviceCall, $location) {
    // Check login
    $scope.getOn = window.localStorage['user']
    // console.log($scope.getOn)

    if($scope.getOn != undefined) {
      if($scope.getOn.length == 0) {
        window.localStorage.removeItem('user')
        window.localStorage.removeItem('login')
        window.location.hash = '#/login'
      } else {
        if(window.localStorage['user'] == undefined && window.localStorage['login'] == undefined) {
          window.localStorage.removeItem('user')
          window.localStorage.removeItem('login')
        }
        console.log($scope.getOn)
        window.location.hash = '#/dashboard'
      }
    } else {
      console.log('scope is ', $scope.getOn)
    }

    // $scope.msg = "Page loaded successfully"
    $scope.msg = 'Login Page'
    // $scope.msg = $http.get(url)
    // window.location.hash = '/home'

    // main controller page function
    $scope.page()

    $scope.login = function (d, data) {
      d.preventDefault()
      // console.log(d, data)

      var url = ''
      var obj = {}
      obj.method = 'login/loginUser'
      obj.data = data

      console.log('Sending Data', obj)

      var dt = serviceCall.getService(url, obj, function (res) {
        $scope.msg = res
        console.log('DATA GET \n', res)

        if(res.result == 'success') {
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
        }

      })

      // $scope.resText = "Trying to login"

    }
  }

  // Defining the controller
  app.controller('loginController', loginController)
}())
