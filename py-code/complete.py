#!/usr/bin/env python
# Determiens the number of complete cases in the range of data files given,
# returning a dataframe with headers 'id' and 'nobs'.

import pandas as pd
from os import path

def obs(dir, dat_list=range(1, 333)):
    obs_list = []
    for dat in dat_list:
        p = path.join(dir, '{0:03d}'.format(dat) + '.csv')
        dat_df = pd.read_csv(p)
        obs_list.append([dat, len(dat_df.dropna())])
    return pd.DataFrame(obs_list, columns=('id', 'nobs'))

print(obs('specdata'))
