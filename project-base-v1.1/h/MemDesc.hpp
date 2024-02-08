//
// Created by Danilo on 4/28/23.
//

#ifndef PROJECT_BASE_V1_1_MEMDESC_HPP
#define PROJECT_BASE_V1_1_MEMDESC_HPP

#include "../lib/hw.h"

typedef struct MemDesc {
    MemDesc* prev;
    MemDesc* next;
    size_t size;
} MemDesc;

int tryToJoin(MemDesc* node);

#endif //PROJECT_BASE_V1_1_MEMDESC_HPP
