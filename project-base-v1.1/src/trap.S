.global vector_table
vector_table:
    j _ZN5Riscv14supervisorTrapEv   # 0
    j _ZN5Riscv9timerTrapEv         # 1
    j _ZN5Riscv14supervisorTrapEv   # 2
    j _ZN5Riscv14supervisorTrapEv   # 3
    j _ZN5Riscv14supervisorTrapEv   # 4
    j _ZN5Riscv14supervisorTrapEv   # 5
    j _ZN5Riscv14supervisorTrapEv   # 6
    j _ZN5Riscv14supervisorTrapEv   # 7
    j _ZN5Riscv14supervisorTrapEv   # 8
    j _ZN5Riscv11consoleTrapEv      # 9

.extern _ZN5Riscv20handleSupervisorTrapEv
.align 4
.global _ZN5Riscv14supervisorTrapEv
.type _ZN5Riscv14supervisorTrapEv, @function
_ZN5Riscv14supervisorTrapEv:

    # push registers to stack
    addi sp, sp, -256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    call _ZN5Riscv20handleSupervisorTrapEv

    # pop  registers from stack
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    addi sp, sp, 256

    sret

.extern _ZN5Riscv15handleTimerTrapEv
.align 4
.global _ZN5Riscv9timerTrapEv
.type _ZN5Riscv9timerTrapEv, @function
_ZN5Riscv9timerTrapEv:

    # push registers to stack
    addi sp, sp, -256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr

    call _ZN5Riscv15handleTimerTrapEv


    # pop  registers from stack
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    addi sp, sp, 256

    sret


.extern _ZN5Riscv17handleConsoleTrapEv
.align 4
.global _ZN5Riscv11consoleTrapEv
.type _ZN5Riscv11consoleTrapEv, @function
_ZN5Riscv11consoleTrapEv:

    # push registers to stack
    addi sp, sp, -256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr

    call _ZN5Riscv17handleConsoleTrapEv


    # pop  registers from stack
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    addi sp, sp, 256

    sret
