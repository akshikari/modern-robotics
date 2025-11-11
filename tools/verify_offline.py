import numpy as np
from math import pi, sin

# SO(3) sanity: 90 deg about Z
Rz = np.array([[0, -1, 0], [1, 0, 0], [0, 0, 1]], dtype=float)
v = np.array([1.0, 0.0, 0.0])
rot_v = Rz @ v
assert np.allclose(rot_v, np.array([0.0, 1.0, 0.0]), atol=1e-9)

# SHM sanity
A, w, phi, t = 0.1, 2 * pi * 2.0, pi / 2, 0.25
x = A * sin(w * t + phi)
a = -A * (w**2) * sin(w * t + phi)
assert np.isfinite([x, a]).all()

print("✅ Offline math checks passed.")
