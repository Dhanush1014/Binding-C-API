#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include <brotli/encode.h>
#include<brotli/decode.h>
#include"brotli.h"

struct Compressed{
    uint8_t* output_data;
    size_t length;
};

struct Compressed *Encode(const uint8_t *input_data){
    int length= (int)sizeof(input_data)/sizeof(input_data[0]);
    size_t size = BrotliEncoderMaxCompressedSize((size_t) length);
    uint8_t *output_data= (uint8_t *)malloc(size);
    BrotliEncoderCompress(
            BROTLI_DEFAULT_QUALITY,
            BROTLI_DEFAULT_WINDOW,
            BROTLI_MODE_TEXT ,
            (size_t)length,
            input_data,
            &size,
            output_data
    );
    struct Compressed *output;
    output=(struct Compressed*)malloc(sizeof(struct Compressed));
    output->output_data=output_data;
    output->length=size;
    return output;
}
int main(){
    return 0;
}