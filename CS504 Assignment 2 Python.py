#!/usr/bin/env python
# coding: utf-8

# # CS 504 Progamming Languages for Data Analysis
# 
# Assignment 2
# 
# Lin, Junjia 002268506
# 
# Nie,Luyun 002268087

# Method 1: Python

# In[1]:


from scipy.misc import derivative
from scipy.stats import norm
import matplotlib.pyplot as plt
import math
import numpy as np


# In[2]:


# Define the function of finding the error method of CDF
def finderrorcdf(nmd):
    cdf2 = []
    for i in nmd:
        cdf2.append(0.5*(1+math.erf(i/math.sqrt(2))))
    return cdf2


# In[3]:


# Define the function of comparing 2 CDF Methods 
def comparecdf(nmd):
    difference = []
    cdf1,cdf2 = norm.cdf(nmd).tolist(),finderrorcdf(nmd)
    for i in range(len(cdf1)):
        difference.append(cdf2[i]-cdf1[i])
    maxdifference = round(max(difference),5)
    return maxdifference


# In[4]:


# Define a normal Guass distribution with 𝜇 = 0,𝜎**2 = 1 and has 1000 variables
nmd = np.linspace(norm.ppf(0.001),norm.ppf(0.999), 1000)


# Question 1: Finding the differences between 2 CDF methods

# In[5]:


comparecdf(nmd)


# Answer: By retrieving the function of 'comparecdf', we easily find that there is no difference between two methods. 

# Question 2: Plot the nornal PDF and its first derivative and the second derivative

# In[6]:


plt.plot(nmd,norm.pdf(nmd),color = 'red')
plt.plot(nmd,derivative(norm.pdf,nmd,n = 1),color = 'yellow')
plt.plot(nmd,derivative(norm.pdf,nmd,n = 2),color = 'blue')
plt.xlabel('Values')
plt.ylabel('Probability')
plt.title('Plot of Normal PDF')
plt.text(-3.6, 0.3, r'$NormalPDF,\ \mu=1,\ \sigma=0$')
plt.annotate('first derivative', xy=(1.5, -0.2), xytext=(1.5, -0.3),
            arrowprops=dict(facecolor='yellow', shrink=0.001))
plt.annotate('second derivative', xy=(-1.1, -0.05), xytext=(-3.6, -0.2),
            arrowprops=dict(facecolor='blue', shrink=0.001))
plt.xticks(np.arange(-4,4.5, step=0.5)) 
plt.grid(True)
plt.show()


# Answer: as you can see above, when x = 0, the first derivative of the normal PDF is also 0. Similarily, when x = -1 or +1, the second derivative is 0 as well.
