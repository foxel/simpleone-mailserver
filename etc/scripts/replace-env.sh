#!/bin/bash

function replace_env {
    template="$1.tpl"
    if [ -f "${template}" ]; then
        perl -p -e 's/\$ENV_([\w_]+)/$ENV{$1}/g' "${template}" > $1
    else
        # we save tpl here
        perl -i.tpl -p -e 's/\$ENV_([\w_]+)/$ENV{$1}/g' $1
    fi
}
export -f replace_env

for FILE in "$@"; do
    replace_env "$FILE"
done
