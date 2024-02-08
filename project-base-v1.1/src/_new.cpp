//
// Created by Danilo on 5/28/23.
// Preuzeto sa snimka iz vezbi 7.
//

#include "../h/syscall_c.hpp"

void *operator new(size_t size) {
    return mem_alloc(size);
}

void *operator new[](size_t size) {
    return mem_alloc(size);
}

void operator delete(void *p) noexcept {
    mem_free(p);
}

void operator delete[](void *p) noexcept {
    mem_free(p);
}