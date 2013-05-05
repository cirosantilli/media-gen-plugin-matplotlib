a media-gen-plugin as defined in https://github.com/cirosantilli/latex-template/tree/1.1/media-gen#media-gen-plugin
to automate the creation of python matplotlib plots for usage in latex projects

# install

    #name of the subdir of media-gen in which to install
    DIRNAME=matplotlib

    cd media-gen
    mkdir "$DIRNAME"
    cd "$DIRNAME"
    git clone https://github.com/cirosantilli/media-gen-plugin-matplotlib.git shared
    cd shared
    ./intall.sh

# usage

after installing, an `./in/` dir will be created in the plugin dir

the simplest way to do the plots is to put `.py` files there that will do the plotting.

those `.py` files must contain an interface as specified in `shared.py`.

the `makefile` expects to make one ouptut file for each `.py` in that dir
in this way, `make` will only remake a plot if the source was modified.

if you need more complex relationships between output and input ( ex: 1 file generates 2 figures )
you may want to create a custom makefile
