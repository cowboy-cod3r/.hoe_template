# jenkins

## AUTHOR
* Author:  Sean Humbarger (sean.humbarger@issinc.com)

## DESCRIPTION
This project manages the build and deployment of jenkins.

## CONFIGURATION
This project requires that a few gems be installed for everything to work properly.

1. Clone this repository
2. Ensure ruby installed on your localhost
3. Ensure the appropriate gems are installed:

        bundle install

4. Install docker for your distribution and ensure docker is started in the background

## TASKS
To get a list of tasks available for this repository:

        rake -T

### Build
The following steps will guide you through build process for the image.  You only need to build an image if an image needs to be updated or you need to perform the initial build.  If images already exists, and you just want to deploy, go the deploy section.

1. Issue the following command:

        rake build:jenkins

### Deploy
Deploy jenkins

1.  Issue the following command:

        rake build:jenkins

### Publish
Deploy jenkins

1.  Issue the following command:

        rake publish:jenkins
