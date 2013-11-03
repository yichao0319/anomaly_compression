#!/bin/bash

matlab -r "[tp, tn, fp, fn, precision, recall, f1score] = srmf_based('INPUT_DIR', 'FILENAME', NUM_FRAMES, WIDTH, HEIGHT, GROUP_SIZE, RANK, THRESH, OPT_SWAP_MAT, OPT_TYPE); fh = fopen(['/u/yichao/anomaly_compression/condor_data/subtask_compressive_sensing/condor/output/srmf_based.FILENAME.NUM_FRAMES.WIDTH.HEIGHT.GROUP_SIZE.RANK.THRESH.OPT_SWAP_MAT.OPT_TYPE.txt'], 'w'); fprintf(fh, '%d, %d, %d, %d, %f, %f, %f\n', tp, tn, fp, fn, precision, recall, f1score); fclose(fh); exit;"