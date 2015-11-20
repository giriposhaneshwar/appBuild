// Main Module

var app = angular.module('appBuild', ['ngRoute', 'ngAnimate'])

// app.config()
app.config(function ($routeProvider, $locationProvider) {// , $locationProvider
  // use the HTML5 History API
  $locationProvider.html5Mode(false)
  /*$locationProvider.html5Mode({
    enabled: false,
    requireBase: true
  });*/

  $routeProvider
    .when('/home', {
      templateUrl: './views/home.html',
      controller: 'homeController'
    })
    .when('/dc', {
      templateUrl: './views/dc.html',
      controller: 'dcController'
    })
    .when('/customers', {
      templateUrl: './views/cm.html',
      controller: 'cmController'
    })
    .when('/customers/:id', {
      templateUrl: './views/customerEdit.html',
      controller: 'cmController'
    })
    .when('/products', {
      templateUrl: './views/pm.html',
      controller: 'pmController'
    })
    .when('/reports', {
      templateUrl: './views/report.html',
      controller: 'reportController'
    })
    .when('/reportsview/:act/:id', {
      templateUrl: './views/recordView.html',
      controller: 'reportController'
    })
    .when('/login', {
      templateUrl: './views/login.html',
      controller: 'loginController'
    })
    .when('/dashboard', {
      templateUrl: './views/dashboard.html',
      controller: 'dashboardController'
    })
    .when('/logout', {
      templateUrl: './views/logout.html',
      controller: 'logoutController'
    })
    .otherwise({redirectTo:'/login'})
})
