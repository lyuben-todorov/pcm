#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
REPO="git@github.com:lyuben-todorov/piko.git"
CONFIG_FOLDER=$DIR/configs_enabled/*.toml

export RUST_BACKTRACE=1
cd ../node && cargo build --release

for f in $CONFIG_FOLDER
do
	echo "Starting $f"
	./target/release/main -p "$f"
done

