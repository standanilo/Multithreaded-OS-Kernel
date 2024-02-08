//
// Created by Danilo on 6/2/23.
//
#include "../h/list.hpp"

void List::addFirst(_thread *data) {
    Elem *elem = (Elem*) MemoryAllocator::mem_alloc(sizeof(Elem));
    elem->data = data;
    elem->next = head;
    head = elem;
    if(!tail) {
        tail = head;
    }
}

void List::addLast(_thread *data) {
    Elem *elem = (Elem*) MemoryAllocator::mem_alloc(sizeof(Elem));
    elem->data = data;
    elem->next = nullptr;
    if(tail) {
        tail->next = elem;
        tail = elem;
    }
    else {
        head = tail = elem;
    }
}

_thread *List::removeFirst() {
    if(!head) {
        return 0;
    }
    Elem *elem = head;
    head = head->next;
    if(!head) {
        tail = 0;
    }
    _thread *ret = elem->data;
    MemoryAllocator::mem_free(elem);
    return ret;
}

_thread *List::peekFirst() {
    if(!head) {
        return 0;
    }
    return head->data;
}

_thread *List::removeLast() {
    if(!head) {
        return 0;
    }
    Elem *prev = 0;
    for(Elem *curr = head; curr && curr != tail; curr = curr->next) {
        prev = curr;
    }
    Elem *elem = tail;
    if(prev) {
        prev->next = 0;
    }
    else {
        head = 0;
    }
    tail = prev;

    _thread *ret = elem->data;
    MemoryAllocator::mem_free(elem);
    return ret;
}

_thread *List::peekLast() {
    if(!tail) {
        return 0;
    }
    return tail->data;
}

void List::init() {
    head = 0;
    tail = 0;
}
