# Defined in - @ line 1
function vrg --description 'alias vrg vim -p (rg -l ...)'
  vim -p (rg -l $argv);
end
