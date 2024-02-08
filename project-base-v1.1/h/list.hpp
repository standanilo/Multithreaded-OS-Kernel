//
// Created by Danilo on 4/26/23.
// Preuzeto sa snimka iz vezbi 7.
//

#ifndef PROJECT_BASE_V1_1_LIST_HPP
#define PROJECT_BASE_V1_1_LIST_HPP

#include "../h/MemoryAllocator.hpp"

class _thread;
class List {
private:
    struct Elem {
        _thread *data;
        Elem *next;

        Elem(_thread *data, Elem *next) : data(data), next(next) {}
    };

    Elem *head, *tail;

public:
    List() : head(0), tail(0) {}
    List(const List &) = delete;
    List &operator=(const List &) = delete;

    void init();

    void addFirst(_thread *data);

    void addLast(_thread *data);

    _thread *removeFirst();

    _thread *peekFirst();

    _thread *removeLast();

    _thread *peekLast();
};


#endif //PROJECT_BASE_V1_1_LIST_HPP
