import matplotlib.pyplot as plt
import numpy as np
import sys

# unosimo kut za koji imamo podatke, radi naziva slike grafa koju ćemo dobiti
angle = sys.argv[1]

# učitavamo podatke
data = np.loadtxt('pendulum_data.txt')

# izlavčimo podatke po stupcima
time = data[:, 0]
theta_h = data[:, 1]
theta_m = data[:, 2]

# graf
plt.figure(figsize=(10, 6))
plt.plot(time, theta_h, label='Harmoničko njihalo')
plt.plot(time, theta_m, label='Matematičko njihalo')
plt.xlabel('vrijeme (s)')
plt.ylabel('theta (rad)')
plt.title('Simulacija njihala')
plt.legend()

# spremanje grafa kao png
plt.savefig(f'pend_{angle}.png')
