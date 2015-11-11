(function() {
  // 'use strict'
  var app = angular.module('appBuild')

  var pmController = function($scope, sTest, $http, serviceCall, $location) {
      // $scope.msg = "Page loaded successfully"
      $scope.msg = 'PM Page'
        // main controller page function
      $scope.page()
        // $scope.msg = $http.get(url)
      $scope.curNav = $location.path().substring(1)
      console.log('page', $scope.curNav)

      // Get List of Customers
      $scope.dataObject.method = 'products/getStats'
      $scope.dataObject.data.res = {}
      console.log('Sending object ', $scope.dataObject)
      var dt = serviceCall.getService($scope.dataObject, function(res) {
        $scope.msg = res
      });

      // Default Activating the Products List
      $scope.tabActive = 'productsList'

      // Adding Product
      $scope.addProductTab = function() {
        $scope.tabActive = 'addProduct';
      }

      // Listing the Products
      $scope.productsListTab = function() {
        $scope.tabActive = 'productsList';
        $scope.pList = appData.products;
      }

      if ($scope.tabActive == 'productsList') {
        $scope.productsListTab()
      }


    } // End Variable "pmContainer"


  // Defining the controller
  app.controller('pmController', pmController)
}())