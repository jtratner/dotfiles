#!/usr/bin/python
import argparse


def convert(path):
    with open(path) as f:
        for line in f:
            print r'"%s\n",' % line.rstrip('\n').replace('"', r'\"')


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('path')
    nspace = parser.parse_args()
    convert(nspace.path)
