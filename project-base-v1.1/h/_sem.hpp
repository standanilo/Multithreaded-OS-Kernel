//
// Created by Danilo on 6/3/23.
//

#ifndef PROJECT_BASE_V1_1__SEM_HPP
#define PROJECT_BASE_V1_1__SEM_HPP

#include "list.hpp"
#include "syscall_c.hpp"

class _sem {
public:
    ~_sem();

    static _sem* open(unsigned init);
    int close();
    int wait();
    int signal();

    void *operator new (size_t size);
    void *operator new[] (size_t size);
    void operator delete (void* ptr);
    void operator delete[] (void* ptr);

private:

    int val;

    List *blocked;

    _sem(unsigned init);

};

#endif //PROJECT_BASE_V1_1__SEM_HPP
