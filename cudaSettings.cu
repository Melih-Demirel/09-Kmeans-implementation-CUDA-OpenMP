#include <iostream>
#include <cuda_runtime.h>

int main() {
    // Get the number of CUDA devices
    int deviceCount;
    cudaGetDeviceCount(&deviceCount);

    // Iterate over each CUDA device
    for (int device = 0; device < deviceCount; ++device) {
        cudaDeviceProp deviceProp;
        cudaGetDeviceProperties(&deviceProp, device);

        // Print device properties
        std::cout << "Device " << device << ": " << deviceProp.name << std::endl;
        std::cout << "  Maximum threads per block: " << deviceProp.maxThreadsPerBlock << std::endl;
        std::cout << "  Maximum blocks per grid: " << deviceProp.maxGridSize[0] << std::endl;
    }

    return 0;
}
