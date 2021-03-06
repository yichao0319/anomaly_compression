reset
set terminal postscript eps enhanced color 28
# set terminal png enhanced 28 size 800,600
# set terminal jpeg enhanced font helvetica 28
set size ratio 0.7

data_dir = "../processed_data/subtask_temporal/temporal_stability/"
fig_dir  = "../processed_data/subtask_temporal/temporal_stability/figures/"
# file_name = "FILE_NAME"
param = "naNUM_ANOM.anomSIGMA_MAG.itvlITVL"
fig_name  = "matrix.".param.".diff"
set output fig_dir.fig_name.".eps"

set xlabel '{/Helvetica=28 |M(i,t) - M(i,t+k)| / max(|M|)}' offset character 0, 0, 0
set ylabel '{/Helvetica=28 CDF}' offset character 0, 0, 0

set tics font "Helvetica,24"
set xtics nomirror rotate by 0
set ytics nomirror 0,0.1,1
set format x "10^{%L}"

set xrange [0.00000001:]
set yrange [0:1]

set logscale x
# set logscale y

# set lmargin 4.5
# set rmargin 5.5
# set bmargin 3.7
# set tmargin 4.4

# set key right bottom
# set key Left above reverse nobox horizontal spacing 0.9 samplen 1.5 width -1
set nokey

set style line 1 lc rgb "red"     lt 1 lw 11 pt 1 ps 1.5 pi -1  ## +
set style line 2 lc rgb "blue"    lt 2 lw 3 pt 2 ps 1.5 pi -1  ## x
set style line 3 lc rgb "#00CC00" lt 5 lw 5 pt 3 ps 1.5 pi -1  ## *
set style line 4 lc rgb "#7F171F" lt 4 lw 3 pt 4 ps 1.5 pi -1  ## box
set style line 5 lc rgb "#FFD800" lt 1 lw 7 pt 5 ps 1.5 pi -1  ## solid box
set style line 6 lc rgb "#000078" lt 6 lw 9 pt 6 ps 1.5 pi -1  ## circle
set style line 7 lc rgb "#732C7B" lt 7 lw 5 pt 7 ps 1.5 pi -1
set style line 8 lc rgb "black"   lt 8 lw 5 pt 8 ps 1.5 pi -1  ## triangle
set style line 9 lc rgb "red"     lt 9 lw 9 pt 9 ps 1.5 pi -1  ## triangle
set style line 10 lc rgb "blue"    lt 10 lw 8 pt 10 ps 1.5 pi -1
set style line 11 lc rgb "#00CC00" lt 11 lw 5 pt 11 ps 1.5 pi -1
# set pointintervalbox 2  ## interval to a point

# plot data_dir.file_name.".txt" using 1:3 with lines ls 2 title '{/Helvetica=28 TITLE_1}', \
#      data_dir.file_name.".txt" using 1:2 with lines ls 1 notitle

# plot data_dir.file_name."rank.txt" using 1 with linespoints ls 1 title '{/Helvetica=28 all}', \
#      data_dir.file_name."light_rank.txt" using 1 with linespoints ls 2 title '{/Helvetica=28 remove top-loaded}'

plot data_dir."tm_3g.cell.bs.bs3.all.bin10.txt.".param.".diff.txt" using 1:2 with lines ls 3 title '{/Helvetica=20 3G}', \
     data_dir."tm_sjtu_wifi.ap_load.all.bin600.top50.txt.".param.".diff.txt" using 1:2 with lines ls 4 title '{/Helvetica=20 WiFi}', \
     data_dir."tm_abilene.od..".param.".diff.txt" using 1:2 with lines ls 1 title '{/Helvetica=20 Abilene}', \
     data_dir."tm_totem..".param.".diff.txt"      using 1:2 with lines ls 2 title '{/Helvetica=20 GEANT}', \
     data_dir."Mob-Recv1run1.dat0_matrix.mat_dB.txt.".param.".diff.txt" using 1:2 with lines ls 5 title '{/Helvetica=20 CSI (1 channel)}', \
     data_dir."static_trace13.ant1.mag.txt.".param.".diff.txt" using 1:2 with lines ls 9 title '{/Helvetica=20 CSI (multi-channel)}', \
     data_dir."tm_telos_rssi.txt.".param.".diff.txt" using 1:2 with lines ls 6 title '{/Helvetica=20 Cister RSSI}', \
     data_dir."tm_multi_loc_rssi.txt.".param.".diff.txt" using 1:2 with lines ls 7 title '{/Helvetica=20 CU RSSI}', \
     data_dir."tm_umich_rss.txt.".param.".diff.txt" using 1:2 with lines ls 11 title '{/Helvetica=20 UMich RSS}', \
     data_dir."tm_ucsb_meshnet.connected.txt.".param.".diff.txt" using 1:2 with lines ls 10 title '{/Helvetica=20 UCSB Meshnet}'#, \
     #data_dir."tm_ron1.latency..".param.".diff.txt" using 1:2 with lines ls 8 title '{/Helvetica=20 RON delay}'
     