#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
REPO="git@github.com:lyuben-todorov/piko.git"
git clone	"$REPO" "$DIR/piko"

cd piko
cargo build --release

