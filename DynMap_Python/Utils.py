# -*- coding: utf-8 -*-
"""
Created on Tue Oct 10 21:39:05 2023

@author: PC
"""
import sys, os

class Tile:
    ID = 0 # Tile ID
    x = 0 # x coordinate
    y = 0 # y coordinate
    def __init__(self, ID, x, y):
        self.ID = ID
        self.x = x
        self.y = y

class CGRA:
    size = 0
    Tiles = []
    def __init__(self, size):
        ID = 0
        for y in range(size):
            for x in range(size):
                self.Tiles.append(Tile(ID, x, y))
                ID += 1

CGRA_size = 4

class HiddenPrints:
    def __enter__(self):
        self._original_stdout = sys.stdout
        sys.stdout = open(os.devnull, 'w')

    def __exit__(self, exc_type, exc_val, exc_tb):
        sys.stdout.close()
        sys.stdout = self._original_stdout
