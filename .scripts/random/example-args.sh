#!/bin/sh
# not to be run

while [ "$#" != "0" ]
do
	echo "$1" | grep "[a-zA-Z0-9]=" >/dev/null && {
		arg_opt=$(echo "$1" | sed 's/=.*//g')
		arg_opr=$(echo "$1" | sed 's/.*=//g')
	} || {
		arg_opt="$1"
		echo "$arg_opt" | grep -E -- '--blargh|-b' >/dev/null && {
			shift
			arg_opr="$1"
		}
	}
	case "$arg_opt" in
		--blargh|-b) do_blargh "$arg_opr" ;;
		*) echo "$arg_opt not recognized"; usage ;;
	esac
	shift
done
