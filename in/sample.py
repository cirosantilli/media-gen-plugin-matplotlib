#!/usr/bin/env python

def plot( plt, out_path_noext, params ):
    plt.plot([0,1])
    plt.savefig(
        out_path_noext + params.out_ext,
        format=params.out_ext,
        bbox_inches='tight',
    )
