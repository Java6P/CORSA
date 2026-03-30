#!/usr/bin/env bash
# =============================================================================
# CORSA Dataset Download Guide
# =============================================================================
#
# This repository requires two types of data:
#   1. Annotation JSON files  – already included in src/data/
#   2. Twitter image files    – must be downloaded separately (large files)
#
# The annotation JSON files for Twitter-2015, Twitter-2017, and the TRC
# pre-training set are committed to this repository under CORSA/src/data/.
# You only need to download the image archives below.
#
# =============================================================================
# Step 1 – Download Twitter image datasets
# =============================================================================
#
# The Twitter-2015 and Twitter-2017 image sets used in MABSA research are
# distributed by the authors of the AoM paper (which CORSA builds upon):
#
#   AoM GitHub: https://github.com/SilyRab/AoM
#
# Please visit the link above and follow their data-download instructions.
# The images are typically provided as a Google Drive archive containing:
#
#   twitter2015_images/   – images referenced in src/data/twitter2015/
#   twitter2017_images/   – images referenced in src/data/twitter2017/
#
# After downloading, extract the archives and place the image folders where
# you like (see Step 2 for how to point the training scripts at them).
#
# Alternative sources (check for the most up-to-date links):
#   https://github.com/jefferyYu/UMT  (original Twitter-2015/2017 splits)
#   https://github.com/NUSTM/FITE
#
# =============================================================================
# Step 2 – Download the pretrained ResNet-152 weights (TRC pre-training only)
# =============================================================================
#
# TRC pre-training uses a ResNet-152 image encoder.  Download the weights from
# the official PyTorch model zoo:
#
#   wget -P ./src/resnet/ \
#     https://download.pytorch.org/models/resnet152-394f9c45.pth
#   mv ./src/resnet/resnet152-394f9c45.pth ./src/resnet/resnet152.pth
#
# =============================================================================
# Step 3 – Update paths in the training scripts
# =============================================================================
#
# After downloading the images, pass --img_path to the training scripts so
# CORSA knows where to find them:
#
#   # Fine-tune on Twitter-2015
#   python3 MAESC_training.py \
#       --dataset twitter15 ./src/data/jsons/twitter15_info.json \
#       --img_path /path/to/twitter2015_images \
#       ... (other arguments as in 15_pretrain_full.sh)
#
#   # Fine-tune on Twitter-2017
#   python3 MAESC_training.py \
#       --dataset twitter17 ./src/data/jsons/twitter17_info.json \
#       --img_path /path/to/twitter2017_images \
#       ... (other arguments as in 17_pretrain_full.sh)
#
#   # TRC pre-training
#   python3 pretrain_trc.py \
#       --dataset TRC ./src/data/jsons/TRC_info.json \
#       --resnet_path ./src/resnet/resnet152.pth \
#       ... (other arguments as in TRC_pretrain.sh)
#
# You can also edit the shell scripts (15_pretrain_full.sh, 17_pretrain_full.sh,
# TRC_pretrain.sh) directly and set --img_path / --resnet_path to absolute
# paths on your machine.
#
# =============================================================================
# Quick reference – directory layout expected by the code
# =============================================================================
#
#  CORSA/
#  ├── src/
#  │   ├── data/
#  │   │   ├── twitter2015/          (annotation JSON – already in repo)
#  │   │   ├── twitter2015_obj/      (annotation JSON – already in repo)
#  │   │   ├── twitter2017/          (annotation JSON – already in repo)
#  │   │   ├── twitter2017_obj/      (annotation JSON – already in repo)
#  │   │   └── TRC/                  (annotation JSON – already in repo)
#  │   └── resnet/
#  │       └── resnet152.pth         (download in Step 2)
#  └── data/                         (create this folder yourself)
#      ├── twitter2015_images/       (download in Step 1)
#      └── twitter2017_images/       (download in Step 1)
#
# =============================================================================

echo "Please follow the instructions in this script to download the required data."
echo "See comments above for details."
