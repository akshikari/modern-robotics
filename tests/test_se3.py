import numpy as np
from mr.se3 import adjoint


def test_adjoint_shape():
    T = np.eye(4)
    A = adjoint(T)
    assert A.shape == (6, 6)
