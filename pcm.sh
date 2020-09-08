#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
REPO="git@github.com:lyuben-todorov/piko.git"
CONFIG=configs_enabled/*

if [ ! -d "/piko" ]
then
	git clone "$REPO" "$DIR/piko"
	cd piko && cargo build --release
	cd ..
fi

export RUST_BACKTRACE=1

for f in $CONFIG
do
	echo "Starting $f"
	./piko/target/release/main -p "$DIR/$f"
done

