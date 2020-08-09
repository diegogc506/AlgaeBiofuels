#!/usr/bin/env python
# coding: utf-8

# Import the necessary libaries.

# In[3]:


import os
for dirname, _, filenames in os.walk('/kaggle/input'):
    for filename in filenames:
        print(os.path.join(dirname, filename))

import numpy as np
import pandas as pd
pd.plotting.register_matplotlib_converters()
import matplotlib.pyplot as plt
get_ipython().run_line_magic('matplotlib', 'inline')
import seaborn as sns
print("Setup Complete")


# Visualize the head of the composition data file.

# In[4]:


composition_data = pd.read_csv("../input/the-algae-testbed-publicprivate-partnership-atp3/ATP3-UFS-Composition.csv", index_col=0)
composition_data.head()


# In[25]:


comp_data_oct172013 = composition_data.loc[composition_data.SiteID == 'CP'].loc[composition_data.PondID == 'P6']
comp_data_oct172013.head()


# In[26]:


sns.scatterplot(comp_data_oct172013['Duration.days'], comp_data_oct172013['FAME.Lipids.AF'])


# In[7]:


comp_data_oct172013.columns

