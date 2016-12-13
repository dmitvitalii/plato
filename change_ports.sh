#!/bin/bash
#
# Copyright 2016 Vitalii Dmitriev 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Change ports of a git remote urls for all projects.

set -o nounset
set -o errexit
set -o noclobber

# Filename of this program
readonly PROGNAME=${0##*/}
readonly ERRMESSAGE="An error has occured."

# Given parameters (directories)
PARAMETERS="$@"

CURR_DIR=$(pwd)

##################################################
# Shows help message
# Globals:
#  PROGNAME
##################################################
usage() {
    cat <<EO
Usage:
    ${PROGNAME} <port_old> <port_new> <dir one> <dir two> ...
EO
}

main() {
    old=${1}
    new=${2}
    if [[ -z "$PARAMETERS" ]]; then
        usage
    else
        for dir in $PARAMETERS; do
            fulldir=$(readlink -f $dir)
            if [ -d $fulldir ]; then
                cd $fulldir
                url=$(git remote -v | head -n1 | sed -e s/'${old}'/'${new}'/ | sed -e s/' .*'//)
                git remote set-url $url
                printf $fulldir": git remote -v:\n"
                git remote -v
                cd $CURR_DIR 
            fi
        done
    fi
}

main
