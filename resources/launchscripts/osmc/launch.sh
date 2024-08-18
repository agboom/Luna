#!/usr/bin/sh

resume() {
  killall -CONT kodi.bin
}

trap resume EXIT INT TERM

killall -STOP kodi.bin

mv logfile logfile.old
LD_PRELOAD="/usr/local/lib/libmoonlight-aml.so /usr/osmc/lib/libamavutils.so /usr/osmc/lib/libamadec.so /usr/osmc/lib/libamcodec.so" \
  moonlight stream \
  -platform aml \
  -app "$@" >> logfile 2>&1
