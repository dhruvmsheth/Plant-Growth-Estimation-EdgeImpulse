#!/bin/bash
set -e


SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
PYTHON3=$(which python3 || true)

if [ ! -x "$PYTHON3" ]; then
    echo "Cannot find 'python3' in your PATH. Install Python before you continue."
    echo "Installation instructions: https://www.python.org/downloads/"
    exit 1
fi

echo "Checking Python dependencies..."

HAS_PYSERIAL=$(pip3 list | grep -F pyserial || true)
HAS_INQUIRER=$(pip3 list | grep -F inquirer || true)

if [ -z "$HAS_PYSERIAL" ]; then
    pip3 install pyserial>=3.4
fi

if [ -z "$HAS_INQUIRER" ]; then
    pip3 install inquirer>=2.7.0
fi

echo "Checking Python dependencies OK"
echo ""

echo "Flashing board... "
echo ""

python3 -u ${SCRIPTPATH}/flash_writer.py -s -d -b 115200 -n ${SCRIPTPATH}/edge_impulse_firmware.spk

echo ""
echo "Flashed your Sony Spresense development board."
echo "To set up your development with Edge Impulse, run 'edge-impulse-daemon'"
echo "To run your impulse on your development board, run 'edge-impulse-run-impulse'"
