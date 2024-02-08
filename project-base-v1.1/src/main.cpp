//
// Created by Danilo on 4/26/23.
//

#include "../h/printing.hpp"
#include "../h/riscv.hpp"
#include "../h/syscall_c.hpp"
#include "../h/_thread.hpp"
#include "../h/_sem.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../lib/console.h"
#include "../h/syscall_cpp.hpp"
#include "../h/ABICodes.hpp"
#include "../h/buffer.hpp"

//handler_t vector_table[16] = {
//        &Riscv::supervisorTrap,
//        &Riscv::timerTrap,
//        0,
//        0,
//        0,
//        0,
//        0,
//        0,
//        0,
//        0,
//        &Riscv::consoleTrap
//};
extern uint32 vector_table;
bool ended = false;
//bool ended1 = false;
//bool ended2 = false;

//sem_t s1;
//sem_t s2;

//void b1(void* a) {
//    for (uint64 i = 0; i < 2; i++) {
//        printString("i1="); printInt(i); printString("\n");
//        for (uint64 j = 0; j < 10000; j++) {
//            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
//        }
//        if (i == 0) {
//            printString("thread b signal 1\n");
//            sem_signal(s1);
//        } else {
//            printString("thread b wait 2\n");
//            sem_wait(s2);
//        }
//    }
//    printString("end1\n");
//    ended1 = true;
//}

//void b2(void* a) {
//    for (uint64 i = 0; i < 10; i++) {
//        printString("i2="); printInt(i); printString("\n");
//        for (uint64 j = 0; j < 5000; j++) {
//            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
//            thread_dispatch();
//        }
//    }
//    printString("end2\n");
//    ended1 = true;
//    thread_dispatch();
//
//}

void userMain();

void wraperUserMain(void *){
//    Riscv::mc_sstatus(Riscv::SSTATUS_SPP);
//    uint64 adr = (uint64)(&userMain);
//    __asm__ volatile("csrw sepc, %0" : : "r" (adr));
//    __asm__ volatile("sret");
    userMain();
    ended = true;
    thread_dispatch();
}

int main() {

    MemoryAllocator::mem_init();
    Riscv::init_stvec((uint64) (&vector_table) | 0x01);
    _thread *mainT = _thread::createProcess(nullptr, nullptr);

    _thread::running = mainT;

//    _thread* t1 = _thread::createProcess(b1, nullptr);
//    t1->start();

//    sem_open(&s1, 0);
//    sem_open(&s2, 0);
//
//    printString("main wait 1\n");
//    sem_wait(s1);
//    printString("main signal 2\n");
//    sem_signal(s2);
//
//    thread_dispatch();
//
//    sem_close(s1);
//    sem_close(s2);

    _thread *user = _thread::createProcess(wraperUserMain, nullptr);
    user->start();

//    Thread* user = new Thread(wraperUserMain, nullptr);

//    Buffer *b = new Buffer(5);
//    user->setMain(true);
//
//    _thread* t2 = _thread::createProcess(b2, nullptr);
//    t2->start();

    while(!ended) {
        thread_dispatch();
    }

//    thread_join(user);

    Riscv::restoreSupervisor();

    delete user;

//    delete t1;

//    delete t2;

//    delete b;

    delete mainT;

    return 1;
}
