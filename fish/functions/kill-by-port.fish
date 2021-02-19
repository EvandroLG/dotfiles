function kill-by-port --argument port
  kill (lsof -t -i:$port)
end
