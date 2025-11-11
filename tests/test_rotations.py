import numpy as np
from mr.rotations import rot_z


def test_rot_z_90():
    Rz = rot_z(np.pi / 2)
    v = np.array([1.0, 0.0, 0.0])
    out = Rz @ v
    assert np.allclose(out, np.array([0.0, 1.0, 0.0]), atol=1e-9)
