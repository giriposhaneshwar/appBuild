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
        // console.log("Response form the server is ", res)
        $scope.allReports = res
        // console.log('Report stype ', $scope.allReports)

        // console.log($scope.allReports.data)
        $scope.reportRow = []

        angular.forEach($scope.allReports.data, function (i, n) {
          // converting the dcItemList from ithe data to json object
          i.dcItemList = JSON.parse(JSON.parse(i.dcItemList))

          $scope.reportRow.push(i)
        })
        console.log($scope.reportRow)
      })
    }
    $scope.getReports()

  }

  // Defining the controller
  app.controller('reportController', reportController)
}())
