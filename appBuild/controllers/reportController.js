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

        // Get Data
        $scope.requestData();

        $scope.allReports = [];


        // ng-show="[1, 2, 3, 4].indexOf(pdList.productTypeId)!=-1"

        $scope.isInArray = function(array, search) {
            return (array.indexOf(search) >= 0) ? true : false;
        }

        /*if ($scope.isInArray($scope.dLikeUsers, 'giriy')) {
            $scope.showPeople = true;
        } else {
            $scope.showPeople = false;
        }*/


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
                    console.log('Report stype ', $scope.allReports)

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

        $scope.printDiv = function(divName) {

            var printContents = document.getElementById(divName).innerHTML;
            var originalContents = document.body.innerHTML;
            var popupWin;

            if (navigator.userAgent.toLowerCase().indexOf('chrome') > -1) {
                popupWin = window.open('', '_blank', 'width=800,height=600,scrollbars=no,menubar=no,toolbar=no,location=no,status=no,titlebar=no');
                popupWin.window.focus();
                popupWin.document.write('<!DOCTYPE html><html><head><title>Document Print</title>' +
                    '<link rel="stylesheet" type="text/css" href = "./public/css/bootstrap.min.css"> ' +
                    '<link rel="stylesheet" type="text/css" href = "./public/css/bootstrap-datetimepicker.min.css" > ' +
                    '<link rel="stylesheet" type="text/css" href = "./public/css/defaultStyles.css" > ' +
                    '</head><body onload="window.print()"><div class="reward-body">' + printContents + '</div></html>');
                popupWin.onbeforeunload = function(event) {
                    // popupWin.close();
                    // return '.\n';
                    return popupWin.close();
                };
                popupWin.onabort = function(event) {
                    popupWin.document.close();
                    popupWin.close();
                }
            } else {
                popupWin = window.open('', '_blank', 'width=800,height=600');
                popupWin.document.open();
                popupWin.document.write('<!DOCTYPE html><html><head><title>Document Print</title>' +
                    '<link rel="stylesheet" type="text/css" href = "./public/css/bootstrap.min.css"> ' +
                    '<link rel="stylesheet" type="text/css" href = "./public/css/bootstrap-datetimepicker.min.css" > ' +
                    '<link rel="stylesheet" type="text/css" href = "./public/css/defaultStyles.css" > ' +
                    '</head><body onload="window.print()"><div class="reward-body">' + printContents + '</div></html>');
                popupWin.document.close();
            }
            popupWin.document.close();

            return true;
        }

        // Getting the params
        // Mapping the data to show in params page
        $scope.recAction = $routeParams.act
        $scope.reportId = $routeParams.id
        $scope.rData = $scope.reportRow
        $scope.nrProductList;

        $scope.paramAction = function(evt, data, method) {
            // Making Global Rootscope to access in reportview
            $rootScope.nrData = data
            $rootScope.nrData.userInfo = $scope.allReports.userInfo;
            console.log("Trg Data", data.did);

            if (method == 'd') {
                evt.preventDefault();

                $('body').off('click');
                $('body').on('click', '.confirmDel', function() {
                    // Requesting service to delete the record
                    $scope.dataObject.method = 'reports/deleteRecord';
                    $scope.dataObject.data.res = data.did;

                    console.log("Sending Data for Delete", $scope.dataObject);

                    var dt = serviceCall.getService($scope.dataObject, function(res) {

                        console.log("Response form the server is ", res)
                        if (res.status == 'success') {
                            // $scope.getReports();
                            $location.path("#/reports");
                        }
                    });
                });

                $('body').on('click', '.cancelDel', function() {
                    console.log("cancelled");
                });


            } else if (method == 'e') {
                console.log("Edit");
            } else if (method == 'v') {
                console.log("View");
            }
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
