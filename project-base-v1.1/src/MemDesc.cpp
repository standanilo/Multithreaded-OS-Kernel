//
// Created by Danilo on 4/28/23.
//

#include "../h/MemDesc.hpp"

// Preuzeto sa kolokvijuma septembar 2015. zadatak 2.
int tryToJoin(MemDesc* node) {
    // if node doesn't exist return
    if (!node) return 0;
    // if next exists and its address is the same as node + node-> size, delete next, increase size of node
    if (node->next && (char*)node+node->size == (char*)(node->next)) {
        node->size += node->next->size;
        node->next = node->next->next;
        if (node->next) node->next->prev = node;
        return 1;
    }
    else {
        return 0;
    }
}