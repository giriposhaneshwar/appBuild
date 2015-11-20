(function() {
  var app = angular.module('appBuild')

  app.factory('serviceCall', function($http) {
    var urlPre = serverCon;

    return {
      getService: function(data, cb) {
        if (!data) {
          data = {};
        }

        var rtn = {}
        var rtn1 = {}
        var loggedInUser = {
          user: window.localStorage['inUser'],
          name: window.localStorage['user']
        }

        if (typeof data == 'object') {
          data.data.loggedInUser = loggedInUser
        }

        // console.log('getting the data type of ', JSON.stringify(data))

        rtn = $http({
          url: urlPre,
          method: 'POST',
          data: JSON.stringify(data)
        }).success(function(data, status, headers, config) {
          // console.log('\n\n\n\tservice response::::::: \n\t', data, status, headers, config, "\n\n\n\t")
          if (cb) {
            return cb(data)
          } else {
            return data
          }
            // return data
        }).error(function(data, status, headers, config) {})

        // return rtn
      }



    } // return end

  });

}())