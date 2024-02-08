//
// Created by Danilo on 5/15/23.
//

#include "../h/riscv.hpp"
#include "../h/printing.hpp"
#include "../h/ABICodes.hpp"
#include "../lib/console.h"
#include "../h/MemoryAllocator.hpp"
#include "../h/syscall_c.hpp"
#include "../h/_thread.hpp"
#include "../h/_sem.hpp"

void Riscv::popSppSpie() {
    mc_sstatus(SSTATUS_SPP);
//    ms_sstatus(SSTATUS_SIE);
    __asm__ volatile ("csrw sepc, ra");
    __asm__ volatile ("sret");
}

void Riscv::restoreSupervisor() {
    abiInvoker(SYSTEM_MODE_CHANGE);
}

void Riscv::handleSupervisorTrap() {
    uint64 abiCode = 0;
    uint64 a1 = 0;
    uint64 a2 = 0;
    uint64 a3 = 0;
    uint64 a4 = 0;
    __asm__ volatile ("mv %0, a0":"=r" (abiCode));
    __asm__ volatile ("mv %0, a1":"=r" (a1));
    __asm__ volatile ("mv %0, a2":"=r" (a2));
    __asm__ volatile ("mv %0, a3":"=r" (a3));
    __asm__ volatile ("mv %0, a4":"=r" (a4));
    volatile uint64 scauseVar = r_scause();
    if (scauseVar == 0x0000000000000008UL || scauseVar == 0x0000000000000009UL) {
        // ecall
        uint64 sepc = r_sepc() + 4;
        uint64 sstatus = r_sstatus();
        switch (abiCode) {
            case MEM_ALLOC: {
                uint64 blks = a1;
                MemoryAllocator::mem_alloc(blks * MEM_BLOCK_SIZE);
                __asm__ volatile("sd a0, 10 * 8(fp)");
                break;
            }
            case MEM_FREE: {
                void* ptr = (void *) a1;
                MemoryAllocator::mem_free(ptr);
                __asm__ volatile("sd a0, 10 * 8(fp)");
                break;
            }
            case THREAD_CREATE: {
                thread_t* handle = (thread_t*) a1;
                _thread::Body body = (_thread::Body) a2;
                void *arg = (void*) a3;
                *handle = _thread::createProcess(body, arg);
                if (!(*handle)) {
                    __asm__ volatile("li a0, -1");
                } else {
                    __asm__ volatile("mv a0, zero");
                    (*handle)->start();
                }
                __asm__ volatile("sd a0, 10 * 8(fp)");
                break;
            }
            case THREAD_DISPATCH: {
//                if (_thread::running->isMain()) {
//                    Riscv::ms_sstatus(Riscv::SSTATUS_SPP);
//                } else {
//                    Riscv::mc_sstatus(Riscv::SSTATUS_SPP);
//                    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
//                }
                _thread::dispatch();
//                sstatus = r_sstatus();

                break;
            }
            case THREAD_JOIN: {
                thread_t handle = (thread_t) a1;
                _thread::running->join(handle);
                break;
            }
            case THREAD_START: {
                thread_t handle = (thread_t) a1;
                handle->start();
                break;
            }
            case THREAD_ONLY: {
                thread_t* handle = (thread_t*) a1;
                _thread::Body body = (_thread::Body) a2;
                void *arg = (void*) a3;
                *handle = _thread::createProcess(body, arg);
                if (!(*handle)) {
                    __asm__ volatile("li a0, -1");
                } else {
                    __asm__ volatile("mv a0, zero");
                }
                __asm__ volatile("sd a0, 10 * 8(fp)");
                break;
            }
            case SEM_OPEN: {
                sem_t* handle = (sem_t*) a1;
                unsigned int init = a2;
                *handle = _sem::open(init);
                if (!(*handle)) {
                    __asm__ volatile("li a0, -1");
                } else {
                    __asm__ volatile("mv a0, zero");
                }
                __asm__ volatile("sd a0, 10 * 8(fp)");
                break;
            }
            case SEM_CLOSE: {
                sem_t handle = (sem_t) a1;
                handle->close();
                break;
            }
            case SEM_WAIT: {
                sem_t handle = (sem_t) a1;
                handle->wait();
                break;
            }
            case SEM_SIGNAL: {
                sem_t handle = (sem_t) a1;
                handle->signal();
                break;
            }
            case GET_C: {
                __getc();
                __asm__ volatile("sd a0, 10 * 8(fp)");
                break;
            }
            case PUT_C: {
                char c = (char) a1;
                __putc(c);
                break;
            }
            case SYSTEM_MODE_CHANGE: {
                ms_sstatus(SSTATUS_SPP);
                w_sepc(sepc);
                return;
            }
        }
        w_sstatus(sstatus);
        w_sepc(sepc);
    } else if (scauseVar == 0x0000000000000002UL){
        // unexpecter trap
        printString("\n");
        printString("scause = ");
        printInt(scauseVar);
        printString("\n");
        printString("illegal instruction\n");
        printString("shuting down\n");

        *((unsigned int*)0x100000) = 0x5555;

    } else {
        // unexpecter trap
        printString("\n");
        printString("scause = ");
        printInt(scauseVar);
        printString("\n");

        *((unsigned int*)0x100000) = 0x5555;
    }
}

void Riscv::init_stvec(uint32 vector) {
    w_stvec(vector);
    ms_sstatus(SSTATUS_SIE);
}

void Riscv::handleTimerTrap() {
    uint64 scauseVar = r_scause();
    if (scauseVar == 0x8000000000000001UL) {
        // timer
        uint64 sepc = r_sepc() + 4;
        uint64 sstatus = r_sstatus();
//        printString("handled\n");
        w_sstatus(sstatus);
        w_sepc(sepc);
        mc_sip(SIP_SSIP);
//        printString("timer\n");
    } else {
        // unexpecter trap
        printInt(scauseVar);
        printString("\n");
    }
}

void Riscv::handleConsoleTrap() {
    uint64 scauseVar = r_scause();
    if (scauseVar == 0x8000000000000009UL) {
        // console
        console_handler();
    } else {
        // unexpecter trap
        printInt(scauseVar);
        printString("\n");
    }
}