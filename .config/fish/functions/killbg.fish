function killbg
 set output (jobs -p 2>&1 | grep -v Process)
 if test $status -eq 0
  if echo $output | grep -q ' '
   echo >&2 "Found multiple processes: $output"
  else
   kill $output
   echo >&2 "Killed process $output"
  end
 else
  echo >&2 "Found no processes"
 end
end
