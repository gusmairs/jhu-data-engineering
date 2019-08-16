#!/usr/bin/env python

import pandas as pd
from os import path
from pycode.complete import obs

def corr(dir, thresh):
    all_dat = obs(dir)
    valid_obs = all_dat.loc[all_dat.nobs > thresh].id
    corr_list = []
    for id in valid_obs:
        dat = pd.read_csv(
            path.join(dir, 'specdata', '{0:03d}'.format(id) + '.csv')
        )
        corr_list.append(
            (id, dat['sulfate'].corr(dat['nitrate']))
        )
    cor_table = pd.DataFrame(
        corr_list, columns=['station', 'correlation']
    ).sort_values(by='correlation', ascending=False)
    return cor_table
