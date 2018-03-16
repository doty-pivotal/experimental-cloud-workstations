#!/bin/bash

URL_43="http://shared.ci.eng.pivotal.io"
TEAM_43="GPDB"
TARGET_43="shared"
TEAM_5="gpdb"
URL_5="http://gpdb.ci.pivotalci.info"
TARGET_5="gpdb"

# Ensure Links is configured
# If it's not, you'll need to manually log in to GitHub using Links before the script will work
if [ ! -d  ~/.elinks ]; then
	mkdir -p  ~/.elinks
	echo "Configuring Links"
	echo "set document.browse.forms.show_formhist = 1" > ~/.elinks/elinks.conf
	echo "set document.browse.forms.confirm_submit = 0" >> ~/.elinks/elinks.conf
fi

# Log in to 4.3 Concourse
# Using "fly4" binary, in case the 4.3 and 5 Concourses are on different versions
TARGETS=$(fly4 -t ${TARGET_43} containers 2> /tmp/fly4attempt.txt)
if [ $? -ne 0 ]; then
	if grep "sync" /tmp/fly4attempt.txt > /dev/null; then
		echo "Need to sync 4 fly client"
		sudo fly4 -t ${TARGET_43} sync
	fi
	echo "Logging into ${URL_43} with team name ${TEAM_43}"
	links ${URL_43}/auth/github?team_name=${TEAM_43} | tr '\n' ' ' | sed -e 's/\s//g' | sed -e 's/^Bearer/Bearer /' | xargs echo > /tmp/token.txt  # get token w/ saved cookie
	#fly4 -t ${TARGET_43} login -c ${URL_43} --team-name ${TEAM_43} < /tmp/token.txt # give token to fly4 login
	fly4 -t ${TARGET_43} login < /tmp/token.txt # give token to fly4 login
	rm /tmp/token.txt
	rm /tmp/fly4attempt.txt || true
else
	echo "Already logged into 4.3, not logging in again"
fi

# Log in to 5 Concourse
# Using "fly5" binary, in case the 4.3 and 5 Concourses are on different versions
TARGETS=$(fly5 -t ${TARGET_5} containers 2> /tmp/fly5attempt.txt)
if [ $? -ne 0 ]; then
	if grep "sync" /tmp/fly5attempt.txt > /dev/null; then
		echo "Need to sync 5 fly client"
		sudo fly5 -t ${TARGET_5} sync
	fi
	echo "Logging into ${URL_5} with team name ${TEAM_5}"
	links ${URL_5}/auth/github?team_name=${TEAM_5} | tr '\n' ' ' | sed -e 's/\s//g' | sed -e 's/^Bearer/Bearer /' | xargs echo > /tmp/token.txt  # get token w/ saved cookie
	#fly5 -t ${TARGET_5} login -c ${URL_5} --team-name ${TEAM_5} < /tmp/token.txt # give token to fly5 login
	fly5 -t ${TARGET_5} login < /tmp/token.txt # give token to fly5 login
	rm /tmp/token.txt
	rm /tmp/fly5attempt.txt || true
else
	echo "Already logged into 5, not logging in again"
fi
