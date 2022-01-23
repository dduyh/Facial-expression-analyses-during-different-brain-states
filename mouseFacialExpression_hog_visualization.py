# -*- coding: utf-8 -*-
"""
Created on Sun Jul  4 19:45:34 2021

@author: pc
"""

# %%

import pandas as pd
import seaborn as sns
import numpy as np  
import matplotlib.pyplot as plt 
from skimage import io
from skimage.feature import hog
from joblib import Parallel, delayed
import cv2
import glob
import matplotlib.image as mpimg


# %%

coll = io.ImageCollection("D:/duyh/video/20210628 optogenetics_video/Exp/sleep_trial1/*.jpg")

filenames = coll.files

for i in range(len(coll)):

    image = coll[i]
    fd, hog_image = hog(image[50:590, 15:785], orientations=9, pixels_per_cell=(8, 8), cells_per_block=(2, 2), block_norm='L2-Hys', visualize=True, transform_sqrt=True, feature_vector=True, multichannel=True)
    
    width = 770
    height = 540
    dpi = 300
    plt.figure(figsize=(width/dpi, height/dpi), dpi=dpi)
    
    plt.subplots_adjust(top=1,bottom=0,left=0,right=1,hspace =0, wspace =0)
    plt.margins(0,0)
    
    plt.imshow(hog_image, cmap="gray")
    
    filename = filenames[i]
    plt.savefig('D:/duyh/video/20210628 optogenetics_video/Exp/hog_image_trial1_8/' + filename[59:len(filename)])
    plt.close()

