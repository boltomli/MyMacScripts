#! /usr/bin/env python

# -*- coding: utf8 -*-

import argparse
import shutil
from subprocess import check_output, run

parser = argparse.ArgumentParser(description='Update every entries found in cask folder.')
parser.add_argument('--pretend', dest='pretend', action='store_true',
                    help='Pretend to take action.')
parser.set_defaults(pretend=False)
args = parser.parse_args()

brew_bin = 'brew'
if not shutil.which(brew_bin):
    raise FileExistsError(brew_bin + ' not exists')

list_command = [
    brew_bin,
    'cask',
    'list'
]

list_installed = str.split(check_output(list_command).decode(), '\n')
list_installed = [i for i in list_installed if i is not '']
for cask in list_installed:
    info_command = [
        brew_bin,
        'cask',
        'info',
        cask
    ]
    try:
        install_status = str.splitlines(check_output(info_command).decode())
    except:
        install_status = 'Not installed'

    version = str.strip(str.split(install_status[0], ':')[1])
    is_version_installed = False
    for line in install_status:
        if not line.startswith(cask) and line.__contains__(cask) and line.__contains__(version):
            is_version_installed = True

    if not is_version_installed:
        print('Installing', cask)
        install_command = [
            brew_bin,
            'cask',
            'install',
            '--force',
            cask
        ]
        if args.pretend:
            print(' '.join(install_command))
        else:
            run(install_command)
        print('Installed', cask)
