
settings.init.allow_root.set(true)

# Unendlicher Loop im Zufallsmodus für deine Hörbücher
music = playlist(
  mode="randomize", 
  reload_mode="watch", 
  loop=true, 
  "/home/radio/music"
)

# Ohne Crossfade: Kapitel spielen absolut sauber bis zur letzten Sekunde aus!
radio = mksafe(music)

output.file(
  %mp3(bitrate=128),
  append=true,
  fallible=true,
  "/tmp/stream/live.mp3",
  radio
)
