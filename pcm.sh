#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
REPO="git@github.com:lyuben-todorov/piko.git"
CONFIG=configs_enabled/*

export RUST_BACKTRACE=1
cd ../node && cargo build --release

for f in $CONFIG
do
	echo "Starting $f"
	./target/release/main -p "$DIR/$f"
done

