# -*- coding: utf-8 -*-
"""
Created on Thu Nov  2 20:35:23 2023

@author: PC
"""

import re
# import xlsxwriter
static_url = r"C:\Users\PC\Desktop\static.txt"
node_url = r"C:\Users\PC\Desktop\node name.txt"
# 读取txt 并提取指定字符
def Analyze():
    with open(static_url, 'r', encoding='utf-8') as f:
        static = f.read()  # 读取txt文件内容 保存到content中

    nodeIDs = re.findall("schedule dfg node\[(.*)\] onto", static) 
    tiles = re.findall("onto fu\[(.*)\] at cycle", static) 
    PCs = re.findall("at cycle (.*) within", static) 
    
    print("yes")
    

Analyze()
