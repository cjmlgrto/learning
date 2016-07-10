#include <stdio.h>
#include <time.h>

#define COUNT 5

main()
{
	// below is C's own random number generator. It must be seeded however with some type of number you want to randomize. In this case, UNIX time.
	srand(time(NULL));
	
	// this array uses stack memory, because it's inside a function and the array size is set by the COUNT definition
	
	int stackArray[COUNT];
	
	// now, we'll use a for loop to inser a random value for each item of the array
	
	int i;
	
	for (i = 0; i < COUNT; i++) {
		stackArray[i] = rand();
	}
	
	// now, printf every value of the array
	
	for (i = 0; i < COUNT; i++) {
		printf("Value %i: %i\n", i, stackArray[i]);
	}
}