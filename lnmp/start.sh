#!/bin/bash

__run_supervisor() {
echo "Running the run_supervisor function."
supervisord -n
}

__run_nginx() {
/usr/sbin/nginx
}

# Call all functions
__run_supervisor
__run_nginx