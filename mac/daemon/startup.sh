#!/bin/bash
# One launchd agent supervises every login-time background service.
# launchd starts with a minimal PATH, so set it here.
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
set -uo pipefail

LOG_DIR="$HOME/Library/Logs"
SING_BOX_DIR="${SING_BOX_DIR:-$HOME/code/proxy/sing-box}"

mkdir -p "$LOG_DIR"

pids=""

log() {
	printf '%s %s\n' "$(date '+%Y-%m-%dT%H:%M:%S')" "$*"
}

stop_all() {
	for pid in $pids; do
		kill "$pid" 2>/dev/null
	done
	wait
}

trap 'log "signal received, stopping"; stop_all; exit 0' TERM INT

# Each service runs in its own process with its own log, exactly as its former
# standalone agent did.
run_sing_box() {
	cd "$SING_BOX_DIR" || exit 1
	exec sing-box run -c client.json
}

run_ollama() {
	export OLLAMA_FLASH_ATTENTION=1
	export OLLAMA_KEEP_ALIVE=1h
	export OLLAMA_KV_CACHE_TYPE=q8_0
	export OLLAMA_MAX_LOADED_MODELS=1
	(sleep 5; ollama run gemma4:e4b-mlx "" >/dev/null 2>&1) &
	exec ollama serve
}

start() {
	name=$1
	binary=$2
	runner=$3
	if ! command -v "$binary" >/dev/null 2>&1; then
		log "$name: $binary not on PATH, skipped"
		return
	fi
	"$runner" >>"$LOG_DIR/$name.log" 2>&1 &
	pids="$pids $!"
	log "$name: started pid $!"
}

# One-shot tasks exit on their own, so they stay out of $pids and never trigger
# the restart below.
run_once() {
	name=$1
	shift
	if ! command -v "$1" >/dev/null 2>&1; then
		log "$name: $1 not on PATH, skipped"
		return
	fi
	(
		"$@" >>"$LOG_DIR/$name.log" 2>&1
		log "$name: exited $?"
	) &
	log "$name: running $*"
}

run_once lima limactl start docker
run_once mutagen mutagen daemon start

start sing-box sing-box run_sing_box
start ollama ollama run_ollama

if [ -z "$pids" ]; then
	log "no services started"
	exit 0
fi

# Exit on the first child death so launchd's KeepAlive restarts the whole set.
while true; do
	for pid in $pids; do
		if ! kill -0 "$pid" 2>/dev/null; then
			log "pid $pid exited, restarting agent"
			stop_all
			exit 1
		fi
	done
	sleep 5
done
