#ifndef BELLA_H
#define BELLA_H

#include "src/buffer.h"
#include "src/markdown.h"
#include "src/autolink.h"
#include "html/html.h"

void string_to_buf(struct buf *ib, const char * i);
const char *buf_to_string(struct buf *ob);

#endif