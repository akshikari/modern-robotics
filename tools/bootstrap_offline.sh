#!/usr/bin/env bash
set -euo pipefail

PDF_DIR="docs/references"
WHEEL_DIR="vendor/wheels"
VENDOR_DIR="vendor/modern_robotics"

mkdir -p "$PDF_DIR" "$WHEEL_DIR" "$VENDOR_DIR"

echo "[1/4] Downloading reference PDFs (edit URLs as needed)"
# Replace with official URLs you use; examples commented out:
curl -L -o "$PDF_DIR/ModernRobotics.pdf" "https://hades.mech.northwestern.edu/images/7/7f/Modern_Robotics.pdf"
curl -L -o "$PDF_DIR/UnderactuatedRobotics.pdf" "https://underactuated.csail.mit.edu/underactuated.pdf"
# curl -L -o "$PDF_DIR/SE3_SO3_cheatsheet.pdf" "https://your.cheatsheet.url"

echo "[2/4] Vendoring modern_robotics Python library (optional)"
# Example:
if [ ! -d "$VENDOR_DIR" ]; then
  git clone --depth=1 https://github.com/NxRLab/modern_robotics "$VENDOR_DIR"
  rm -rf "$VENDOR_DIR/.git"
fi

echo "[3/4] Caching Python wheels for offline use (pip download)"
python3 -m pip download \
  --dest "$WHEEL_DIR" \
  numpy scipy matplotlib jupyter ipykernel sympy \
  ruff black mypy pytest pytest-cov

echo "[4/4] Done."
echo "PDFs:   $PDF_DIR"
echo "Wheels: $WHEEL_DIR"
