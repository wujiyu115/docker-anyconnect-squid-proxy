#!/bin/sh

run () {
  echo "Connecting to openconnect..."
  echo $OPENCONNECT_PASSWORD | openconnect -u "$OPENCONNECT_USER" $OPENCONNECT_OPTIONS --passwd-on-stdin $OPENCONNECT_URL
  echo "Connected to openconnect!"

  squid3 -NYCd 1
}

until (run); do
  echo "openconnect exited. Restarting process in 60 seconds…" >&2
  sleep 60
done

