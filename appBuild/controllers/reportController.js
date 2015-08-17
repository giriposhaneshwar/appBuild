(function () {
  // 'use strict'
  var app = angular.module('appBuild')

  var reportController = function ($scope, sTest, $http, serviceCall, $location) {
    // $scope.msg = "Page loaded successfully"
    $scope.msg = 'Reports Page'

    // main controller page function
    $scope.page()

    // $scope.msg = $http.get(url)
    $scope.curNav = $location.path().substring(1)
    // console.log('page', $scope.curNav)

    $scope.allReports = []

    $scope.getReports = function () {
      $scope.dataObject.method = 'reports/getAllReports'
      $scope.dataObject.data.res = ''

      var dt = serviceCall.getService($scope.dataObject, function (res) {
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
    }
    $scope.getReports()

  }

  // Defining the controller
  app.controller('reportController', reportController)
}())
