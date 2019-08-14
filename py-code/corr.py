#!/usr/bin/env python

import pandas as pd
from os import path

def obs(dir, dat_list=range(1, 333)):
    obs_list = []
    for dat in dat_list:
        p = path.join(dir, '{0:03d}'.format(dat) + '.csv')
        dat_df = pd.read_csv(p)
        obs_list.append([dat, len(dat_df.dropna())])
    return pd.DataFrame(obs_list, columns=('id', 'nobs'))

def corr(dir, thresh):
    valid_obs = obs(dir)[obs(dir).nobs > thresh].id
    corr_list = []
    for id in valid_obs:
        dat = pd.read_csv(path.join(dir, '{0:03d}'.format(id) + '.csv'))
        corr_list.append([dat['sulfate'].corr(dat['nitrate'])])
    return pd.DataFrame(corr_list)

print(corr('specdata', 1000))
