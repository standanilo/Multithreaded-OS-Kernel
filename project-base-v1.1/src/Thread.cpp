//
// Created by Danilo on 5/30/23.
//

#include "../h/syscall_cpp.hpp"
#include "../h/_thread.hpp"

Thread::Thread(void (*body)(void *), void *args) {
    thread_create(&this->myHandle, body, args);
//    thread_start(this->myHandle);
}

Thread::~Thread() {
    delete this->myHandle;
}

int Thread::start() {
    return thread_start(this->myHandle);
}

void Thread::join() {
    thread_join(this->myHandle);
}

void Thread::dispatch() {
    thread_dispatch();
}

void Thread::wrapper(void *args) {
    if(args){
        ((Thread*)args)->run();
    }
}

Thread::Thread() {
    thread_only(&this->myHandle, Thread::wrapper, this);
}

//void Thread::setMain(bool b) {
//    this->myHandle->setMain(b);
//}

//int Thread::sleep(time_t t) {
//    return time_sleep(t);
//}