#include <stdio.h>
#include <cuda_runtime.h>

__global__ void hello_from_gpu() {
    int idx = blockIdx.x * 4 + threadIdx.x;
    printf("GPU block %d, thread %d, idx %d\n",
        blockIdx.x, threadIdx.x, idx);
}

int main() {
    printf("CPU says hello before kernel!\n");

    // Launch kernel
    hello_from_gpu<<<3, 4>>>();

    // Wait for GPU to finish
    cudaDeviceSynchronize();

    printf("CPU says hello after kernel!\n");

    return 0;
}
