#include <iostream.h>
#include <string.h>

extern "C" int findChar(char*, char*);

char* rn = "\n\r$";



void main(){
	char STRING[64];
	cin.getline(STRING,59);
	strcat(STRING,rn);
	char c[1];
	cin >> c[0];
	// printf("%c",c);
	int x = findChar(STRING,c);
	cout << x;
}