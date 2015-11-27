(function() {
  // 'use strict'
  var app = angular.module('appBuild')

  var dcController = function($scope,  $http, serviceCall, $location) {
    // Local Storage Values set
    window.localStorage['customerRows'] = ''
    window.localStorage['productRows'] = ''
      // Global Defaults
    $scope.productLocal = window.localStorage['productRows'] != '' ? window.localStorage['productRows'] : {}
    $scope.customerLocal != {} ? window.localStorage['customerRows'] : {}
    $scope.customerFormVal = {}

    console.log('$scope.productLocal', $scope.productLocal)

    // $scope.msg = "Page loaded successfully"
    var url = 'http://localhost/appBuildServer'
    $scope.msg = 'DC Form'


    // get the DC Number
    $scope.getDcNum = function() {
      // dc/dcNumber
      // $scope.dataObject.data = $scope.dcReport
      $scope.dataObject.method = 'dc/dcNumber'

      var dt = serviceCall.getService($scope.dataObject, function(data) {
        // $scope.msg = data
        $scope.dcNumber = data;
        console.log('DC Number', data);
      })
    }
    $scope.getDcNum();


    // main controller page function
    $scope.page()

    // setting up the navigation menu
    $scope.curNav = $location.path().substring(1)
      // console.log("page", $scope.curNav)

    // Product List Holder
    if ($scope.productLocal != null) {
      if (Object.keys($scope.productLocal).length > 0) {
        $scope.productList = window.localStorage['productRows']
      } else {
        $scope.productList = []
      }
    }

    // collecting the customer details and date

    $scope.setDateForm = function(val) {
      $scope.customerFormVal.date = val
      appData.customerFormVal = $scope.customerFormVal
    }
    $scope.setCustomerForm = function(val) {
      $scope.customerFormVal.customer = val
      appData.customerFormVal = $scope.customerFormVal
    }

    $scope.getProducts = appData.products
    $scope.getCustomers = appData.customers

    $('.date').datetimepicker({
      'pickTime': false,
      'format': 'DD-MM-YYYY'
    })
    $('.date').data('DateTimePicker').setMinDate(new Date())

    console.log($scope.getProducts)

    // restricting to the numbres only
    // $scope.onlyNumbers = /^\d+$/

    // Customer field alphabitical search function
    $scope.callCustomers = function(e) {
      console.log('Entered', e)
      return appData.customers;
    }

    // Get Rate based on the selected product
    $scope.getRates = function(data) {
      var mainData = appData.products;
      var select = data;
      var obj;

      angular.forEach(mainData, function(i, n) {
        // console.log(i.pid, data.name)
        if (i.pid == data.name) {
          // console.log(i, n);
          obj = i;
        }
      });
      // console.log(obj);
      $scope.product.rate = obj.price;
    }

    $scope.getProductById = function(id) {
      var productData = appData.products;
      var responseObj;

      // console.log("Given ID", id);

      angular.forEach(productData, function(i, n) {
        if (id == i.pid) {
          responseObj = i;
        }
      });
      return responseObj;
    }

    // Add row of product to the list
    $scope.addProductRow = function(evt, pData) {
      evt.preventDefault()

      var productObj = $scope.getProductById(pData.name);
      pData.name = productObj.name;

      console.log('row before', pData)

      var vatAmt = 0
      if (pData.setVatRow == undefined) {
        pData.setVatRow = 0
      } else {
        vatAmt = Number(pData.setVatRow) * (Number(pData.rate) * Number(pData.qty)) / 100
      }

      // console.log('Vat', typeof pData.setVatRow, '\nRate', typeof pData.rate, '\nQty', typeof pData.qty)

      $scope.getSizeObject = Object.keys(pData).length

      if ($scope.getSizeObject == 4) {
        pData.amt = vatAmt + (Number(pData.rate) * Number(pData.qty))

        // console.log('$scope.productList', $scope.productList)
        console.log('row After', pData)
        $scope.productList.push(pData)

        // Calculatin the total
        $scope.getTotal($scope.productList)

        window.localStorage['productRows'] = JSON.stringify($scope.productList)
        $scope.product = {}
      } else {
        angular.forEach($scope.product, function(a, b) {
          console.log(a, a.length, b, b.length)
        })
      }
    }

    $scope.getTotal = function(obj) {
      var gmt = 0
      $scope.vat = 0
      angular.forEach(obj, function(i, v) {
        gmt = gmt + i.amt
        console.log('Grand Total ', i.amt, gmt)
        $scope.total = gmt

        // Grand Total with Vat Calculation
        $scope.gTotal = (($scope.total * $scope.vat) / 100) + $scope.total
      })
    }

    $scope.editRow = function(evt, key, val) {
      evt.preventDefault()
      console.log(key, val)

      // Calculatin the total
      $scope.getTotal($scope.productList)

    }

    $scope.delRow = function(evt, key, val) {
      evt.preventDefault()

      var index = $scope.productList.indexOf(val)
      $scope.productList.splice(index, 1)

      // Calculatin the total
      $scope.getTotal($scope.productList)

      window.localStorage['productRows'] = JSON.stringify($scope.productList)
    }

    $scope.formCancel = function(evt, data) {
        evt.preventDefault()

        $scope.productList = []
        $scope.customerFormVal = []
        $scope.dc = []

        // Calculatin the total
        $scope.getTotal($scope.productList)

      }
      // console.log($scope.productList)

    $scope.formSubmit = function(d, action) {
      d.preventDefault()
        /*
          products : $scope.productList
          Calculation: $scope.gTotal
          vat : $scope.vat            
          */
      $scope.dcReport = {}

      $scope.dcReport.res['productRequirment'] = $scope.productList
      $scope.dcReport.res['customerTo'] = $scope.customerFormVal
      $scope.dcReport.res['customerTo'].billno = $scope.dcNumber
      $scope.dcReport.res['grandTotal'] = $scope.gTotal
      $scope.dcReport.res['actionPerform'] = action


      $scope.dataObject.data = $scope.dcReport
      $scope.dataObject.method = 'dc/addReport'

      console.log("Sending Object", $scope.dataObject)


      var dt = serviceCall.getService($scope.dataObject, function(data) {
        $scope.msg = data
        console.log('data', data)
          // {status: "Success", message: "Data added successfully"}

        if (data.status == 'success') {
          alert(data.message)
          $scope.formCancel(d, data)
          $scope.getDcNum();
        } else {
          // Handle the errors here
        }
      })
    }

  }

  // Defining the controller
  app.controller('dcController', dcController)
}())