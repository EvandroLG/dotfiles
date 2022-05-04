function size-all-files --argument extension
  find . -name "*.$extension" | xargs du -sch
end
