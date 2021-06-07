function fileio
  curl -s -F file=@"$argv[1]" https://file.io | jq -r .link
end
