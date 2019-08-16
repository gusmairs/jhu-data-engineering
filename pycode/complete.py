#!/usr/bin/env python

# Determines the number of complete cases in the range of data files given,
# returning a dataframe with headers 'id' and 'nobs'.

import pandas as pd
from os import path

def obs(dat_list=range(1, 333)):
    with open('pycode/data_path.txt', 'r') as f:
        dir = f.readlines()[0].replace('\n', '')
    obs_list = []
    for dat in dat_list:
        p = path.join(dir, 'specdata', '{0:03d}'.format(dat) + '.csv')
        dat_df = pd.read_csv(p)
        obs_list.append([dat, len(dat_df.dropna())])
    return pd.DataFrame(obs_list, columns=('id', 'nobs'))
