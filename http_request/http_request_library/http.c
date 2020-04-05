#include <stdio.h>
#include <curl/curl.h>
#include "http.h"
#include<stdlib.h>
#include <string.h>

size_t write_data(void *buffer, size_t size, size_t nmemb, void *userp)
{
  size_t realsize = size * nmemb;
  struct HttpData *mem = (struct HttpData *)userp;
 
  char *ptr = realloc(mem->data, mem->size + realsize + 1);
  if(ptr == NULL) {
    /* out of memory! */ 
    printf("not enough memory (realloc returned NULL)\n");
    return 0;
  }
 
  mem->data= ptr;
  memcpy(&(mem->data[mem->size]), buffer, realsize);
  mem->size += realsize;
  mem->data[mem->size] = 0;
 
  return realsize;
}

char* http_request(char* url){
    CURL *curl;
    CURLcode res;
    struct HttpData chunk;
    chunk.data = malloc(1);
    chunk.size = 0;
    curl_global_init(CURL_GLOBAL_ALL);
    curl = curl_easy_init();
    if (curl)
    {
      curl_easy_setopt(curl, CURLOPT_URL,url);
      curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_data);
      curl_easy_setopt(curl, CURLOPT_WRITEDATA, (void *)&chunk);
      res = curl_easy_perform(curl);
      if (res != CURLE_OK)
      {
          fprintf(stderr, "curl_easy_perform() failed: %s\n",curl_easy_strerror(res));
      }    
      curl_easy_cleanup(curl);
    }
    curl_global_cleanup();
    return chunk.data;
}


int main(){
  return 0;
}


