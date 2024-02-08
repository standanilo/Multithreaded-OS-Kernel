//
// Created by Danilo on 4/28/23.
//

#ifndef PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP
#define PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP

#include "../lib/hw.h"
#include "../h/MemDesc.hpp"

class MemoryAllocator {
public:
    MemoryAllocator(MemoryAllocator&) = delete;
    MemoryAllocator& operator=(const MemoryAllocator &) = delete;

    static void* mem_alloc(size_t sz);
    static int mem_free(void* ptr);

    static void mem_init();

    static int counter;
// private:
    static MemDesc* free_head;
    static MemDesc* allocated_head;

};

#endif //PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP
