bool flag;                              //1 = sorted, 0 = not sorted
int length = 12;                        //length of the list
while (flag != 1){                      //keep sorting if not sorted
    flag = 1;                           
    for (int i=0; i<length-1; i++){     
        n1 = array[i];                  //assume the list exists somewhere
        n2 = array[i+1];
        if (n1 > n2){
            pass;
        }
        else{                           //swap if they are out of order
            array[i] = n2;              
            array[i+1] = n1;
            flag = 0;                   //signal that list isn't sorted
        }
    }
}