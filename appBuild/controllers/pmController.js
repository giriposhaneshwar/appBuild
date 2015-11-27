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

      // Get List of Customers
      $scope.getProducts = function() {
        $scope.dataObject.method = 'products/getList'
        $scope.dataObject.data.res = ''

        // console.log('Sending object ', $scope.dataObject)

        var dt = serviceCall.getService($scope.dataObject, function(res) {
          $scope.msg = res

          if (res.status == "success") {
            appData.products = res.data;
            $scope.pList = res.data;
            // console.log("Response Data From Server ::::: ", res);
          }
        })
      }
      $scope.getProducts();

      // Adding New Product
      $scope.addProduct = function(d, data) {
        console.log(d, data);
        // check whether the name is existing or not
        // if ($scope.checkDuplicate(appData.products, data) < 1) {
        console.log('Adding Product is ', $scope.dataObject, data)

        // $scope.dataObject.data = $scope.dcReport
        $scope.dataObject.data.res = data;

        if ('pid' in data) {
          // console.log("this is update statement", data);
          $scope.dataObject.method = 'products/updateProduct'
        } else {
          $scope.dataObject.method = 'products/insertProduct'
            // console.log("this is Adding State", data);
        }

        console.log("Sending object to add Product", $scope.dataObject);

        var dt = serviceCall.getService($scope.dataObject, function(data) {
          $scope.msg = data
          console.log('data', data)
            // {status: "Success", message: "Data added successfully"}

          if (data.status == 'success') {
            console.log("Return Data", data)
              // Calling All Data
            $scope.requestData();
            window.location.href = '#/products';
            $scope.productsListTab();

            // $scope.formCancel(d, data)
          } else {
            console.log(data)
              // Handle the errors here
          }
        });
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
          $scope.product = $rootScope.editProd;

        }
      } else {
        window.location.hash = '#/products';
      }

      // Deleting the product
      $scope.delProduct = function(e, data) {
        // $scope.dataObject.data = $scope.dcReport
        $scope.dataObject.data.res = data;

        $scope.dataObject.method = 'products/deleteProduct'

        console.log("Sending object to add Product", $scope.dataObject);

        var dt = serviceCall.getService($scope.dataObject, function(data) {
          $scope.msg = data
          console.log('data', data)
            // {status: "Success", message: "Data added successfully"}

          if (data.status == 'success') {
            console.log("Return Data", data)
              // Calling All Data
            // window.location.href = '#/products';
            $scope.requestData();
            $scope.getProducts();
            $scope.productsListTab();

            // $scope.formCancel(d, data)
          } else {
            console.log(data)
              // Handle the errors here
          }
        });
      }


    } // End Variable "pmContainer"


  // Defining the controller
  app.controller('pmController', pmController)
}())