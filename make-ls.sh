#!/bin/bash

# Colors for output
cyan="\033[36m"
red="\033[31m"
reset="\033[0m"

# Function to list all targets
list_targets() {
	local makefile="$1"
	echo -e "${cyan}Available targets in $makefile:${reset}"
	echo "======================================="
	awk '/^[a-zA-Z0-9_-]+:/ { 
        if ($0 ~ /##/) { 
            printf "'"$cyan"'%-30s'"$reset"' %s\n", substr($1, 1, length($1)-1), substr($0, index($0,"##") + 3); 
        } else { 
            printf "%-30s\n", substr($1, 1, length($1)-1); 
        } 
    }' "$makefile" | sort
}

# Function to find Makefile
find_makefile() {
	local dir="$1"
	local makefile_names=("Makefile" "makefile" "GNUmakefile")

	for name in "${makefile_names[@]}"; do
		if [[ -f "$dir/$name" ]]; then
			echo "$dir/$name"
			return 0
		fi
	done

	return 1
}

# Main execution
makefile_path=$(find_makefile ".")

if [[ -n "$makefile_path" ]]; then
	list_targets "$makefile_path"
else
	echo -e "${red}Error: No Makefile found in the current directory.${reset}"
	echo "Please ensure you're in a directory with a Makefile, or specify the path to a Makefile."
	exit 1
fi
