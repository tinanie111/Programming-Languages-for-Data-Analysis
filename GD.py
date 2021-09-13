import math
import random
import numpy as np
from matplotlib import pyplot as plt
from numpy.lib import append
import pandas as pd
def rouletteSpins(p: float):
    x = 0
    while True:
        x = x+1
        if random.random() < p:
            return x
            break

p, xGrid, N = 18/37, np.arange(1, 8), int(math.pow(10, 6))
mcC = []
for i in range(N):
    mcC = append(mcC, rouletteSpins(p))
mcEstimate = pd.value_counts(mcC)/N
print(mcEstimate)
gDist = np.random.geometric(p, N)
gPmf = pd.value_counts(gDist)/N
print(gPmf)

plt.bar(xGrid, mcEstimate[xGrid],width=0.3, color="blue", alpha=0.5)
plt.bar(xGrid, gPmf[xGrid], width=0.15, color='red', alpha=0.5)
plt.scatter(xGrid, mcEstimate[xGrid], color='blue', alpha=0.7)
plt.scatter(xGrid, gPmf[xGrid], color='red', alpha=0.7)
plt.xlim(0, 8)
plt.ylim(0, 0.5)
plt.yticks(np.arange(0, 1, 0.1))
plt.xlabel('X')
plt.ylabel('Probability')
plt.legend(["mcEstimate", "PMF"], loc='best', frameon=True)
plt.show()

