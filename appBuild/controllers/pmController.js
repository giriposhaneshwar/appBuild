(function() {
  // 'use strict'
  var app = angular.module('appBuild')

  var pmController = function($scope, $http, serviceCall, $location, $routeParams, $rootScope) {
      // $scope.msg = "Page loaded successfully"
      $scope.msg = 'PM Page'
      // main controller page function
      // Present Page
      $scope.page()
      $scope.curNav = $location.path().substring(1)
      // console.log('page', $scope.curNav)

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

        if (data.data.res != undefined) {

          var dt = serviceCall.getService($scope.dataObject, function(data) {
            $scope.msg = data
            console.log('data', data)
            // {status: "Success", message: "Data added successfully"}

            if (data.status == 'success') {
              console.log("Return Data", data)
              // Calling All Data
              $scope.requestData();
              window.location.href = '#/customers';
              $scope.productsListTab();

              // $scope.formCancel(d, data)
            } else {
              console.log(data)
              // Handle the errors here
            }
          })
        }else{
          alert("fields need to be filled");
        }
        /*} else {
          console.log("Duplicates found");
          }*/

      }

      if ($scope.tabActive == 'productsList') {
        $scope.productsListTab()
      }

      $scope.reportId = $routeParams.id;

      console.log("Root Params", $routeParams);

      $scope.paramAction = function(data) {
        // delete data.cid;
        $rootScope.editProd = data;
        // console.log($rootScope.editCust);
      }

      if ($scope.reportId != undefined) {
        // get data according to the 
        if ($rootScope.editProd != undefined) {

          // $scope.nrProductList = $rootScope.;
          $scope.product = $rootScope.editCust;

        }
      } else {
        window.location.hash = '#/products';
      }


    } // End Variable "pmContainer"


  // Defining the controller
  app.controller('pmController', pmController)
}())