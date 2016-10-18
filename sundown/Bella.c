#include "Bella.h"
#include "stdlib.h"
#include "string.h"

void string_to_buf(struct buf *ib, const char *i) {
    bufgrow(ib, strlen(i));
    
    ib->size = strlen(i);
    ib->data = strdup(i);
}

const char *buf_to_string(struct buf *ob) {
    return strdup(ob->data);
}
