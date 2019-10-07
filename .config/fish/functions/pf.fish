function pf
  python -c "import importlib,sys; print(importlib.import_module('$argv').__file__)"
end
