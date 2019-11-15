#!/bin/sh -l

set -e

if [ -z "$HASURA_ENDPOINT" ]; then
    echo "HASURA_ENDPOINT is required to run commands with the hasura cli"
    exit 126
fi

command="hasura $* --endpoint $HASURA_ENDPOINT"
command_to_print="hasura $* --endpoint $HASURA_ENDPOINT"

if [ -n "$HASURA_ADMIN_SECRET" ]; then
    command="$command --admin-secret $HASURA_ADMIN_SECRET"
    command_to_print="$command --admin-secret ***"
fi

if [ -n "$HASURA_WORKDIR" ]; then
    cd $HASURA_WORKDIR
fi

echo "Executing '$command_to_print' from ${HASURA_WORKDIR:-./}"

sh -c $command
