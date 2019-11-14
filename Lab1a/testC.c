#include <stdio.h>
// SOLUTION FILE

main()
{
  int var_int;                    // 2
  float var_float;
  double var_double;
  char var_char;


  unsigned char uchar1, uchar2;   // 3
  signed char schar1, schar2;

  int x, y;                       // 4

  char i;                         // 5
  char shift_char;

  int a[10] = {0,10,20,30,40,50,60,70,80,90};    // 6

  int b[10], c[10];               // 7
  int *ip, *ip2;
  int j, k;

  char AString[] = "HAL";           // 8

  // 1 -- change "World" to your name
  printf("\n\n PART 1 ---------\n");

  printf("\n Hello Anirudh! \n");

  // 2 -- find sizes of the other C datatypes
  printf("\n\n PART 2 ----------\n");

  printf("\n size of data type int = %d ", sizeof(var_int));
  printf("\n size of data type float = %d", sizeof(var_float));
  printf("\n size of data type double = %d", sizeof(var_double));
  printf("\n size of data type char = %d", sizeof(var_char));
 

  // 3 -- explore signed versus unsigned datatypes and their interactions
  printf("\n\n PART 3 ----------\n");

  uchar1 = 0xFF;
  uchar2 = 0xFE;
  schar1 = 0xFF;
  schar2 = 0xFE;

  printf("\n uchar1 = %d ", uchar1);
  printf("\n schar1 = %d ", schar1);

  if(uchar1>uchar2){
    printf("\n uchar1 is larger and has a value = %d ", uchar1);
  }
  else if (uchar2 >uchar1){
    printf("\n uchar2 is larger and has a value = %d ", uchar2);
  }


  if(schar1>schar2){
    printf("\n schar1 is larger and has a value = %d ", schar1);
  }
  else if (schar2 >schar1){
    printf("\n schar2 is larger and has a value = %d ", schar2);
  }

  if(schar1> uchar1){
    printf("\n schar1 is larger and has a value = %d ", schar1);
  }
  else if(uchar1 > schar1){
    printf("\n uchar1 is larger and has a value = %d ", uchar1);
  }

  printf("\n This is the sum of schar1 and schar2 = %d", schar1 + schar2);
  printf("\n This is the sum of uchar1 and uchar2 = %d", uchar1 + uchar2);
  printf("\n This is the sum of uchar1 and schar1 = %d", uchar1 + schar1);
  // 4 -- Booleans
  printf("\n\n PART 4 ----------\n");

  x = 1; y = 2;

  if((x+y)%2 == 0){
    printf("\n True = %d", (x+y)%2 == 0);
  }
  else{
    printf("\n False = %d", (x+y)%2 == 0);
  }

  printf("\n The size of a Boolean is = %d", sizeof((x+y)%2 == 0));

  printf("\n When you do x&y, it prints = %d", x&y);
  printf("\n When you do x&&y, it prints = %d", x&&y);

  printf("\n When you do ~y, it prints = %d", ~y);
  printf("\n When you do !y, it prints = %d", !y);
  // 5 -- shifts
  printf("\n\n PART 5 ----------\n");

  shift_char = 15;
  i = 1;

  printf("\n shift_char << %d = %d", i, shift_char << i);
  printf("\n shift_char >> %d = %d", i, shift_char >> i);

  i = 3;
  printf("\n shift_char << %d = %d", i, shift_char << i);
  i = 7;
  printf("\n shift_char << %d = %d", i, shift_char << i);
  // 6 -- pointer basics
  printf("\n\n PART 6 ----------\n");

  ip = a;
  printf("\nstart %d ",
	 a[0]);

  printf("\n %d",  *ip);
  printf("\n %d",  *(ip+1));
  printf("\n %d", *ip++);
  printf("\n %d", *ip);
  printf("\n %d", *(ip+3));
  printf("\n %d", *(ip-1));

  printf("\nstart %d ",
   a[1]);

  printf("\n %d",  *ip);
  printf("\n %d",  *(ip+1));
  printf("\n %d", *ip);
  printf("\n %d", *(ip+1));
  printf("\n %d", *(ip+4));
  printf("\n %d", *(ip));


  printf("\n The size of the integer pointer data type is = %d", sizeof(int *));

   printf("\nThis is what happens when you print the pointer values themselves %x",
   &a[1]);

  printf("\n %x",  ip);
  printf("\n %x",  (ip+1));
  printf("\n %x", ip);
  printf("\n %x", (ip+1));
  printf("\n %x", (ip+4));
  printf("\n %x", (ip));

  // 7 -- programming with pointers
  printf("\n\n PART 7 ----------\n");

  for(k = 0; k<10; k++){

    int j = 9-k;

    b[j] = a[k];
    

  }

  for(k = 0; k<10; k++){
  printf("\n %d",b[k]);
}

  ip2 = (ip + 8);
  for(k = 0; k<10; k++){
    
    c[k] = *(ip2-k);
    
  }
  printf("\n\n");
for(k = 0; k<10; k++){
  printf("\n %d",c[k]);
}


  // 8 -- strings
  printf("\n\n PART 8 ----------\n");

  printf("\n %s \n", AString);
  

  for(k = 0; k<strlen(AString); k++){
    printf("\n %d \n", AString[k]);

  }
  printf("\n This is the null character: %d", AString[3]);

  for(k = 0; k<strlen(AString); k++){

    AString[k]++;
    
  }
  printf("\n %s \n", AString);

  AString[3]+=60;
  printf("\n %s \n", AString);

  // 9 -- address calculation
  printf("\n\n PART 9 ----------\n");
  for (k = 0; k < 10; k++) {
  b[k] = a[k];         // direct reference to array element
  printf("\n %x", &b[k]);

  }
  ip = a;
  ip2 = b;
  printf("\n\n");
  for (k = 0; k < 10; k++) {
    printf("\n %x",  ip2);
    *ip2++ = *ip++;
    
         // indirect reference to array element
  }
  // all done
  printf("\n\n ALL DONE\n");
}
