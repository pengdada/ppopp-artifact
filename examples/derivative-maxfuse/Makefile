NVCC=nvcc
NVPROF=nvprof
NOPTFLAGS=-O3 -ccbin=g++ -std=c++11 -Xcompiler "-fPIC -fopenmp -O3 -fno-strict-aliasing" --use_fast_math -Xptxas "-dlcm=ca"
NCOMPUTEFLAGS=-gencode arch=compute_$(CAPABILITY),code=sm_$(CAPABILITY) 
CLANG=clang++
LOPTFLAGS=-O3 -ffp-contract=fast --cuda-path=$(CUDAHOME) -L$(CUDAHOME)/lib64 -L$(CUDAHOME)/nvvm -lcudart
LCOMPUTEFLAGS=--cuda-gpu-arch=sm_$(CAPABILITY)

all:
	#./reorder.sh derivative-reg-maxfuse.cu 
	$(NVCC) $(NOPTFLAGS) $(NCOMPUTEFLAGS) -maxrregcount=255 common/cuda_header.cu derivative.driver.cpp derivative_gold.cpp derivative-orig.cu -o nvcc-orig
	$(NVCC) $(NOPTFLAGS) $(NCOMPUTEFLAGS) -maxrregcount=255 common/cuda_header.cu derivative.driver.cpp derivative_gold.cpp reordered.cu -o nvcc-reorder
	$(NVCC) $(NOPTFLAGS) $(NCOMPUTEFLAGS) -maxrregcount=255 common/cuda_header.cu derivative.driver.cpp derivative_gold.cpp reordered-a.cu -o nvcc-reorder-a
	$(NVCC) $(NOPTFLAGS) $(NCOMPUTEFLAGS) -maxrregcount=255 common/cuda_header.cu derivative.driver.cpp derivative_gold.cpp reordered-b.cu -o nvcc-reorder-b
	$(NVCC) $(NOPTFLAGS) $(NCOMPUTEFLAGS) -maxrregcount=255 common/cuda_header.cu derivative.driver.cpp derivative_gold.cpp reordered-c.cu -o nvcc-reorder-c
	$(NVCC) $(NOPTFLAGS) $(NCOMPUTEFLAGS) -maxrregcount=255 common/cuda_header.cu derivative.driver.cpp derivative_gold.cpp reordered-d.cu -o nvcc-reorder-d
	$(NVCC) $(NOPTFLAGS) $(NCOMPUTEFLAGS) -maxrregcount=255 common/cuda_header.cu derivative.driver.cpp derivative_gold.cpp reordered-g.cu -o nvcc-reorder-g
	$(NVCC) $(NOPTFLAGS) $(NCOMPUTEFLAGS) -maxrregcount=255 common/cuda_header.cu derivative.driver.cpp derivative_gold.cpp reordered-h.cu -o nvcc-reorder-h
	$(CLANG) $(LOPTFLAGS) $(LCOMPUTEFLAGS) -Xcuda-ptxas -maxrregcount=255 common/cuda_header.cu derivative.driver.cpp derivative_gold.cpp derivative-orig.cu -o llvm-orig
	$(CLANG) $(LOPTFLAGS) $(LCOMPUTEFLAGS) -Xcuda-ptxas -maxrregcount=255 common/cuda_header.cu derivative.driver.cpp derivative_gold.cpp reordered.cu -o llvm-reorder
	$(CLANG) $(LOPTFLAGS) $(LCOMPUTEFLAGS) -Xcuda-ptxas -maxrregcount=255 common/cuda_header.cu derivative.driver.cpp derivative_gold.cpp reordered-a.cu -o llvm-reorder-a
	$(CLANG) $(LOPTFLAGS) $(LCOMPUTEFLAGS) -Xcuda-ptxas -maxrregcount=255 common/cuda_header.cu derivative.driver.cpp derivative_gold.cpp reordered-b.cu -o llvm-reorder-b 
	$(CLANG) $(LOPTFLAGS) $(LCOMPUTEFLAGS) -Xcuda-ptxas -maxrregcount=255 common/cuda_header.cu derivative.driver.cpp derivative_gold.cpp reordered-c.cu -o llvm-reorder-c
	$(CLANG) $(LOPTFLAGS) $(LCOMPUTEFLAGS) -Xcuda-ptxas -maxrregcount=255 common/cuda_header.cu derivative.driver.cpp derivative_gold.cpp reordered-d.cu -o llvm-reorder-d
	$(CLANG) $(LOPTFLAGS) $(LCOMPUTEFLAGS) -Xcuda-ptxas -maxrregcount=255 common/cuda_header.cu derivative.driver.cpp derivative_gold.cpp reordered-g.cu -o llvm-reorder-g
	$(CLANG) $(LOPTFLAGS) $(LCOMPUTEFLAGS) -Xcuda-ptxas -maxrregcount=255 common/cuda_header.cu derivative.driver.cpp derivative_gold.cpp reordered-h.cu -o llvm-reorder-h
	$(NVPROF) --print-gpu-trace ./nvcc-orig > /dev/null 2>nvcc-orig-results
	$(NVPROF) --print-gpu-trace ./nvcc-reorder > /dev/null 2>nvcc-reorder-results
	$(NVPROF) --print-gpu-trace ./nvcc-reorder-a > /dev/null 2>nvcc-reorder-results-a
	$(NVPROF) --print-gpu-trace ./nvcc-reorder-b > /dev/null 2>nvcc-reorder-results-b
	$(NVPROF) --print-gpu-trace ./nvcc-reorder-c > /dev/null 2>nvcc-reorder-results-c
	$(NVPROF) --print-gpu-trace ./nvcc-reorder-d > /dev/null 2>nvcc-reorder-results-d
	$(NVPROF) --print-gpu-trace ./nvcc-reorder-g > /dev/null 2>nvcc-reorder-results-g
	$(NVPROF) --print-gpu-trace ./nvcc-reorder-h > /dev/null 2>nvcc-reorder-results-h
	$(NVPROF) --print-gpu-trace ./llvm-orig > /dev/null 2>llvm-orig-results
	$(NVPROF) --print-gpu-trace ./llvm-reorder > /dev/null 2>llvm-reorder-results
	$(NVPROF) --print-gpu-trace ./llvm-reorder-a > /dev/null 2>llvm-reorder-results-a
	$(NVPROF) --print-gpu-trace ./llvm-reorder-b > /dev/null 2>llvm-reorder-results-b
	$(NVPROF) --print-gpu-trace ./llvm-reorder-c > /dev/null 2>llvm-reorder-results-c
	$(NVPROF) --print-gpu-trace ./llvm-reorder-d > /dev/null 2>llvm-reorder-results-d
	$(NVPROF) --print-gpu-trace ./llvm-reorder-g > /dev/null 2>llvm-reorder-results-g
	$(NVPROF) --print-gpu-trace ./llvm-reorder-h > /dev/null 2>llvm-reorder-results-h
	./common/time.awk

clean:
	rm test nvcc-* llvm-* *.idsl stencils stencilnames unrollfactors 2>/dev/null || true 
