#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define getchar my_getchar
#define MAX 1024000000
#define sourceLen idx

/* The target string is the string the algorithm is searching for */
const char target[] = "Extending";
int targetLen = 9;

char full_source[MAX];
static char source[MAX];

/* We're here overriding the built-in getchar function */
/* to instead return characters from the 'full_source' variable */
static int idx = 0;
int my_getchar(){
    return full_source[idx];
}

/* This function features the soft hang bug. 1:1 copy paste */
int soft_hang(){
    int found = -1;
    while ( found < 0 ) {
        //Check if string source[] contains target[]
        char first = target[0];
        int max = sourceLen - targetLen;

        for (int i = 0; i <= max; i++) {
            // Look for first character.
            if (source[i] != first) {
                while (++i <= max && source[i] != first);
            }

            // Found first character
            // now look at the rest
            if (i <= max) {
                int j = i + 1;
                int end = j + targetLen - 1;
                for (int k = 1; j < end && source[j] ==
                         target[k]; j++, k++);

                if (j == end) {
                    /* Found whole string target. */
                    found = i;
                    break;
                }
            }
        }

        //append another character; try again
        source[sourceLen++] = getchar();
    }
    return found;
}

void appendString(char array[], const char *string)
{
    int length = strlen(string);

    int start = strlen(full_source);
    int end = strlen(full_source) + length;
    for (int i = 0; i < length && start + i <= end; i++){
        array[start + i] = string[i];
    }
}

int main(int argc, char *argv[]){
    unsigned int length = atoi(argv[1]);
    unsigned int i = 0;
    char *strategy = argv[2];

    // If target is at the beginning, add target to full_source
    if (!strcmp(strategy, "beginning"))
        appendString(full_source, target);

    // Add a character, half of the times of the first CLI argument
    for(i = 0; i < length/2; i++)
        full_source[strlen(full_source)] = 'a';

    // If target is in the middle, add target to full_source
    if (!strcmp(strategy, "middle"))
        appendString(full_source, target);

    // Add a character, half of the times of the first CLI argument
    for(i = 0; i < length/2; i++)
        full_source[strlen(full_source)] = 'a';

    // If target is at beginning, add target to full_source
    if (!strcmp(strategy, "end"))
        appendString(full_source, target);

    int start_index = soft_hang();
    printf("%d", start_index);
    exit(0);
}
