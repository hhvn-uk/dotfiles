#!/bin/sh
# I think a script is more appropriate than a makefile, here

[ "$USER" = "root" ] && {
	printf 'run this from your user account\n'
	exit 1
}

# substitute $INSTALL_ENV_FOO for $FOO
_envsubst(){
	str=$(cat | tr '\n' '\f')

	env |
	while read -r line
	do
		str=$(printf '%s\n' "$str" | awk -v "var=${line%%=*}" -v "val=${line#*=}" '
			{
				regex = sprintf("\\$INSTALL_ENV_%s", var)
				gsub(regex, val)
				print
			}'
		)
		printf "\n%s" "$str"
	done | tail -n 1 | tr '\f' '\n'
	# combine echo/tail here, due to weirdness with while loops
	# appears to be like a subshell, but also not:
	#  - variable persists between each section of a loop
	#  - variable doesn't persist after leaving the loop
}

dirs=$(find . -type d)
files=$(find . -mindepth 2 -type f)

export IFS=$(printf '\n\t')
for dir in $dirs
do
	printf 'creating %s... ' "$dir"
	dest=$(printf '%s\n' "$dir" | sed 's~^\.~~')
	mkdir -p $dest
	printf 'done\n'
done

for file in $files
do
	printf 'creating %s... ' "$file"
	dest=$(printf '%s\n' "$file" | sed 's~^\.~~')
	content=$(_envsubst < "$file")
	printf '%s\n' "$content" | doas tee "$dest" >/dev/null
	printf 'done\n'
done
