#!/bin/bash
#
# uninstall script.  This will remove any links found in known directories that
# point to files under the dot-files project.
#
# This will not delete any other files.
#

# get absolute path to the top level directory of the project
cd `dirname $0`
ROOT_DIR=`pwd`

trap 'echo "uninstall completed!"' 0

echo "Removing links..."


# given a directory, find all links that point to a corresponding
# directory under the project and rm them
function remove_links_from_dir() {
    local dir_name=$1
    cd ~/$dir_name
    echo "[~/$dir_name]"

    for file in `ls -a`; do
        # go back to where we were (on subsequent iterations)
        cd ~/$dir_name

        # skip it if it's not a link
        if [ ! -L $file ]; then
            continue;
        fi

        dest=`readlink $file`
        if [ -f $dest ]; then
            filename=`basename $dest`
            # go to the directory where that file is so we can figure out
            # where it is exactly
            cd `dirname $dest`
            if [ $ROOT_DIR/$dir_name -ef `pwd` ]; then
                echo "  rm ~/$dir_name/$filename"
                rm ~/$dir_name/$filename
            fi
        elif [ -d $file ]; then
                echo "  rm ~/$dir_name/$file"
                rm ~/$dir_name/$file
        fi
    done
}

echo ""

remove_links_from_dir bin
remove_links_from_dir etc
remove_links_from_dir .

echo ""
