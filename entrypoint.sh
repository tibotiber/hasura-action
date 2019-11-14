#!/bin/sh -l

set -e

if [ -z "$HASURA_ENDPOINT" ]; then
    echo "HASURA_ENDPOINT is required to run commands with the hasura cli"
    exit 126
fi

command="hasura $* --endpoint $HASURA_ENDPOINT"

if [ -n "$HASURA_ADMIN_SECRET" ]; then
    command="$command --admin-secret $HASURA_ADMIN_SECRET"
fi

sh -c $command
