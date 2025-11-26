#!/usr/bin/env bash
# robust intense nmap runner
# prints the exact command before running (dry-run).
# uses an array for nmap flags to avoid word-splitting issues.

set -euo pipefail
IFS=$'\n\t'

BASE_DIR="${HOME}/scan_history_intense"
# Put flags into an array (safe)
NMAP_FLAGS=( -sS -sV -O -T5 --max-retries 1 --host-timeout 2m )

timestamp() { date +"%Y-%m-%d_%H-%M-%S"; }
log() { echo "[$(date +"%Y-%m-%d %H:%M:%S")] $*"; }

# Ask for target
read -rp "Enter target (IP, CIDR or hostname): " TARGET
if [ -z "$TARGET" ]; then
  echo "No target entered. Exiting."
  exit 1
fi

echo
echo "You entered: $TARGET"
echo "This will run an aggressive -T5 scan."
read -rp "Type 'yes' to continue: " CONFIRM
if [ "$CONFIRM" != "yes" ]; then
  echo "Scan cancelled."
  exit 0
fi

# Ensure output folders exist
mkdir -p "$BASE_DIR"
SAFE_TARGET=$(echo "$TARGET" | tr '/:' '_')
TS=$(timestamp)
OUTBASE="${BASE_DIR}/${SAFE_TARGET}_${TS}"

# Build command safely using array expansion
# We'll show what will be executed (dry-run) before running.
CMD=( sudo nmap "${NMAP_FLAGS[@]}" -oA "$OUTBASE" "$TARGET" )

log "Dry-run — command that will be executed:"
# Print each argument quoted so you can inspect invisible chars
printf ' %q' "${CMD[@]}"
echo
echo

# Final confirmation (one more)
read -rp "Proceed to run the above command? (type 'go' to run): " RUNCONF
if [ "$RUNCONF" != "go" ]; then
  echo "Aborted."
  exit 0
fi

log "Running nmap..."
"${CMD[@]}"
EXIT=$?

if [ $EXIT -eq 0 ]; then
  log "Scan finished successfully. Outputs:"
  log "  ${OUTBASE}.nmap"
  log "  ${OUTBASE}.xml"
  log "  ${OUTBASE}.gnmap"
else
  log "Nmap exited with code $EXIT. Check ${OUTBASE}.nmap if present."
fi

log "Done."

