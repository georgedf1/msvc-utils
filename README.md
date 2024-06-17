# MSVC Utils
Various scripts for working with Microsoft Visual C/C++.

Ensure you set the variables in `config.ps1` appropriately for your environment.\
In particular, set `$VSDir` to either:
- A Visual Studio IDE installation root folder (e.g. *"C:\Program Files\Microsoft Visual Studio\2022\Community"*)
- A Visual Studio BuildTools root folder (e.g. *"C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools"*)

#### Scripts
- `config.ps1` is used by other scripts to locate the correct Visual Studio toolchain
- `vcvarsall.ps1` sets the necessary environment variables required to call MSVC tools (e.g. cl.exe)
