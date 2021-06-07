function lite --description 'alias lite vim -p (rg -l ...)'
  sqlite3 -csv -header $argv | pspg --no-sigint-exit --csv --csv-header=on --double-header
end
