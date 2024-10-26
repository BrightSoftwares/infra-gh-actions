#!/bin/sh

set -e

PROGNAME=$(basename $0)

die() {
    echo "$PROGNAME: $*" >&2
    exit 1
}


usage() {
    if [ "$*" != ""  ] ; then
        echo "Error: $*"
    fi

    cat << EOF
Usage: $PROGNAME [domain] [startpage]
Dowloads entire website to be used as template after.

Options:
-h, --help          display this usage message and exit
-d, --domain        the domain of the site
-s, --startpage     the page we should start from.
EOF

    exit 1

}


DOMAIN=""
STARTPAGE=""
# domain=0
# startpage="-"
while [ $# -gt 0 ] ; do
    case "$1" in
    -h|--help)
        usage
        ;;
    -d|--domain)
        DOMAIN="$2"
        shift # We move to the next argument in the while loop
        ;;
    -o|--startpage)
        STARTPAGE="$2"
        shift # We move to the next argument in the while loop
        ;;
    -*)
        usage "Unknown option '$1'"
        ;;
    *)
        if [ -z "$DOMAIN" ] ; then
            DOMAIN="$1"
        elif [ -z "$STARTPAGE" ] ; then
            STARTPAGE="$1"
        else
            usage "Too many arguments"
        fi
        ;;
    esac
    shift
done

if [ -z "$DOMAIN" ] ; then
    usage "Not enough arguments"
fi

cat <<EOF
DOMAIN=$DOMAIN
STARTPAGE=$STARTPAGE
domain=$domain
startpage=$startpage
EOF





# # Set the parameters into a variable
# DOMAIN=$1
# STARTPAGE=$2

# if [ -z "$DOMAIN" ]; then
#     echo "Domain parameter missing."
#     usage
#     exit 1
# fi

# if [ -z "$STARTPAGE" ]; then
#     echo "Start page parameter missing"
#     usage
#     exit 1
# fi


#DOMAIN=fakedomain.com
#STARTPAGE=fakedomain.com/tutorials/html/

echo "Downloading website domain  $DOMAIN starting from the page $STARTPAGE"

wget --recursive --no-clobber --page-requisites --html-extension --convert-links \
    --restrict-file-names=windows --domains $DOMAIN \
    --no-parent $STARTPAGE

echo "Done."
