#!/bin/bash
# This script performs a banner grab of the supplied host:port, really it's just a wrapper for netcat.


# A common pattern I like to use when a script expects args - if not args, print a help message, and exit.
# $0 is the name of the script, $1 is the first argument, $2 is the second arg, etc.
if [ -z $1 ]; then # -z tests to see if a string is null/has zero length.
    #  The helper messages uses $0 in case the script has been renamed.
    echo -e "$0 expects host:port as input.\n\tEx: ./$0 example.com:1234"
    # We exit, b/c there's no point in running the rest of the script if they didn't supply host:port.
    exit
fi


# The script will barf later if the port isn't set - so I don't bother checking to see if ':' is in $1
host=`echo $1 | cut -d':' -f 1`
port=`echo $1| cut -d':' -f 2`

# $ipish will match 0.0.0.0 through 999.999.999.999 but that's good enough in a lot of cases.
ipish="[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"



if [[ $host =~ $ipish ]]; then # =~ tests against a RegEx pattern, requires [[ ]].
    ip=$host
else
    ip=`dig $host @1.1.1.1 +short | head -n 1`
fi

echo "" | nc -v -n -w 2 $ip $port 2>/dev/null

# That's it. That's the script. ./
# Note: You can call bash scripts directly using bash, without setting the execution bit via chmod.
# Ex: bash script.sh - which incidentally does not require a shebang(#!).
