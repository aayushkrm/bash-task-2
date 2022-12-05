#!/bin/bash

# Parse command line arguments
file=
login=
while [ $# -gt 0 ]; do
  case $1 in
    -f)
      file=$2
      shift 2
      ;;
    *)
      login=$1
      shift
      ;;
  esac
done

# If file is not specified, use default file
if [ -z $file ]; then
  file="/etc/passwd"
fi

# If login is not specified, use current user's login
if [ -z $login ]; then
  login=$USER
fi

# Find user's home directory
home=
if [ -f $file ]; then
  # Use grep to find user's line in the file
  line=$(grep "^$login:" $file)
  if [ -n "$line" ]; then
    # Extract home directory from the line
    home=$(echo $line | cut -d : -f 6)
  else
    # User not found in the file
    >&2 echo "Error: user '$login' not found in file '$file'"
    exit 1
  fi
else
  # File does not exist
  >&2 echo "Error: file '$file' does not exist"
  exit 2
fi

# Print user's home directory and exit
echo $home
exit 0

