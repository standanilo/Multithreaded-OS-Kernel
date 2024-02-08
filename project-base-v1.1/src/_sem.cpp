//
// Created by Danilo on 6/3/23.
//
#include "../h/_sem.hpp"
#include "../h/_thread.hpp"

_sem *_sem::open(unsigned int init) {
    return new _sem(init);
}

int _sem::close() {
    _thread* t = this->blocked->removeFirst();
    while(t) {
        t->setBlocked(false);
        Scheduler::put(t);
        t = this->blocked->removeFirst();
    }
    MemoryAllocator::mem_free(this->blocked);
    delete this;
    return 0;
}

int _sem::wait() {
    if (--this->val < 0) {
        _thread::running->setBlocked(true);
        this->blocked->addLast(_thread::running);
        _thread::running->dispatch();
    }
    return 0;
}

int _sem::signal() {
    if (++this->val <= 0) {
        _thread* t = this->blocked->removeFirst();
        if (t) {
            t->setBlocked(false);
            Scheduler::put(t);
        }
    }
    return 0;
}

_sem::_sem(unsigned int init) {
    this->val = init;
    this->blocked = (List*) (MemoryAllocator::mem_alloc(sizeof(List)));
    this->blocked->init();
}

void *_sem::operator new(size_t size) {
    return MemoryAllocator::mem_alloc(size);
}

void *_sem::operator new[](size_t size) {
    return MemoryAllocator::mem_alloc(size);
}

void _sem::operator delete(void *ptr) {
    MemoryAllocator::mem_free(ptr);
}

void _sem::operator delete[](void *ptr) {
    MemoryAllocator::mem_free(ptr);
}

_sem::~_sem() {
    MemoryAllocator::mem_free(this);
}
