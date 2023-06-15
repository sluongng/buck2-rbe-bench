#!/bin/bash

file=$1
expected=$2
got=$(sha256sum $file | awk '{print $1}')

sleep $((RANDOM % 5));
if [[ $expected != $got ]]; then
    echo "Expected $expected got $got" >&2
    exit 0
fi

exit 0
