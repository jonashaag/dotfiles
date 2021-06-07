# Defined in - @ line 1
function cu1 --wraps='env CUDA_VISIBLE_DEVICES=1' --description 'alias cu1 env CUDA_VISIBLE_DEVICES=1'
  env CUDA_VISIBLE_DEVICES=1 $argv;
end
