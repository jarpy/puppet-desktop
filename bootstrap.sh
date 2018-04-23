#!/bin/bash

sudo aptitude install --assume-yes puppet rake
puppet module install stankevich-python --version 1.18 --target-dir=modules-forge
puppet module install puppetlabs-stdlib --version 4.25 --target-dir=modules-forge
