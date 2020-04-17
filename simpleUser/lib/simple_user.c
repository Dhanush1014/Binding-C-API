#include<stdio.h>
#include<stdlib.h>

struct User{
    char *name;
};

struct User createUser(char* name){
    struct User user={name};
    return user;
}

void printUser(struct User user){
    printf("Name: %s\n",user.name);
}

int main(){
    return 0;
}