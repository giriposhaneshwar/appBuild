url pointing: http://localhost/dc/server/
Object Base Structure: 
{
	method: url/method object,
	data: data to send
}

===========================
list of service calls
Login:---
	Login Service: login/loginUser
	Data: 	{
			    "method": "login/loginUser",
			    "data": {
			        "res": {
			            "username": "giriy",
			            "password": "admin"
			        },
			        "loggedInUser": {}
			    }
			}


Dashboard:--------
Getting Stats:
	Login Service : "dashboard/getStats"
	Data: {
		    "method": "dashboard/getStats",
		    "data": {
		        "res": {},
		        "loggedInUser": {
		            "user": "giriy",
		            "name": "Giri Poshaneshwar"
		        }
		    }
		}
