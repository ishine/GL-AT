#!/bin/bash
DATASET_DIR="/"
WORKSPACE="/workspaces"
GPU_ID=6
MODEL_TYPE='Cnn10'
# MODEL_TYPE='Wavegram_Logmel_Cnn14'
# MODEL_TYPE='ResNet38'
BATCH_SIZE=32
N=5
LENGTH=3
# N : 1,2,3,4,5,6,7
# LENGTH : 1,2,3,4,5
# ============ Train & Inference ============
CUDA_VISIBLE_DEVICES=$GPU_ID python3 pytorch/main.py train --workspace=$WORKSPACE --data_type='full_train' --window_size=1024 --hop_size=320 --mel_bins=64 --fmin=50 --fmax=14000 --model_type=$MODEL_TYPE --loss_type='clip_bce' --balanced='balanced' --augmentation='none' --batch_size=$BATCH_SIZE --learning_rate=2e-4 --resume_iteration=0 --early_stop=300000 --N=$N --length=$LENGTH --cuda
