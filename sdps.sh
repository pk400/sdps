#! /bin/bash

PWD=$(printenv PWD)
USER=$(printenv USER)
USERHOME=$(printenv HOME)
HOSTNAME=$(printenv LOGNAME)

OUTFILE=sdps_$USER.txt
if [ ! -f $OUTFILE ]
	then
	touch $OUTFILE
fi

printf "=== %s\n| %s\n| %s\n| %s\n| %s\n" \
"Computer Information:" \
"Current User: $USER" \
"User Home: $USERHOME" \
"Hostname: $HOSTNAME" \
"Current Directory: $PWD"

for args in "$@"
do
	if [[ ! $args =~ ^(base|viscosity)$ ]]
		then
		echo $args "command not recognized!"
		exit 1
	fi
done

# Get viscosity information
VISCCONFIG_PATH="/Users/$USER/Library/Application\ Support/Viscosity/OpenVPN/1/config.conf"
eval cat $VISCCONFIG_PATH | while read LINE; do echo $LINE; done