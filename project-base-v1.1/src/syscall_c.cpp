//
// Created by Danilo on 5/28/23.
//

#include "../h/syscall_c.hpp"
#include "../h/ABICodes.hpp"
#include "../h/printing.hpp"
#include "../lib/console.h"

void abiInvoker(int serviceID, ...) {
    __asm__ volatile("ecall");
}

void* mem_alloc (size_t size) {
    if (!size) return nullptr;
    size_t blks = (size % MEM_BLOCK_SIZE == 0) ? (size / MEM_BLOCK_SIZE) : (size / MEM_BLOCK_SIZE) + 1;
    abiInvoker(MEM_ALLOC, blks);
    uint64 ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    return (void*) ret;
}

int mem_free (void* p) {
    if (!p) return -1;
    abiInvoker(MEM_FREE, p);
    uint64 ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    return (int) ret;
}

int thread_create (thread_t* handle, void(*start_routine)(void*), void* arg) {
    if (!handle) return -1;
    if (!start_routine) return -1;
    abiInvoker(THREAD_CREATE, handle, start_routine, arg);
    uint64 ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    return (int) ret;
}

int thread_only (thread_t* handle, void(*start_routine)(void*), void* arg) {
    if (!handle) return -1;
    if (!start_routine) return -1;
    abiInvoker(THREAD_ONLY, handle, start_routine, arg);
    uint64 ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    return (int) ret;
}

int thread_start(thread_t handle) {
    if (!handle) return -1;
    abiInvoker(THREAD_START, handle);
    uint64 ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    return (int) ret;
}

int thread_exit() {
    abiInvoker(THREAD_EXIT);
    uint64 ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    return (int) ret;
}

void thread_dispatch () {
    abiInvoker(THREAD_DISPATCH);
}

void thread_join (thread_t handle) {
    if (!handle) return;
    abiInvoker(THREAD_JOIN, handle);
}

int sem_open (sem_t* handle, unsigned init) {
    if (!handle) return -1;
    abiInvoker(SEM_OPEN, handle, init);
    uint64 ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    return (int) ret;
}

int sem_close (sem_t handle) {
    if (!handle) return -1;
    abiInvoker(SEM_CLOSE, handle);
    uint64 ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    return (int) ret;
}

int sem_wait (sem_t id) {
    if (!id) return -1;
    abiInvoker(SEM_WAIT, id);
    uint64 ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    return (int) ret;
}

int sem_signal (sem_t id) {
    if (!id) return -1;
    abiInvoker(SEM_SIGNAL, id);
    uint64 ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    return (int) ret;
}

char getc () {
    abiInvoker(GET_C);
    uint64 ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    return (char) ret;
}

void putc (char c) {
    if (!c) return;
    abiInvoker(PUT_C, c);
}