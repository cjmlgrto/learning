#include <stdio.h>

int globalMonsters = 2;

void addFourMonsters()
{
	int stackMonsters = 4;
	
	globalMonsters += stackMonsters;
}

main()
{
	printf("Global monsters: %i \n", globalMonsters);
	int i;
	for (i = 0; i < 10; i++) {
		addFourMonsters();
		printf("Global monsters: %i \n", globalMonsters);
	}
}