#!/bin/bash
set -e

echo "-------------------- NVCC ---------------------"

time=`grep -E 'float|double' nvcc-orig-results | awk 'BEGIN {time = 0.0} {time += $2} END {print time}'`
awk -v otime=$time 'BEGIN {print "Original GFlops = " (8192*8192*33/10^6/otime)}'

time=`grep -E 'float|double' nvcc-unroll-results | awk 'BEGIN {time = 0.0} {time += $2} END {print time}'`
awk -v utime=$time 'BEGIN {print "Unrolled GFlops = " (8192*8192*33/10^6/utime)}'

timea=`grep -E 'float|double' nvcc-reorder-results-a | awk 'BEGIN {timea = 0.0} {timea += $2} END {print timea}'`
timeb=`grep -E 'float|double' nvcc-reorder-results-b | awk 'BEGIN {timeb = 0.0} {timeb += $2} END {print timeb}'`
timec=`grep -E 'float|double' nvcc-reorder-results-c | awk 'BEGIN {timec = 0.0} {timec += $2} END {print timec}'`
timed=`grep -E 'float|double' nvcc-reorder-results-d | awk 'BEGIN {timed = 0.0} {timed += $2} END {print timed}'`
timee=`grep -E 'float|double' nvcc-reorder-results-e | awk 'BEGIN {timee = 0.0} {timee += $2} END {print timee}'`
min1=`awk -v atime=$timea -v btime=$timeb 'BEGIN {print (atime<btime?atime:btime)}'`
min2=`awk -v min=$min1 -v ctime=$timec 'BEGIN {print (ctime<min?ctime:min)}'`
min3=`awk -v min=$min2 -v dtime=$timed 'BEGIN {print (dtime<min?dtime:min)}'`
awk -v min=$min3 -v etime=$timee 'BEGIN {print "Reordered GFlops = " (8192*8192*33/10^6/(min<etime?min:etime))}'

echo "-------------------- LLVM ---------------------"

time=`grep -E 'float|double' llvm-orig-results | awk 'BEGIN {time = 0.0} {time += $2} END {print time}'`
awk -v otime=$time 'BEGIN {print "Original GFlops = " (8192*8192*33/10^6/otime)}'

time=`grep -E 'float|double' llvm-unroll-results | awk 'BEGIN {time = 0.0} {time += $2} END {print time}'`
awk -v utime=$time 'BEGIN {print "Unrolled GFlops = " (8192*8192*33/10^6/utime)}'

timea=`grep -E 'float|double' llvm-reorder-results-a | awk 'BEGIN {timea = 0.0} {timea += $2} END {print timea}'`
timeb=`grep -E 'float|double' llvm-reorder-results-b | awk 'BEGIN {timeb = 0.0} {timeb += $2} END {print timeb}'`
timec=`grep -E 'float|double' llvm-reorder-results-c | awk 'BEGIN {timec = 0.0} {timec += $2} END {print timec}'`
timed=`grep -E 'float|double' llvm-reorder-results-d | awk 'BEGIN {timed = 0.0} {timed += $2} END {print timed}'`
timee=`grep -E 'float|double' llvm-reorder-results-e | awk 'BEGIN {timee = 0.0} {timee += $2} END {print timee}'`
min1=`awk -v atime=$timea -v btime=$timeb 'BEGIN {print (atime<btime?atime:btime)}'`
min2=`awk -v min=$min1 -v ctime=$timec 'BEGIN {print (ctime<min?ctime:min)}'`
min3=`awk -v min=$min2 -v dtime=$timed 'BEGIN {print (dtime<min?dtime:min)}'`
awk -v min=$min3 -v etime=$timee 'BEGIN {print "Reordered GFlops = " (8192*8192*33/10^6/(min<etime?min:etime))}'

