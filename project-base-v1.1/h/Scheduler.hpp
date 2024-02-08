//
// Created by Danilo on 5/29/23.
// Preuzeto sa snimka iz vezbi 7.
//

#ifndef PROJECT_BASE_V1_1_SCHEDULER_HPP
#define PROJECT_BASE_V1_1_SCHEDULER_HPP

#include "../h/list.hpp"

class _thread;
class Scheduler {
public:
    static _thread *get();
    static void put(_thread *pcb);

//private:
    static List readyProcessQueue;
};

#endif //PROJECT_BASE_V1_1_SCHEDULER_HPP
