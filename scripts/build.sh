#!/usr/bin/env bash
set -ex

ROOTDIR="$( dirname "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" )"
BINDIR=$ROOTDIR/bin

export GOPATH=$ROOTDIR
echo "aa"
export GOOS=linux

go build -o $BINDIR/supply nodejs/supply/cli
go build -o $BINDIR/finalize nodejs/finalize/cli
