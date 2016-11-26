#!/bin/bash

START_DIR=`pwd`

# get absolute path to the top level directory
cd `dirname $0`
ROOT_DIR=`pwd`

trap 'echo "install failed!' 1
trap 'echo "install interrupted!"' 2 3 6 15

# create the given directory in the home dir if needed
# and link files
#
function replicate_dir {
    local dir_name="$1"
    local destdir=~/$dir_name
    local sourcedir=$ROOT_DIR/$dir_name
    echo "[$destdir]"
    if [ ! -d $destdir ]; then
        echo "  -> creating directory"
        mkdir $destdir
    else
        echo "  -> already exists"
    fi

    echo "  -> linking files..."
    for file in `ls $sourcedir`; do
        local filename=`basename $file`
        local destfile=$destdir/$filename
    
        if [ ! -e $destfile ]; then
            echo "    ln -s $sourcedir/$file $destfile"
            ln -s $sourcedir/$file $destfile
        else
            echo "    $filename already exists."
        fi
    done
    echo ""
}


#######################################
# create the directories and link files
#

echo "installing directories"
replicate_dir bin
replicate_dir etc

#
#######################################


#######################################
# link dot files
#

echo "linking dot files..."
# find all '.' files that don't end in .swp and is not .git
for file in `find . -maxdepth 1 -name ".*" -not -name ".git" -not -name ".*.swp"`; do
    filename=`basename $file`
    sourcefile=$ROOT_DIR/$filename
    destfile=~/$filename
    if [ ! -e $destfile ]; then
        echo "  ln -s $sourcefile $destfile"
        ln -s $sourcefile $destfile
    else
        echo "  $filename already exists"
    fi
done
echo ""

#
#######################################

echo "install complete!"
echo ""
