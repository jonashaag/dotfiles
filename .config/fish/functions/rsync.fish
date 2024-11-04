function rsync
  command rsync -z --compress-level=9 --compress-choice=zstd $argv
end
