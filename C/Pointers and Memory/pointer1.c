#include <stdio.h>

main ()
{
	// declaring an int and a pointer here
	int number;
	int* pointer;
	
	number = 5;
	
	// this is where the magic happens: here, the pointer integer

	pointer = &number;
	
	printf("value of number: %i\n", number);
	printf("value of &number: %p\n", &number);
	printf("value of pointer: %p\n", pointer);
	
	printf("value of pointer's _target_: %i\n", *pointer);
}