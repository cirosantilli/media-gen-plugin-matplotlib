#!/usr/bin/env python

"""
contains stuff that is common to all plots of this project

takes as input exactly one command line argument which is the
path of a python file with a `plot` which has the same interface as the `plot`:func:

the goal of this design is to separte separate plots into different
files so that:

- it all works well with makefiles so that
    only plots corresponding to modified `.py` files will be replotted on make

- the code is better organized

sample call:

    ./THIS_FILENAME.py subplots

this file should be usable across all latex projects,
don't add anything that is project specific to it
"""

import sys
import os.path
import imp

import matplotlib.pyplot as plt

import params

out_dir = "out"

def plot( plt, out_path_noext, params ):
    """plot on an empty plt object and save the figure

    this is just a dummy method which documents what other plot commands should do

    :param plt: a clean ``matplotlib.pyplot`` object
    :type plt:  ``matplotlib.pyplot``
    :param out_path_noext: output path to save figure to without extension but with a dot
    :type out_path_noext:  string
    :param params: default plot params. Function may override those defaults.
    :type params:  the class `DefaultParameters`:class: (not an instance)
    """
    raise NotImplementedError

if __name__ == '__main__':
    path = sys.argv[1]
    name = os.path.split(os.path.splitext(path)[0])[1]
    try:
        plotter = imp.load_source( name, path )
    except IOError:
        print "path: " + path
        raise
    else:
        out_path_noext = os.path.join( out_dir, name + '.' ) 
        plotter.plot( plt, out_path_noext, params )
