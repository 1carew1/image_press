#!/bin/bash

set -x

grails war
rm /Users/colmcarew/IdeaProjects/image_press/target/image_press.war
mv /Users/colmcarew/IdeaProjects/image_press/target/image_press-0.1.war  /Users/colmcarew/IdeaProjects/image_press/target/image_press.war
scp /Users/colmcarew/IdeaProjects/image_press/target/image_press.war pi@torrent:/home/pi/tomcat/webapps/image_press.war
