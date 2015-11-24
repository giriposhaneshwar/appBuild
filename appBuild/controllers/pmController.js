(function() {
  // 'use strict'
  var app = angular.module('appBuild')

  var pmController = function($scope,  $http, serviceCall, $location) {
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
      $scope.tabActive = 'addProduct'

      // Adding Product
      $scope.addProductTab = function() {
        $scope.tabActive = 'addProduct';
      }

      // Listing the Products
      $scope.productsListTab = function() {
        $scope.tabActive = 'productsList';
        $scope.pList = appData.products;
      }

      // Adding New Product
      $scope.addProduct = function(d, data) {
        console.log(d, data);

        // check whether the name is existing or not
        // if ($scope.checkDuplicate(appData.products, data) < 1) {

          console.log('Adding Product is ', $scope.dataObject, data)


          // $scope.dataObject.data = $scope.dcReport
          $scope.dataObject.data.res = data;
          $scope.dataObject.method = 'products/insertProduct'

          console.log("Sending object to add Product", $scope.dataObject);

          var dt = serviceCall.getService($scope.dataObject, function(data) {
            $scope.msg = data
            console.log('data', data)
              // {status: "Success", message: "Data added successfully"}

            if (data.status == 'success') {
              console.log("Return Data", data)
                // Calling All Data
              $scope.requestData();
              $scope.productsListTab();
              // $scope.formCancel(d, data)
            } else {
              console.log(data)
                // Handle the errors here
            }
          })
        /*} else {
          console.log("Duplicates found");
        }*/

      }

      if ($scope.tabActive == 'productsList') {
        $scope.productsListTab()
      }


    } // End Variable "pmContainer"


  // Defining the controller
  app.controller('pmController', pmController)
}())