(function () {
  // 'use strict'
  var app = angular.module('appBuild')

  var reportController = function ($scope, sTest, $http, serviceCall, $location, $routeParams, $rootScope) {
    // $scope.msg = "Page loaded successfully"
    $scope.msg = 'Reports Page'
    // main controller page function
    $scope.page()

    // $scope.msg = $http.get(url)
    $scope.curNav = $location.path().substring(1)
    // console.log('page', $scope.curNav)

    $scope.allReports = []

    // Getting list of reports 
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
          angular.forEach(appData.customers, function(a, b){
            if(a.cid == i.customer){
              i.customer = a.name;
            }
          });
          i.dcItemList = JSON.parse(JSON.parse(i.dcItemList))
          $scope.reportRow.push(i)
        })
      })
    }

    // Getting the params
    // Mapping the data to show in params page
    $scope.recAction = $routeParams.act
    $scope.reportId = $routeParams.id
    $scope.rData = $scope.reportRow

    $scope.paramAction = function (data) {
      $rootScope.nrData = data
    }
    console.log('nrData', $rootScope.nrData)

    if($rootScope.nrData == undefined) {
      window.location.hash = '#/reports'
    }

  }

  // Defining the controller
  app.controller('reportController', reportController)
}())
