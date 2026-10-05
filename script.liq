settings.init.allow_root.set(true)

# 1. Deine Hörbuch-Playlist im unendlichen Loop einlesen
music = playlist(
  mode="randomize", 
  reload_mode="watch", 
  loop=true, 
  "/home/radio/music"
)

# 2. DER AKUSTISCHE ATEM-TRICK:
# Wir schweißen eine exakte Pause von 8.0 Sekunden zwischen die Tracks!
# In dieser Zeit sendet das Radio absolute Stille, bevor das nächste Werk ansetzt.
music_with_pause = delay(8.0, music)

# 3. Den Stream krisensicher machen
radio = mksafe(music_with_pause)

# 4. Das fertige Signal in den RAM-Tunnel drücken
output.file(
  %mp3(bitrate=128),
  append=true,
  fallible=true,
  "/tmp/stream/live.mp3",
  radio
)
