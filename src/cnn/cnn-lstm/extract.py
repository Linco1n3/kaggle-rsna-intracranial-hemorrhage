import sys
import os
import time
import argparse
import random
import collections
import pickle

from apex import amp
import pandas as pd
import numpy as np
from sklearn.metrics import f1_score, roc_auc_score, log_loss

import torch
from torch import nn
import torch.nn.functional as F

from .. import factory
from ..utils import util
from ..utils.config import Config
from ..utils.logger import logger, log

def get_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('config')
    parser.add_argument('--debug', action='store_true')
    parser.add_argument('--fold', type=int, required=True)
    parser.add_argument('--gpu', type=int, default=0)
    parser.add_argument('--snapshot')
    parser.add_argument('--output') 
    parser.add_argument('--n-tta', default=1, type=int)
    parser.add_argument('--seed', default=1234, type=int)
    parser.add_argument('--size', default=480, type=int)
    parser.add_argument('--epochs', default=4, type=int)
    parser.add_argument('--root', default="/home/lincoln/kaggle-rsna-intracranial-hemorrhage", type=str)
    return parser.parse_args()
    
#def main():
args = get_args()
cfg = Config.fromfile(args.config)

# copy command line args to cfg
cfg.mode = args.mode
cfg.debug = args.debug
cfg.fold = args.fold
cfg.snapshot = args.snapshot
cfg.output = args.output
cfg.n_tta = args.n_tta
cfg.gpu = args.gpu
cfg.seed = args.seed
cfg.size = args.size
cfg.epochs = args.epochs
cfg.root = args.root

#logger.setup(cfg.workdir, name='extract_fold%d' % cfg.fold)
log(f'availble_gpu: {torch.cuda.device_count()}')
log(f'will work on gpu: {cfg.gpu}')
torch.cuda.set_device(cfg.gpu)
util.set_seed(cfg.seed)

class Identity(nn.Module):
    def __init__(self):
        super(Identity, self).__init__()
    
    def forward(self, x):
        return x

class IntracranialDataset(Dataset):

    def __init__(self, df, path, labels, transform=None):
        self.path = path
        self.data = df
        self.transform = transform
        self.labels = labels

    def __len__(self):
        return len(self.data)

    def __getitem__(self, idx):
        img_name = os.path.join(self.path, self.data.loc[idx, 'Image'] + '.jpg')
        #img = cv2.imread(img_name, cv2.IMREAD_GRAYSCALE)   
        img = cv2.imread(img_name)    
        img = cv2.resize(img,(cfg.size,cfg.size))
        if self.transform:       
            augmented = self.transform(image=img)
            img = augmented['image']   
        if self.labels:
            labels = torch.tensor(
                self.data.loc[idx, label_cols])
            return {'image': img, 'labels': labels}    
        else:      
            return {'image': img}

log(f'Load Dataframes')