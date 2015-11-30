(function() {
  // 'use strict'
  var app = angular.module('appBuild')

  var reportController = function($scope, $http, serviceCall, $location, $routeParams, $rootScope, $window) {
    // $scope.msg = "Page loaded successfully"
    $scope.msg = 'Reports Page'
      // main controller page function
    $scope.page()

    // $scope.msg = $http.get(url)
    $scope.curNav = $location.path().substring(1)
      // console.log('page', $scope.curNav)

    $scope.allReports = []

    console.log("Route Params", $routeParams);

    // Getting list of reports 
    $scope.getReports = function() {
      $scope.dataObject.method = 'reports/getAllReports'
      $scope.dataObject.data.res = ''

      console.log("Getting Reports", $scope.dataObject);

      var dt = serviceCall.getService($scope.dataObject, function(res) {

        if (res.status == 'success') {
          // console.log("Response form the server is ", res)
          $scope.allReports = res
            // console.log('Report stype ', $scope.allReports)

          // console.log($scope.allReports.data)
          $scope.reportRow = []
          angular.forEach($scope.allReports.data, function(i, n) {
            // converting the dcItemList from ithe data to json object
            angular.forEach(appData.customers, function(a, b) {
              if (a.cid == i.customer) {
                i.customer = a;
              }
            });
            i.dcItemList = JSON.parse(i.dcItemList)
            $scope.reportRow.push(i)
          });
        }
      });

    }

    $scope.printIt = function() {
      var table = document.getElementByName('html').innerHTML;
      var myWindow = $window.open('', '', 'width=800, height=600');
      myWindow.document.write(table);
      myWindow.print();
    };

    // Getting the params
    // Mapping the data to show in params page
    $scope.recAction = $routeParams.act
    $scope.reportId = $routeParams.id
    $scope.rData = $scope.reportRow
    $scope.nrProductList;

    $scope.paramAction = function(data) {
      $rootScope.nrData = data
    }
    console.log('nrData', $rootScope.nrData)

    if ($scope.reportId != undefined) {
      // get data according to the 
      if ($rootScope.nrData != undefined) {

        // $scope.nrProductList = $rootScope.;

      }
    } else {
      window.location.hash = '#/reports'
    }

  }

  // Defining the controller
  app.controller('reportController', reportController)
}())