vint-prog-test
==============

## The Vint Programming Test [Deployed Version](http://vint-prog-test.herokuapp.com/)

## Web Architecture

     I have implemented the required features as per the specification. 
     Users will enter the website using the given URL and view all running activities and statistics. 
     Entering a new running activity is done through a form with a POST method. 
     The statistics can be reloaded by clicking on the respective button which 
     sends an AJAX call in order to refresh the statistics.

* A fat Activity Model, this holds all the business logic.
In the sense that all database dependent calculations are performed here.

* A skinny controller, using the aforementioned Activity Model methods to get required results.

* Helper for the controller to "clean_parameters", this uses a gem "chronic_duration" to parse duration strings 
into seconds and also sets the format of the date for my application. Since this is more or less a generic method 
I saw it best to be in the ActivitiesHelper.

* Views for the requested controllers were written, trying along the way to create a design that is usable 
and looks decent.

* Unit tests using Rspec and automation tests using Capybara were used

 
## API Architecture:

     This part was by far the most interesting part of the test, designing a RESTful API 
     and its URLs is one of the most controversial topics in my opinion. However, 
     I tried my best to produce an API that I feel comfortable with. 
     I will explain the reasoning behind the architecture of each step. 
     I have done a lot of discussions with myself regarding the architecture, 
     however, these are too long to write down, so if you want we can set up a
     Skype call to discuss them and I can share with you my thoughts during the process.



* I used a separate namespace for the api with versioning, to maintain a scalable system that can 
accommodate several versions. 

* The choice of namespace was not my top preference, however ideally, it would have been better to make the api
into a subdomain, so “api.vint-prog-test.herokuapp.com”  instead of “vint-prog-test.herokuapp.com/api/“. 
The reason I would prefer the latter is to balance the loads on the servers and dedicate server(s) for the web
service and serves(s) for the api service, however, due to the limitation of this programming test and that I
could not create a subdomain I chose the first way. In a real environment I would go for the sub-domain solution.

* URLs were maintained as RESTful as possible as can be seen in the API documentation below.

* I chose the option of specifying the response type and API version to be part of the HTTP Header instead of
being part of the url, I found the HTTP header option to be more elegant and RESTful.

* Constraints for the API like version and response type are defined in the lib/ directory

* JSON responses are gzipped and the HTTP response Content-Encoding Header specifies this.

* Used RABL to build the JSON responses

* Optional parameters for listing activities  (fields, limit, offset)

* Unit tests using Rspec were used to test the API



     I have worked my hardest into meaning the API as RESTful as possible, maintaining RESTful URLs along the way.

### API Documentation
List Running Activities
          
     GET /api/activities
          
Parameters
     
| Name        | Type           | Description  |
| ------------- |:-------------:|:-----|
| fields      | string | A comma separated string indication fields to reutrn. Choices are **date**, **distance**, **duration**, **comment**|
| limit      | int      |   The number of activities to return, defaults to 50. |
| offset | int      |    The offset from the beginning of the list to start retrieving activities from. |
     
Response
     
```json
     {
        "activities":[
           {
              "id":3,
              "date":"2014-05-27",
              "duration":"45.0",
              "distance":"700.0",
              "comment":"Sent from API"
           },
           {
              "id":2,
              "date":"2014-05-26",
              "duration":"60.0",
              "distance":"700.0",
              "comment":"Great progress!"
           },
           {
              "id":1,
              "date":"2014-05-25",
              "duration":"80.0",
              "distance":"700.0",
              "comment":"Started training!"
           }
        ]
     }
```
          
Get Statistics of running activities
     
     GET /api/activities/statistics
          
Response
     
```json
     {
        "data":{
           "total_count":3,
           "weekly_avg":3,
           "avg_duration":"61.6666666666666667",
           "avg_speed":"11.351351351351351351"
        }
     }
```
          
Create a new running activity
     
     POST /api/activities
     
Parameters
     
| Name        | Type           | Description  |
| ------------- |:-------------:|:-----|
| date      | string | Date of the run in the format mm/dd/yyyy |
| duration      | string      |   Duration of the run as a string in the format, "4m 30s" or "37.5s" |
| distance | string      |  Distance of run in metres. |
| comment | string      |  An optional comment on the run. |
          
Response

          HTTP/1.1 201
          

     The code is also documented so that the person who reads it does not suffer
     
     **Finally, the surprise I promised:**
          I always love to automate any repetitive work, I have hence created a chef script that could be run using
          ```
           rake deploy
           ```
          This script deploys to Heroku and runs the tests, reporting the results.

