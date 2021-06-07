# Defined in - @ line 1
function noc --wraps='env CUDA_VISIBLE_DEVICES=' --description 'alias noc env CUDA_VISIBLE_DEVICES='
  env CUDA_VISIBLE_DEVICES= $argv;
end
