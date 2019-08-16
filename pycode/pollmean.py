#!/usr/bin/env python

# Gets data from files in list and produces mean over those files for
# the pollutant named.

import pandas as pd
from os import path

def getdata(dir, pol, dat_list=range(1, 333)):
    df_list = []
    for dat in dat_list:
        p = path.join(dir, 'specdata', '{0:03d}'.format(dat) + '.csv')
        df_list.append(pd.read_csv(p))
    dat_final = pd.concat(df_list, ignore_index=True)
    return round(dat_final[pol].mean(), 3)
