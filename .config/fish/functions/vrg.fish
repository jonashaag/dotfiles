function vrg --description 'alias vrg vim -p (rg -l ...)'
  vim -p (rg -l $argv);
end
