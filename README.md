# md-group

Step 1: Create a feature branch and raise a PR to merge it into master.

The app is configured in Terraform and Github Actions so no more things need to be done. If you plan to run terraform in local repo I will send the access keys and secret access keys.

Description of actual app: Its a simple app which is deployed on a S3 bucket. I had a issue with ACM certificates due to which I couldn't use the actual domain name. The ACM certificate is in pending validation state till now.

I have created two terraform modules Route53 and S3.

Route53 module creates a domain name and attaches SSL certificate to the domain using ACM.

S3 module creates a S3 bucket specificly created to host SPA. I have enabled CORS for the same application so that requesting different domains to another server doen't block the content being showed.

Upload folder creates the content, in this case you can deploy any SPA in this folder and it will deploy the application on S3 bucket.
