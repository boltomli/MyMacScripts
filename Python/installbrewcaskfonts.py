#! /usr/bin/env python3

# -*- coding: utf8 -*-

import argparse
import shutil
from subprocess import check_output, run
from tqdm import tqdm

parser = argparse.ArgumentParser(description='Install every fonts from caskroom/fonts.')
parser.add_argument('--pretend', dest='pretend', action='store_true',
                    help='Pretend to take action.')
parser.add_argument('--forceuninstall', dest='forceuninstall', action='store_true',
                    help='Force uninstall before install.')
parser.set_defaults(pretend=False, forceuninstall=False)
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

search_command = [
    brew_bin,
    'cask',
    'search',
    '/font-/'
]
list_fonts = str.split(check_output(search_command).decode(), '\n')
list_fonts = [i for i in list_fonts if i not in list_installed]

if list_fonts:
    pbar = tqdm(list_fonts)
    for cask in pbar:
        pbar.set_description(cask)
        try:
            install_command = [
                brew_bin,
                'cask',
                'install',
                #'--force',
                cask
            ]
            if args.pretend:
                print(' '.join(install_command))
            else:
                if args.forceuninstall:
                    uninstall_command = [
                        brew_bin,
                        'cask',
                        'uninstall',
                        '--force',
                        cask
                    ]
                    run(uninstall_command)
                run(install_command)
        except:
            print(cask + ' installation is broken')
