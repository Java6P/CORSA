# Multimodal Aspect-Based Sentiment Analysis under Conditional Relation

Codes for Multimodal Aspect-Based Sentiment Analysis under Conditional Relation (COLING 2025)

## Datasets

The repository ships the **annotation JSON files** for all three datasets
(Twitter-2015, Twitter-2017, TRC pre-training) under `src/data/`.

You need to download the **image files** separately because they are too large
to host in the repository.

### What is already included

| Dataset | Annotation files | Location |
|---------|-----------------|----------|
| Twitter-2015 | `train.json`, `dev.json`, `test.json` | `src/data/twitter2015/` and `src/data/twitter2015_obj/` |
| Twitter-2017 | `train.json`, `dev.json`, `test.json` | `src/data/twitter2017/` and `src/data/twitter2017_obj/` |
| TRC (pre-train) | `trc.json` | `src/data/TRC/` |

### Downloading the image files

**Twitter-2015 / Twitter-2017 images**

The Twitter image sets are distributed by the authors of
[AoM](https://github.com/SilyRab/AoM/) (which CORSA builds upon).
Please visit their repository and follow the data-download instructions there.
You may also find the images in the original dataset repositories:

- [UMT (Twitter-2015 / Twitter-2017)](https://github.com/jefferyYu/UMT)
- [FITE](https://github.com/NUSTM/FITE)

After downloading, extract the archives so that you have:

```
data/
├── twitter2015_images/   # one JPG per tweet
└── twitter2017_images/   # one JPG per tweet
```

**ResNet-152 weights** (required for TRC pre-training only)

```bash
wget -P ./src/resnet/ \
    https://download.pytorch.org/models/resnet152-394f9c45.pth
mv ./src/resnet/resnet152-394f9c45.pth ./src/resnet/resnet152.pth
```

> A full walk-through is also available in [`download_data.sh`](download_data.sh).

### Pointing the scripts at your images

Pass `--img_path` when running fine-tuning:

```bash
python3 MAESC_training.py \
    --dataset twitter15 ./src/data/jsons/twitter15_info.json \
    --img_path ./data/twitter2015_images \
    ...
```

Or edit `15_pretrain_full.sh` / `17_pretrain_full.sh` and set `--img_path`
to the absolute path where you saved the images.

## Pre-Training

```bash
sh TRC_pretrain.sh
```

## MABSA finetuning

```bash
sh 15_pretrain_full.sh
sh 17_pretrain_full.sh
```

## Acknowledgements
Our framework and some codes are based on [AoM](https://github.com/SilyRab/AoM/), thanks very much!

