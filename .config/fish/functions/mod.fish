function mod
  set tmp (mktemp)
  cp $argv[1] $tmp
  if [ $status = 0 ]
    cat $tmp | eval $argv[2] > $argv[1]
    if [ $status = 0 ]
      rm $tmp
    else
      cp $tmp $argv[1]
      echo "Command $argv[2] failed, restored $argv[1]"
    end
  else
    echo "Copy to $tmp failed"
  end
end
