#!/usr/bin/env python3

# -*- coding: utf8 -*-

import os
import argparse
import re

parser = argparse.ArgumentParser(description='Generate casks for google fonts.')
parser.add_argument('fonts', metavar='FontFolder', type=str,
                    help='Font folder, containing ofl, etc.',
                    default='~/fonts')
parser.add_argument('casks', metavar='CaskFolder', type=str,
                    help='Font cask folder, containing all casks.',
                    default='/usr/local/Homebrew/Library/Taps/caskroom/homebrew-fonts/Casks')
parser.add_argument('--force', dest='force', action='store_true',
                    help='Force generate cask even cask exists.')
parser.set_defaults(force=False)
args = parser.parse_args()

licenses = ['apache', 'ofl', 'ufl']
for lic in licenses:
    fonts_dir = os.path.join(args.fonts, lic)
    if os.path.isdir(fonts_dir):
        fonts = os.listdir(fonts_dir)
        for font in fonts:
            font_dir = os.path.join(fonts_dir, font)
            if os.path.isdir(font_dir):
                cask_url = '/'.join(['https://github.com/google/fonts/trunk', lic, font])
                font_files = [f for f in os.listdir(font_dir) if f.lower().endswith('.ttf')]
                if font_files:
                    for font_file in font_files:
                        if '-' in font_file:
                            name_parts = re.findall('[a-zA-Z][^A-Z]*', font_file.split('-')[0])
                        else:
                            name_parts = re.findall('[a-zA-Z][^A-Z]*', font_file[:-4])
                    cask_name = 'font-'
                    font_name = ''
                    for part in name_parts:
                        cask_name = cask_name + part.lower()
                        font_name = font_name + part
                        if len(part) > 1:
                            cask_name = cask_name + '-'
                            font_name = font_name + ' '
                    cask_name = cask_name.replace('-', ' ').strip().replace(' ', '-')
                    font_name = font_name.strip()
                    cask_file = os.path.join(args.casks, cask_name+'.rb')
                    font_url = '/'.join(['https://fonts.google.com/specimen', font_name.replace(' ', '%20')])
                    if not os.path.isfile(cask_file) or args.force:
                        with open(cask_file, 'w') as f:
                            f.write('cask \''+cask_name+'\' do\n')    #cask 'font-name' do
                            f.write('  version :latest\n')            #  version :latest
                            f.write('  sha256 :no_check\n')           #  sha256 :no_check
                            f.write('\n  # github.com/google/fonts was verified as official when first introduced to the cask\n')
                            f.write('  url \''+cask_url+'\',\n')      #  url 'https://github.com/google/fonts/trunk/license/name'
                            f.write('    using:      :svn,\n')        #    using:      :svn,
                            f.write('    revision:   \'9999999\',\n') #    revision:   '9999999',
                            f.write('    trust_cert: true\n')         #    trust_cert: true
                            f.write('  name \''+font_name+'\'\n')     #  name 'name'
                            f.write('  homepage \''+font_url+'\'\n')  #  homepage 'https://fonts.google.com/specimen/name'
                            f.write('\n')
                            for font_file in font_files:
                                f.write('  font \''+font_file+'\'\n') #  font 'Font.ttf'
                            f.write('end\n')                          #end
