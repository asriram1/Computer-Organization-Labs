#include <iostream>
using namespace std;


int main(){


int a[10][10];
int transpose[10][10];

int r = 10;
int c = 10;

for(int i = 0; i<10; i++){

	for(int j = 0; j<10; j++){

		if(j%2 == 0 && i%2== 0){
			a[i][j] = 0;
		}
		else{
			a[i][j] = 1;
		}
	}
}

cout<<"This is the entered matrix"<<endl;
for(int i = 0; i<10; i++){

	for(int j = 0; j<10; j++){

		cout<<" "<< a[i][j];
		if(j == 9){
			cout<< endl <<endl;
		}
	}
}

for(int i = 0;i <10; i++ ){
	for(int j = 0; j<10; j++){

		transpose[j][i] = a[i][j];
	
	}

}

cout<<"This is the transposed matrix"<<endl;
for(int i = 0; i<10; i++){

	for(int j = 0; j<10; j++){

		cout<<" "<< transpose[i][j];
		if(j == 9){
			cout<< endl <<endl;
		}
	}
}

}