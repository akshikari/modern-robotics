from __future__ import annotations
import numpy as np
import numpy.typing as npt
from .linalg import hat


def adjoint(T: npt.NDArray[np.float64]) -> npt.NDArray[np.float64]:
    """Adjoint matrix Ad_T for SE(3) transform T."""
    R = T[:3, :3]
    p = T[:3, 3]
    p_hat = hat(p)
    top = np.hstack([R, np.zeros((3, 3))])
    bot = np.hstack([p_hat @ R, R])
    return np.vstack([top, bot])
