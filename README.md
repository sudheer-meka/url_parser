Url Parser is a web-service which is used to store the contents of a web page.

Setup Guide:

This app requires ruby 2.3.0 or greater and rails 5.(http://blog.teamtreehouse.com/installing-rails-5-linux)

Clone project files using below command
git clone https://github.com/sudheerm16/url_parser.git

cd to your project directory and run
bundle install

set up database using below commands
rake db:create
rake db:migrate

now your project is ready to up & run.

API Documentation:

1. To get the already stored web pages use the below call
  - get http://localhost:3000/page_contents

  Sample Responce:
  {
    "result": {
    "https://quikchex.in": "PRODUCT; Payroll Software; HR Software; Time & Attendance; Leave Tracking; Reports; Social Newsfeed; SERVICES; Payroll Outsourcing; Compliance Management; Tax Management; PLANS; HR TOOLKIT; BLOG; LOG IN; DEMO; quikchexindia; HR & Payroll software your employees will love; Automate your attendance, leave , payroll and compliance management. Our intuitive HR & payroll software platform reduces the time and costs Indian businesses spend on Human Resources.; Schedule Demo;   08976009805; Payroll Software; Time & Attendance; Leave Tracking; Cloud HRIS; Employee Self Service Portals; Reporting; Payroll Outsourcing:; Compliance Management; TDS Management; Schedule Demo;   08976009805; Automatic Integration; Last Mile Compliance; Beautifully Simple:; Schedule Demo;   08976009805; Product Features; Payroll Software; Cloud HR; Leave Tracking; Time & Attendance; Reports; Service Offerings; Payroll Outsourcing; Compliance Management; Tax Management; Our Blog; How to Deal with a Harassment Complaint at Work; How to Spot a Liar during an Interview; Choosing the perfect incentive plan for your company; 3 questions for the evolving HR manager; Follow Us; Contact Us; Contact Us"
    "https://gmail.com": "One account. All of Google.; Sign in to continue to Gmail; Find my account; Sign in with a different account; Create account; About Google; Privacy; Terms; Help"
    }
    "error_occured": "No"
    "status": 200
  }

2. To parse a web page and store its contents
 - post http://localhost:3000/page_contents
   parameters: {
    url: 'https://github.com'
   }
 Sample Responce:
 {
    "result": "OK"
    "error_occured": "No"
    "status": 200
 }

Error Codes:
status 200: Success
status 400: Invalid input or web page is not available
status 500: Server not able to process the request
