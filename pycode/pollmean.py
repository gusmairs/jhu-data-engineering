#!/usr/bin/env python

# Gets data from files in list and produces mean over those files for
# the pollutant named.

import pandas as pd
from os import path

def getmean(dir, pol, dat_list=range(1, 333)):
    new_list = []
    for dat in dat_list:
        p = path.join(dir, 'specdata', f'{dat:03}.csv'.format(dat))
        new_list.append(pd.read_csv(p))
    dat_final = pd.concat(new_list, ignore_index=True)
    p_mean = round(dat_final[pol].mean(), 3)
    return p_mean
