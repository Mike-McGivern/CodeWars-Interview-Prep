#include <stddef.h>

void move_zeros(size_t len, int arr[len])
{
    // mutate arr in place
    size_t insert = 0;
  
  for(size_t i = 0; i < len; i++) {
    if(arr[i] != 0) {
      arr[insert++] = arr[i];
    }
  }
  
  while(insert < len) {
    arr[insert++] = 0;
  }
  
}
