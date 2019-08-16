#!/usr/bin/env python

import pandas as pd
from os import path
from pycode.complete import obs

def corr(thresh):
    with open('pycode/data_path.txt', 'r') as f:
        dir = f.readlines()[0].replace('\n', '')
    all_dat = obs()
    valid_obs = all_dat.loc[all_dat.nobs > thresh].id
    corr_list = []
    for id in valid_obs:
        dat = pd.read_csv(
            path.join(dir, 'specdata', '{0:03d}'.format(id) + '.csv')
        )
        corr_list.append([dat['sulfate'].corr(dat['nitrate'])])
    return pd.DataFrame(corr_list)
