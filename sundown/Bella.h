#ifndef BELLA_H
#define BELLA_H

#include "buffer.h"
#include "markdown.h"
#include "autolink.h"
#include "html.h"

void string_to_buf(struct buf *ib, const char * i);
const char *buf_to_string(struct buf *ob);

#endif