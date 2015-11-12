(function () {
  var app = angular.module('appBuild')

  app.factory('serviceCall', function ($http) {
    // var urlPre = 'http://localhost/appbuild/server/'
    var urlPre = 'http://icsitpark.in/server/'

    return {
      getService: function (data, cb) {
        if(!data) { data = {}; }

        var rtn = {}
        var rtn1 = {}
        var loggedInUser = {user: window.localStorage['inUser'], name: window.localStorage['user']}

        if(typeof data == 'object') {
          data.data.loggedInUser = loggedInUser
        }

        console.log('getting the data type of ', JSON.stringify(data))

        rtn = $http({
          url: urlPre,
          method: 'POST',
          data: JSON.stringify(data)
        }).success(function (data, status, headers, config) {
          if(cb) {
            return cb(data)
          } else {
            return data
          }
          console.log('service response', data, status, headers, config)
        // return data
        }).error(function (data, status, headers, config) {})

      // return rtn
      }

    }// return end

  })
}())
