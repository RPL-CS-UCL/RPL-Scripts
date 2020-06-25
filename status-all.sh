#!/bin/bash

rpl_dir=${PWD%/*}
#echo "$rpl_dir"

# if the script is sourced add the trap
[[ "${BASH_SOURCE[0]}" != "${0}" ]] && trap  "{ cd $actual_dir; trap - INT; return 1; }" INT

#dir for each
for f in `cd $rpl_dir && ls -d -- */`
do
    cd "$rpl_dir/$f"
    echo "Current dir: " "$rpl_dir/$f"
    echo -e "\e[32m$f \e[39m --> `git status` \n"
    cd ..
done

# come back to the dir where the script was executed
cd $rpl_dir
# possibly remove trap
trap - INT
