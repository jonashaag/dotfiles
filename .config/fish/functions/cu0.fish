# Defined in - @ line 1
function cu0 --wraps='env CUDA_VISIBLE_DEVICES=0' --description 'alias cu0 env CUDA_VISIBLE_DEVICES=0'
  env CUDA_VISIBLE_DEVICES=0 $argv;
end
