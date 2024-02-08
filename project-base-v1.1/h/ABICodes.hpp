//
// Created by Danilo on 5/28/23.
//

#ifndef PROJECT_BASE_V1_1_ABICODES_HPP
#define PROJECT_BASE_V1_1_ABICODES_HPP

// sa vezbi
enum ABICodes {
    MEM_ALLOC = 0x01,
    MEM_FREE = 0x02,
    THREAD_CREATE = 0x11,
    THREAD_EXIT = 0x12,
    THREAD_DISPATCH = 0x13,
    THREAD_JOIN = 0x14,
    THREAD_START = 0x15,
    THREAD_ONLY = 0x16,
    SEM_OPEN = 0x21,
    SEM_CLOSE = 0x22,
    SEM_WAIT = 0x23,
    SEM_SIGNAL = 0x24,
    TIME_SLEEP = 0x31,
    GET_C = 0x41,
    PUT_C = 0x42,
    SYSTEM_MODE_CHANGE = 0x50
};

#endif //PROJECT_BASE_V1_1_ABICODES_HPP
