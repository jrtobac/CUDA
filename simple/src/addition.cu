#include <stdio.h>

/* cuda kernel declared and defined */
__global__ void add( int a, int b, int *c ){
	*c = a + b;
}

int main( void ) {
	int c;
	int *dev_c;
	/* allocates memory on the device */
	cudaMalloc( (void**)&dev_c, sizeof(int));

	/*call to kernel*/
	add<<<1,1>>>(2, 7, dev_c);	
	
	/* copies dev_c into c */	
	cudaMemcpy(&c, dev_c, sizeof(int), cudaMemcpyDeviceToHost);
	printf("2 + 7 = %d\n", c);

	cudaFree(dev_c);

	return 0;

}
