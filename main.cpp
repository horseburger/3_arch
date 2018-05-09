#include <iostream.h>
#include <stdio.h>
#include <string.h>

extern "C" int findChar(char*, char*);
extern "C" float arrayAvg(float*, int);

char* rn = "\n\r$";



void main(){
	cout << "Podaj wielkosc tablicy: ";
	int n;
	cin >> n;
	float *array = new float [n];
	for(int i=0;i<n;i++){
		cout << "Wartosc " << i+1 << " : ";
		cin >> array[i];
	}
	float avg = arrayAvg(array, n);
	cout << "Srednia wartosc tablicy to: " << avg << "\n";

	cin.clear();
	cin.sync();

	char STRING[64];
	cout << "Podaj string: ";
	cin.getline(STRING,59);
	strcat(STRING,rn);
	char c[1];
	cout << "Podaj char: ";
	cin >> c[0];
	int x = findChar(STRING,c);
	printf("Ilosc wystapien '%c' to: %i",c[0],x);

}