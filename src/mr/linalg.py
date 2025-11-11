from __future__ import annotations
import numpy as np
import numpy.typing as npt


def hat(omega: npt.NDArray[np.float64]) -> npt.NDArray[np.float64]:
    """Skew-symmetric matrix (hat) for a 3-vector."""
    wx, wy, wz = omega
    return np.array([[0.0, -wz, wy], [wz, 0.0, -wx], [-wy, wx, 0.0]], dtype=np.float64)


def vee(omega_hat: npt.NDArray[np.float64]) -> npt.NDArray[np.float64]:
    """Inverse of hat (vee) for a 3x3 skew-symmetric matrix."""
    return np.array([omega_hat[2, 1], omega_hat[0, 2], omega_hat[1, 0]], dtype=np.float64)
