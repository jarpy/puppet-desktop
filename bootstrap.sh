#!/bin/bash

sudo apt install --assume-yes puppet rake
puppet module install puppetlabs-stdlib --version 4.25 --target-dir=modules-forge
