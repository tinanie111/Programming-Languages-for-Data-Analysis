#!/usr/bin/env python
# coding: utf-8

# In[1]:


from math import factorial 
import matplotlib.pyplot as plt
import numpy as np


# In[2]:


def factorialfunction(i):
    if 365-i >= 1:
        # implement the equation
        return 1-factorial(365)/factorial(365-i)/365**i


# In[3]:


def probabilitylist(n):
    probabilitylist = []
    for i in range(n):
        probabilitylist.append(factorialfunction(i))
    return probabilitylist


# In[6]:


#Running result
probabilitylist(100)


# In[7]:


def presentplot(n):
    plt.plot(probabilitylist(n))
    plt.xticks(np.arange(0,n+1,5))
    plt.yticks(np.arange(0,1.2,0.1))
    plt.grid()
    plt.show()


# In[8]:


if __name__=="__main__":
    n = 100
    presentplot(n)


# In[ ]:





# In[ ]:




