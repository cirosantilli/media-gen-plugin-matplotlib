automates the creation of python matplotlib plots for usage in book projects (latex, html, etc) projects

follows the media-gen-plugin interface defined in https://github.com/cirosantilli/media-gen/tree/1.1/readme.md#media-gen-plugin
see that page for installation and usage instructions.

# usage

on make every `.py` file insinde `in/` will be transformed into a `png` file at `out/`

those `.py` files must contain an interface as specified in `shared.py`.

if you need more complex relationships between output and input
( ex: 1 file generates 2 figures )
you may want to create a custom makefile
