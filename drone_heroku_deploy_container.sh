#!/usr/bin/env bash

# stop on first failure
set -e
set -x

# set the heroku token environment variables
HEROKU_API_KEY="${PLUGIN_HEROKU_API_KEY}"

# set the process type
if [ -z "${PLUGIN_HEROKU_PROCESS_TYPE}" ]
then
PLUGIN_HEROKU_PROCESS_TYPE="web"
fi

# run kubectl apply on the variable injected yaml config file
heroku container:push "${PLUGIN_HEROKU_PROCESS_TYPE}" --app "${PLUGIN_HEROKU_APP_NAME}"
heroku container:release "${PLUGIN_HEROKU_PROCESS_TYPE}" --app "${PLUGIN_HEROKU_APP_NAME}"
