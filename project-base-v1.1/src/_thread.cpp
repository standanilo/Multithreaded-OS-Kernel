//
// Created by Danilo on 5/30/23.
// Preuzeto sa snimka iz vezbi 7.
//

#include "../h/_thread.hpp"
#include "../h/riscv.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/printing.hpp"

_thread* _thread::running = nullptr;

_thread *_thread::createProcess(Body body, void* args){
    return new _thread(body, args);
}

int _thread::start() {
    if (!this->hasStarted()) {
        this->setStarted(true);
        Scheduler::put(this);
        return 0;
    }
    return -1;
}

int _thread::exit() {
    running->setFinished(true);
    thread_dispatch();
    return 0;
}

void _thread::yield() {
    dispatch();
}

void _thread::dispatch() {
    _thread *old = running;
    if (!old->finished && !old->blocked) {
        Scheduler::put(old);
    }
    running = Scheduler::get();
    abiInvoker(0);
    _thread::contextSwitch(&old->context, &running->context);
}

void _thread::threadWrapper() {
    Riscv::popSppSpie();
    running->body(running->arg);
    _thread::exit();
}

void *_thread::operator new(size_t size) {
    return MemoryAllocator::mem_alloc(size);
}

void *_thread::operator new[](size_t size) {
    return MemoryAllocator::mem_alloc(size);
}

void _thread::operator delete(void *ptr) {
    MemoryAllocator::mem_free(ptr);
}

void _thread::operator delete[](void *ptr) {
    MemoryAllocator::mem_free(ptr);
}

_thread::_thread(_thread::Body body, void *arg)
    :
    body(body),
    arg(arg),
    stack(body != nullptr ? (uint64*) MemoryAllocator::mem_alloc(sizeof(uint64) * DEFAULT_STACK_SIZE) : nullptr),
    context({
    body != nullptr ? (uint64) &threadWrapper: 0,
    stack != nullptr ? (uint64) &stack[DEFAULT_STACK_SIZE] : 0
    }),
    main(body == nullptr)
    {
        finished = false;
        started = false;
        blocked = false;
    }

bool _thread::isMain() const {
    return main;
}

void _thread::setMain(bool m) {
    main = m;
}

void _thread::setBlocked(bool b) {
    blocked = b;
}

bool _thread::isBlocked() const {
    return blocked;
}

void _thread::join(_thread* t) {
    while(!t->isFinished()) {
        dispatch();
    }
}
