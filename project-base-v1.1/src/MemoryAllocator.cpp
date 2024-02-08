//
// Created by Danilo on 4/28/23.
//

#include "../h/MemoryAllocator.hpp"

MemDesc* MemoryAllocator::free_head;
MemDesc* MemoryAllocator::allocated_head;
int MemoryAllocator::counter = 0;

void MemoryAllocator::mem_init() {
    free_head = (MemDesc*) HEAP_START_ADDR;
    free_head->prev = nullptr;
    free_head->next = nullptr;
    size_t sz = ((char*) HEAP_END_ADDR - (char*) HEAP_START_ADDR - 1);
//    if (sz % MEM_BLOCK_SIZE != 0) sz = (sz / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE; // align to MEM_BLOCK_SIZE (not needed)
    free_head->size = sz;
}

// Preuzeto sa kolokvijuma april 2014. zadatak 2.
void *MemoryAllocator::mem_alloc(size_t sz) {
    if (!free_head) return nullptr;

    sz += sizeof(MemDesc);
    // align to MEM_BLOCK_SIZE
    if (sz % MEM_BLOCK_SIZE != 0) sz = ((sz / MEM_BLOCK_SIZE) + 1) * MEM_BLOCK_SIZE;

    // remove from free_head list
    MemDesc* cur = free_head;
    for(; cur != 0; cur = cur->next){
        if (cur->size < sz) continue;
        if (cur->size - sz <= sizeof(MemDesc)) {
            if (cur->prev) cur->prev->next = cur->next;
            else free_head = cur->next;
            if (cur->next) cur->next->prev = cur->prev;
            break;
        }
        else {
            MemDesc* newNode = (MemDesc*) ((char*)cur + sz);
            if (cur->prev) cur->prev->next = newNode;
            else free_head = newNode;
            if (cur->next) cur->next->prev = newNode;
            newNode->prev = cur->prev;
            newNode->next = cur->next;
            newNode->size = cur->size - sz;

            cur->size = sz;
            break;
        }
    }

    // insert in allocated_head list
    MemDesc* node = cur;
    if (!node) return nullptr;
    if (!allocated_head || ((char*)node < (char*)allocated_head))
        cur = nullptr; // insert as the first
    else {
        for(cur = allocated_head; cur->next != nullptr && (char*)node > (char*)(cur->next);
        cur = cur->next);
    }

    // insert after current
    node->prev = cur;
    if (cur != nullptr) {
        node->next = cur->next;
        if (cur->next != nullptr) {
            cur->next->prev = node;
        }
        cur->next = node;
    } else {
        node->next = allocated_head;
        if (allocated_head != nullptr) {
            allocated_head->prev = node;
        }
        allocated_head = node;
    }
//    node->prev = cur;
//    if (cur) node->next = cur->next;
//    else node->next = allocated_head;
//    if (node->next) node->next->prev = node;
//    if (cur) cur->next = node;
//    else allocated_head = node;
    counter++;
    return (void*) ((char*) node + sizeof(MemDesc));
}

// Preuzeto sa kolokvijuma septembar 2015. zadatak 2.
int MemoryAllocator::mem_free(void *ptr) {
    if (!ptr || !allocated_head) return -1;
    ptr = (char*) ptr - sizeof(MemDesc);
    MemDesc* cur;

    // find ptr in allocated memory and remove it
    for(cur = allocated_head; cur != (MemDesc*) ptr && cur != nullptr; cur=cur->next);

    if (cur) {
        // ptr found, delete ptr from list
        if (cur == allocated_head) {
            if (cur->next) cur->next->prev = nullptr;
            cur = cur->next;
            allocated_head = cur;
        }
        else if (!cur->next) {
            cur->prev->next = nullptr;
        }
        else {
            cur->next->prev = cur->prev;
            cur->prev->next = cur->next;
        }
    }
    else {
        // ptr not found
        return -1;
    }

    // insert node in free memory
    if (!free_head || ((char*)ptr < (char*)free_head))
        cur = nullptr; // insert as the first
    else {
        for(cur = free_head; cur->next != nullptr && (char*)ptr > (char*)(cur->next);
        cur = cur->next);
    }

    // insert after current
    MemDesc* newNode = (MemDesc*) ptr;
    newNode->prev = cur;
    if (cur) newNode->next = cur->next;
    else newNode->next = free_head;
    if (newNode->next) newNode->next->prev = newNode;
    if (cur) cur->next = newNode;
    else free_head = newNode;


    // try to merge two segments
    tryToJoin(newNode);
    tryToJoin(cur);
    counter--;
    return 0;
}