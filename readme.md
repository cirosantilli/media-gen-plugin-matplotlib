automates the creation of python matplotlib plots for usage in book projects (latex, html, etc) projects

# install with media gen

this is a media-gen-plugin as defined in https://github.com/cirosantilli/media-gen/tree/1.0/readme.md#known-stable-media-gen-plugins
and it is suggested that you install this with media-gen as explained in the media-gen page.

# usage

after installing, an `./in/` dir will be created in the plugin dir

the simplest way to do the plots is to put `.py` files there that will do the plotting.

those `.py` files must contain an interface as specified in `shared.py`.

the `makefile` expects to make one ouptut file for each `.py` in that dir
in this way, `make` will only remake a plot if the source was modified.

if you need more complex relationships between output and input ( ex: 1 file generates 2 figures )
you may want to create a custom makefile
