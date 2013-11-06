#!/bin/bash

func="mpeg_based_pred"


# for filename in "TM_Airport_period5_"; do
for filename in "tm.sort_ips.ap.country.txt.3600." "tm.sort_ips.ap.gps.4.txt.3600." "tm.select_matrix_for_id-Assignment.txt.60."; do

    if [[ ${filename} == "TM_Airport_period5_" ]]; then
        input_dir="\/u\/yichao\/anomaly_compression\/condor_data\/subtask_process_4sq\/TM\/"
        num_frames=12
        width=300
        height=300

        opt_swap_mats=(0 1 2 3)
        block_sizes=(30)
    fi
    if [[ ${filename} == "tm.sort_ips.ap.country.txt.3600." ]]; then
        input_dir="\/u\/yichao\/anomaly_compression\/condor_data\/subtask_parse_sjtu_wifi\/tm\/"
        num_frames=9
        width=346
        height=346

        opt_swap_mats=(0 3)
        block_sizes=(30 100 150)
    fi
    if [[ ${filename} == "tm.sort_ips.ap.gps.4.txt.3600." ]]; then
        input_dir="\/u\/yichao\/anomaly_compression\/condor_data\/subtask_parse_sjtu_wifi\/tm\/"
        num_frames=9
        width=741
        height=741

        opt_swap_mats=(0 3)
        block_sizes=(70 125 247)
    fi
    if [[ ${filename} == "tm.select_matrix_for_id-Assignment.txt.60." ]]; then
        input_dir="\/u\/yichao\/anomaly_compression\/condor_data\/subtask_parse_huawei_3g\/signaling_tm\/"
        num_frames=12
        width=28
        height=28

        opt_swap_mats=(0 3)
        block_sizes=(10 14 28)
    fi

    seeds=(1 2 3 4 5 6 7 8 9 10)
    loss_rates=(0.001 0.005 0.01)
    opt_deltas=(1 2)
    # opt_f_bs=`seq 18 26`
    opt_f_bs=(16 18 19 21)


    for seed in ${seeds[@]}; do
        for loss_rate in ${loss_rates[@]}; do
            for opt_swap_mat in ${opt_swap_mats[@]}; do
                for opt_delta in ${opt_deltas[@]}; do
                    for opt_f_b in ${opt_f_bs[@]}; do
                        opt_frame="-1"
                        opt_block="-1"
                        if [[ $opt_f_b -eq 1 ]]; then
                            ## previous 1 frame, same blocks
                            opt_frame="-1"
                            opt_block="0"
                        fi
                        if [[ $opt_f_b -eq 2 ]]; then
                            ## previous 1 frame, nearby 5 blocks
                            opt_frame="-1"
                            opt_block="4"
                        fi
                        if [[ $opt_f_b -eq 3 ]]; then
                            ## previous 1 frame, nearby 9 blocks
                            opt_frame="-1"
                            opt_block="8"
                        fi
                        if [[ $opt_f_b -eq 4 ]]; then
                            ## previous 1 frame, all blocks
                            opt_frame="-1"
                            opt_block="-1"
                        fi
                        if [[ $opt_f_b -eq 5 ]]; then
                            ## current frame, nearby 4 blocks
                            opt_frame="0"
                            opt_block="4"
                        fi
                        if [[ $opt_f_b -eq 6 ]]; then
                            ## current frame, nearby 8 blocks
                            opt_frame="0"
                            opt_block="8"
                        fi
                        if [[ $opt_f_b -eq 7 ]]; then
                            ## current frame, all blocks
                            opt_frame="0"
                            opt_block="-1"
                        fi
                        if [[ $opt_f_b -eq 8 ]]; then
                            ## next frame, same block
                            opt_frame="1"
                            opt_block="0"
                        fi
                        if [[ $opt_f_b -eq 9 ]]; then
                            ## next frame, nearby 4 blocks
                            opt_frame="1"
                            opt_block="4"
                        fi
                        if [[ $opt_f_b -eq 10 ]]; then
                            ## next frame, nearby 8 block
                            opt_frame="1"
                            opt_block="8"
                        fi
                        if [[ $opt_f_b -eq 11 ]]; then
                            ## next frame, all blocks
                            opt_frame="1"
                            opt_block="-1"
                        fi
                        if [[ $opt_f_b -eq 12 ]]; then
                            ## previous and current frame
                            opt_frame="-1, 0"
                            opt_block=" 8, 8"
                        fi
                        if [[ $opt_f_b -eq 13 ]]; then
                            ## previous and current frame
                            opt_frame="-1, 0"
                            opt_block="-1, -1"
                        fi
                        if [[ $opt_f_b -eq 14 ]]; then
                            opt_frame="-2, -1, 0"
                            opt_block=" 0,  8, 8"
                        fi
                        if [[ $opt_f_b -eq 15 ]]; then
                            opt_frame="-2, -1,  0"
                            opt_block=" 4, -1, -1"
                        fi
                        if [[ $opt_f_b -eq 16 ]]; then
                            opt_frame="-2, -1, 0, 1, 2"
                            opt_block=" 0,  0, 0, 0, 0"
                        fi
                        if [[ $opt_f_b -eq 17 ]]; then
                            opt_frame="-2, -1, 0, 1, 2"
                            opt_block=" 0,  4, 8, 4, 0"
                        fi
                        if [[ $opt_f_b -eq 18 ]]; then
                            opt_frame="-2, -1, 0, 1, 2"
                            opt_block=" 0,  8, 8, 8, 0"
                        fi
                        if [[ $opt_f_b -eq 19 ]]; then
                            opt_frame="-2, -1, 0, 1, 2"
                            opt_block=" 4,  4, 4, 4, 4"
                        fi
                        if [[ $opt_f_b -eq 20 ]]; then
                            opt_frame="-2, -1, 0, 1, 2"
                            opt_block=" 8,  8, 8, 8, 8"
                        fi
                        if [[ $opt_f_b -eq 21 ]]; then
                            opt_frame="-2, -1,  0,  1,  2"
                            opt_block="-1, -1, -1, -1, -1"
                        fi
                        if [[ $opt_f_b -eq 22 ]]; then
                            opt_frame="-3, -2, -1, 0, 1, 2, 3"
                            opt_block=" 0,  0,  0, 0, 0, 0, 0"
                        fi
                        if [[ $opt_f_b -eq 23 ]]; then
                            opt_frame="-3, -2, -1, 0, 1, 2, 3"
                            opt_block=" 0,  4,  8, 8, 8, 4, 0"
                        fi
                        if [[ $opt_f_b -eq 24 ]]; then
                            opt_frame="-3, -2, -1, 0, 1, 2, 3"
                            opt_block=" 4,  4,  4, 4, 4, 4, 4"
                        fi
                        if [[ $opt_f_b -eq 25 ]]; then
                            opt_frame="-3, -2, -1, 0, 1, 2, 3"
                            opt_block=" 8,  8,  8, 8, 8, 8, 8"
                        fi
                        if [[ $opt_f_b -eq 26 ]]; then
                            opt_frame="-3, -2, -1,  0,  1,  2,  3"
                            opt_block="-1, -1, -1, -1, -1, -1, -1"
                        fi



                        for block_size in ${block_sizes[@]}; do
                            echo ${func}.${filename}.${num_frames}.${width}.${height}.${block_size}.${block_size}.${opt_delta}.${opt_f_b}.${opt_swap_mat}.${loss_rate}.${seed}
                            sed "s/INPUT_DIR/${input_dir}/g; s/FILENAME/${filename}/g;s/NUM_FRAMES/${num_frames}/g;s/BLOCK_HEIGHT/${block_size}/g;s/BLOCK_WIDTH/${block_size}/g;s/WIDTH/${width}/g;s/HEIGHT/${height}/g;s/OPT_DELTA/${opt_delta}/g;s/OPT_FRAMES/${opt_frame}/g;s/OPT_BLOCKS/${opt_block}/g;s/OPT_FRAME_BLOCK/${opt_f_b}/g;s/OPT_SWAP_MAT/${opt_swap_mat}/g;s/SEED/${seed}/g;s/LOSS_RATE/${loss_rate}/g" ${func}.mother.sh > tmp.${func}.${filename}.${num_frames}.${width}.${height}.${block_size}.${block_size}.${opt_delta}.${opt_f_b}.${opt_swap_mat}.${loss_rate}.${seed}.sh
                            sed "s/XXX/${filename}.${num_frames}.${width}.${height}.${block_size}.${block_size}.${opt_delta}.${opt_f_b}.${opt_swap_mat}.${loss_rate}.${seed}/g" ${func}.mother.condor > tmp.${func}.${filename}.${num_frames}.${width}.${height}.${block_size}.${block_size}.${opt_delta}.${opt_f_b}.${opt_swap_mat}.${loss_rate}.${seed}.condor
                            condor_submit tmp.${func}.${filename}.${num_frames}.${width}.${height}.${block_size}.${block_size}.${opt_delta}.${opt_f_b}.${opt_swap_mat}.${loss_rate}.${seed}.condor
                        done
                    done
                done
            done
        done
    done
done


