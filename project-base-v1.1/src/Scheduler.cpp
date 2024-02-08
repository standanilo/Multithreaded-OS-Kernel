//
// Created by Danilo on 5/29/23.
//

#include "../h/Scheduler.hpp"

List Scheduler::readyProcessQueue;

_thread *Scheduler::get() {
    return readyProcessQueue.removeFirst();
}

void Scheduler::put(_thread *pcb) {
    readyProcessQueue.addLast(pcb);
}