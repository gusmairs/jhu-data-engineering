#!/usr/bin/env python

# Gets data from files in numbered list and concatenates into one
# file with a single header.

import pandas as pd
from os import path

def catdata(dat_list):
    df_list = []
    for dat in dat_list:
        p = path.join('{0:03d}'.format(dat) + '.csv')
        df_list.append(pd.read_csv(p))
    dat_final = pd.concat(df_list, ignore_index=True)
    dat_final.to_csv('dir/py_cat.csv', index=False)
    return

catdata(range(1, 6))
