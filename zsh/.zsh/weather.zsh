function weather() {
  local city="${1:-}"

  if [ -z "$city" ]; then
	echo "Usage: weather <city>"
	return 1
  fi

  curl -s "wttr.in/$city"
}
