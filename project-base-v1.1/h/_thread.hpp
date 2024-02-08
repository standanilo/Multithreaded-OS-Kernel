//
// Created by Danilo on 5/29/23.
// Preuzeto sa snimka iz vezbi 7.
//

#ifndef PROJECT_BASE_V1_1__THREAD_HPP
#define PROJECT_BASE_V1_1__THREAD_HPP

#include "../lib/hw.h"
#include "../h/Scheduler.hpp"

class _thread {
public:

    ~_thread() {
        delete[] stack;
    }
    bool isFinished() const {
        return finished;
    }

    void setFinished(bool f) {
        _thread::finished = f;
    }

    bool hasStarted() const {
        return started;
    }

    void setStarted(bool s) {
        _thread::started = s;
    }
    bool isMain() const;

    void setMain(bool m);

    bool isBlocked() const;

    void setBlocked(bool blocked);

    int start();


    using Body = void (*)(void*);

    static _thread *createProcess(Body body, void* args);

    static void yield();

    static void join(_thread* t);

    static _thread *running;

    void *operator new (size_t size);
    void *operator new[] (size_t size);
    void operator delete (void* ptr);
    void operator delete[] (void* ptr);

private:
    _thread(Body body, void* arg);

    struct Context {
        uint64 ra;
        uint64 sp;
    };
    Body body;
    void* arg;
    uint64 *stack;
    Context context;
    bool finished;
    bool started;
    bool main;
    bool blocked;

    friend class Riscv;
    friend class _sem;

    static void threadWrapper();

    static void contextSwitch(Context *oldContext, Context *runningContext);

    static void dispatch();

    static int exit();

};
#endif //PROJECT_BASE_V1_1__THREAD_HPP
