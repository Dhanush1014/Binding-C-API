struct HttpData {
  char *data;
  size_t size;
};

char* http_request(char* url);