# Task 2

Write a script that finds the specified user's home directory by analyzing the system's configuration file. The call syntax is
`userhome [-f file] [login]`

If the login is not specified, the current user's home is searched. If the file is not specified, `'/etc/passwd'` is analyzed by default. Suppose that the file format is correct. The file contains a table, each line for each user, and columns are separated by the ':' character. The first column contains the user's login and the sixth one contains the user's home directory.

If the specified login is not found, a corresponding error message should be printed to stderr and the script's exit status should be 1. If the file to analyze does not exist, a corresponding error message should be printed to stderr and the script's exit status should be 2. In case of success, the home directory path should be printed to stdout and the script's exit status should be 0.
 
Note. Use grep to find the presence and content of the corresponding line. Be aware that the user login might be a substring of any other content (e.g., home directory path) of any other user. Or even be a prefix to another user's login.
 
`$ userhome -f /mnt/sysroot/etc/passwd userlogin`


`/home/userlogin`

