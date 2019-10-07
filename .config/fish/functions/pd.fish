function pd
  python -c "import importlib,sys,os; print(os.path.dirname(importlib.import_module('$argv').__file__))"
end
