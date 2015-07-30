(function(){
	var app = angular.module("appBuild");

	app.factory("serviceCall", function($http){

		var urlPre = "http://localhost/dc/server/";


		return {
		        getService: function(url,data,cb){
                    if(!data){ data = {}; }
                    
                    var rtn = {};
                    var rtn1 = {};
	
		            rtn = $http({
						    url: urlPre+""+url,
						    method: "POST",
						    data: JSON.stringify(data)
						    }).success(function (data, status, headers, config) {

						    	if(cb){
						    		return cb(data);
						    	}else{
						    		return data;
						    	}
						        console.log("service response", data, status, headers, config);
						        // return data;
						    }).error(function (data, status, headers, config) {});

		            // return rtn;
		        }    	

		}// return end

	});
}());