#!/bin/bash

set -x

gvm use grails 2.5
grails war
rm -r /Library/Tomcat/webapps/image_press
rm /Library/Tomcat/webapps/image_press.war
mv /Users/colmcarew/IdeaProjects/image_press/target/image_press-0.1.war  /Library/Tomcat/webapps/image_press.war
