
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000a117          	auipc	sp,0xa
    80000004:	54813103          	ld	sp,1352(sp) # 8000a548 <_GLOBAL_OFFSET_TABLE_+0x18>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	509050ef          	jal	ra,80005d24 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <vector_table>:
.global vector_table
vector_table:
    j _ZN5Riscv14supervisorTrapEv   # 0
    80001000:	0300006f          	j	80001030 <_ZN5Riscv14supervisorTrapEv>
    j _ZN5Riscv9timerTrapEv         # 1
    80001004:	13c0006f          	j	80001140 <_ZN5Riscv9timerTrapEv>
    j _ZN5Riscv14supervisorTrapEv   # 2
    80001008:	0280006f          	j	80001030 <_ZN5Riscv14supervisorTrapEv>
    j _ZN5Riscv14supervisorTrapEv   # 3
    8000100c:	0240006f          	j	80001030 <_ZN5Riscv14supervisorTrapEv>
    j _ZN5Riscv14supervisorTrapEv   # 4
    80001010:	0200006f          	j	80001030 <_ZN5Riscv14supervisorTrapEv>
    j _ZN5Riscv14supervisorTrapEv   # 5
    80001014:	01c0006f          	j	80001030 <_ZN5Riscv14supervisorTrapEv>
    j _ZN5Riscv14supervisorTrapEv   # 6
    80001018:	0180006f          	j	80001030 <_ZN5Riscv14supervisorTrapEv>
    j _ZN5Riscv14supervisorTrapEv   # 7
    8000101c:	0140006f          	j	80001030 <_ZN5Riscv14supervisorTrapEv>
    j _ZN5Riscv14supervisorTrapEv   # 8
    80001020:	0100006f          	j	80001030 <_ZN5Riscv14supervisorTrapEv>
    j _ZN5Riscv11consoleTrapEv      # 9
    80001024:	22c0006f          	j	80001250 <_ZN5Riscv11consoleTrapEv>
    80001028:	00000013          	nop
    8000102c:	00000013          	nop

0000000080001030 <_ZN5Riscv14supervisorTrapEv>:
.global _ZN5Riscv14supervisorTrapEv
.type _ZN5Riscv14supervisorTrapEv, @function
_ZN5Riscv14supervisorTrapEv:

    # push registers to stack
    addi sp, sp, -256
    80001030:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001034:	00013023          	sd	zero,0(sp)
    80001038:	00113423          	sd	ra,8(sp)
    8000103c:	00213823          	sd	sp,16(sp)
    80001040:	00313c23          	sd	gp,24(sp)
    80001044:	02413023          	sd	tp,32(sp)
    80001048:	02513423          	sd	t0,40(sp)
    8000104c:	02613823          	sd	t1,48(sp)
    80001050:	02713c23          	sd	t2,56(sp)
    80001054:	04813023          	sd	s0,64(sp)
    80001058:	04913423          	sd	s1,72(sp)
    8000105c:	04a13823          	sd	a0,80(sp)
    80001060:	04b13c23          	sd	a1,88(sp)
    80001064:	06c13023          	sd	a2,96(sp)
    80001068:	06d13423          	sd	a3,104(sp)
    8000106c:	06e13823          	sd	a4,112(sp)
    80001070:	06f13c23          	sd	a5,120(sp)
    80001074:	09013023          	sd	a6,128(sp)
    80001078:	09113423          	sd	a7,136(sp)
    8000107c:	09213823          	sd	s2,144(sp)
    80001080:	09313c23          	sd	s3,152(sp)
    80001084:	0b413023          	sd	s4,160(sp)
    80001088:	0b513423          	sd	s5,168(sp)
    8000108c:	0b613823          	sd	s6,176(sp)
    80001090:	0b713c23          	sd	s7,184(sp)
    80001094:	0d813023          	sd	s8,192(sp)
    80001098:	0d913423          	sd	s9,200(sp)
    8000109c:	0da13823          	sd	s10,208(sp)
    800010a0:	0db13c23          	sd	s11,216(sp)
    800010a4:	0fc13023          	sd	t3,224(sp)
    800010a8:	0fd13423          	sd	t4,232(sp)
    800010ac:	0fe13823          	sd	t5,240(sp)
    800010b0:	0ff13c23          	sd	t6,248(sp)
    call _ZN5Riscv20handleSupervisorTrapEv
    800010b4:	149030ef          	jal	ra,800049fc <_ZN5Riscv20handleSupervisorTrapEv>

    # pop  registers from stack
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800010b8:	00013003          	ld	zero,0(sp)
    800010bc:	00813083          	ld	ra,8(sp)
    800010c0:	01013103          	ld	sp,16(sp)
    800010c4:	01813183          	ld	gp,24(sp)
    800010c8:	02013203          	ld	tp,32(sp)
    800010cc:	02813283          	ld	t0,40(sp)
    800010d0:	03013303          	ld	t1,48(sp)
    800010d4:	03813383          	ld	t2,56(sp)
    800010d8:	04013403          	ld	s0,64(sp)
    800010dc:	04813483          	ld	s1,72(sp)
    800010e0:	05013503          	ld	a0,80(sp)
    800010e4:	05813583          	ld	a1,88(sp)
    800010e8:	06013603          	ld	a2,96(sp)
    800010ec:	06813683          	ld	a3,104(sp)
    800010f0:	07013703          	ld	a4,112(sp)
    800010f4:	07813783          	ld	a5,120(sp)
    800010f8:	08013803          	ld	a6,128(sp)
    800010fc:	08813883          	ld	a7,136(sp)
    80001100:	09013903          	ld	s2,144(sp)
    80001104:	09813983          	ld	s3,152(sp)
    80001108:	0a013a03          	ld	s4,160(sp)
    8000110c:	0a813a83          	ld	s5,168(sp)
    80001110:	0b013b03          	ld	s6,176(sp)
    80001114:	0b813b83          	ld	s7,184(sp)
    80001118:	0c013c03          	ld	s8,192(sp)
    8000111c:	0c813c83          	ld	s9,200(sp)
    80001120:	0d013d03          	ld	s10,208(sp)
    80001124:	0d813d83          	ld	s11,216(sp)
    80001128:	0e013e03          	ld	t3,224(sp)
    8000112c:	0e813e83          	ld	t4,232(sp)
    80001130:	0f013f03          	ld	t5,240(sp)
    80001134:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001138:	10010113          	addi	sp,sp,256

    sret
    8000113c:	10200073          	sret

0000000080001140 <_ZN5Riscv9timerTrapEv>:
.global _ZN5Riscv9timerTrapEv
.type _ZN5Riscv9timerTrapEv, @function
_ZN5Riscv9timerTrapEv:

    # push registers to stack
    addi sp, sp, -256
    80001140:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001144:	00013023          	sd	zero,0(sp)
    80001148:	00113423          	sd	ra,8(sp)
    8000114c:	00213823          	sd	sp,16(sp)
    80001150:	00313c23          	sd	gp,24(sp)
    80001154:	02413023          	sd	tp,32(sp)
    80001158:	02513423          	sd	t0,40(sp)
    8000115c:	02613823          	sd	t1,48(sp)
    80001160:	02713c23          	sd	t2,56(sp)
    80001164:	04813023          	sd	s0,64(sp)
    80001168:	04913423          	sd	s1,72(sp)
    8000116c:	04a13823          	sd	a0,80(sp)
    80001170:	04b13c23          	sd	a1,88(sp)
    80001174:	06c13023          	sd	a2,96(sp)
    80001178:	06d13423          	sd	a3,104(sp)
    8000117c:	06e13823          	sd	a4,112(sp)
    80001180:	06f13c23          	sd	a5,120(sp)
    80001184:	09013023          	sd	a6,128(sp)
    80001188:	09113423          	sd	a7,136(sp)
    8000118c:	09213823          	sd	s2,144(sp)
    80001190:	09313c23          	sd	s3,152(sp)
    80001194:	0b413023          	sd	s4,160(sp)
    80001198:	0b513423          	sd	s5,168(sp)
    8000119c:	0b613823          	sd	s6,176(sp)
    800011a0:	0b713c23          	sd	s7,184(sp)
    800011a4:	0d813023          	sd	s8,192(sp)
    800011a8:	0d913423          	sd	s9,200(sp)
    800011ac:	0da13823          	sd	s10,208(sp)
    800011b0:	0db13c23          	sd	s11,216(sp)
    800011b4:	0fc13023          	sd	t3,224(sp)
    800011b8:	0fd13423          	sd	t4,232(sp)
    800011bc:	0fe13823          	sd	t5,240(sp)
    800011c0:	0ff13c23          	sd	t6,248(sp)

    call _ZN5Riscv15handleTimerTrapEv
    800011c4:	331030ef          	jal	ra,80004cf4 <_ZN5Riscv15handleTimerTrapEv>


    # pop  registers from stack
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800011c8:	00013003          	ld	zero,0(sp)
    800011cc:	00813083          	ld	ra,8(sp)
    800011d0:	01013103          	ld	sp,16(sp)
    800011d4:	01813183          	ld	gp,24(sp)
    800011d8:	02013203          	ld	tp,32(sp)
    800011dc:	02813283          	ld	t0,40(sp)
    800011e0:	03013303          	ld	t1,48(sp)
    800011e4:	03813383          	ld	t2,56(sp)
    800011e8:	04013403          	ld	s0,64(sp)
    800011ec:	04813483          	ld	s1,72(sp)
    800011f0:	05013503          	ld	a0,80(sp)
    800011f4:	05813583          	ld	a1,88(sp)
    800011f8:	06013603          	ld	a2,96(sp)
    800011fc:	06813683          	ld	a3,104(sp)
    80001200:	07013703          	ld	a4,112(sp)
    80001204:	07813783          	ld	a5,120(sp)
    80001208:	08013803          	ld	a6,128(sp)
    8000120c:	08813883          	ld	a7,136(sp)
    80001210:	09013903          	ld	s2,144(sp)
    80001214:	09813983          	ld	s3,152(sp)
    80001218:	0a013a03          	ld	s4,160(sp)
    8000121c:	0a813a83          	ld	s5,168(sp)
    80001220:	0b013b03          	ld	s6,176(sp)
    80001224:	0b813b83          	ld	s7,184(sp)
    80001228:	0c013c03          	ld	s8,192(sp)
    8000122c:	0c813c83          	ld	s9,200(sp)
    80001230:	0d013d03          	ld	s10,208(sp)
    80001234:	0d813d83          	ld	s11,216(sp)
    80001238:	0e013e03          	ld	t3,224(sp)
    8000123c:	0e813e83          	ld	t4,232(sp)
    80001240:	0f013f03          	ld	t5,240(sp)
    80001244:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001248:	10010113          	addi	sp,sp,256

    sret
    8000124c:	10200073          	sret

0000000080001250 <_ZN5Riscv11consoleTrapEv>:
.global _ZN5Riscv11consoleTrapEv
.type _ZN5Riscv11consoleTrapEv, @function
_ZN5Riscv11consoleTrapEv:

    # push registers to stack
    addi sp, sp, -256
    80001250:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001254:	00013023          	sd	zero,0(sp)
    80001258:	00113423          	sd	ra,8(sp)
    8000125c:	00213823          	sd	sp,16(sp)
    80001260:	00313c23          	sd	gp,24(sp)
    80001264:	02413023          	sd	tp,32(sp)
    80001268:	02513423          	sd	t0,40(sp)
    8000126c:	02613823          	sd	t1,48(sp)
    80001270:	02713c23          	sd	t2,56(sp)
    80001274:	04813023          	sd	s0,64(sp)
    80001278:	04913423          	sd	s1,72(sp)
    8000127c:	04a13823          	sd	a0,80(sp)
    80001280:	04b13c23          	sd	a1,88(sp)
    80001284:	06c13023          	sd	a2,96(sp)
    80001288:	06d13423          	sd	a3,104(sp)
    8000128c:	06e13823          	sd	a4,112(sp)
    80001290:	06f13c23          	sd	a5,120(sp)
    80001294:	09013023          	sd	a6,128(sp)
    80001298:	09113423          	sd	a7,136(sp)
    8000129c:	09213823          	sd	s2,144(sp)
    800012a0:	09313c23          	sd	s3,152(sp)
    800012a4:	0b413023          	sd	s4,160(sp)
    800012a8:	0b513423          	sd	s5,168(sp)
    800012ac:	0b613823          	sd	s6,176(sp)
    800012b0:	0b713c23          	sd	s7,184(sp)
    800012b4:	0d813023          	sd	s8,192(sp)
    800012b8:	0d913423          	sd	s9,200(sp)
    800012bc:	0da13823          	sd	s10,208(sp)
    800012c0:	0db13c23          	sd	s11,216(sp)
    800012c4:	0fc13023          	sd	t3,224(sp)
    800012c8:	0fd13423          	sd	t4,232(sp)
    800012cc:	0fe13823          	sd	t5,240(sp)
    800012d0:	0ff13c23          	sd	t6,248(sp)

    call _ZN5Riscv17handleConsoleTrapEv
    800012d4:	2b1030ef          	jal	ra,80004d84 <_ZN5Riscv17handleConsoleTrapEv>


    # pop  registers from stack
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800012d8:	00013003          	ld	zero,0(sp)
    800012dc:	00813083          	ld	ra,8(sp)
    800012e0:	01013103          	ld	sp,16(sp)
    800012e4:	01813183          	ld	gp,24(sp)
    800012e8:	02013203          	ld	tp,32(sp)
    800012ec:	02813283          	ld	t0,40(sp)
    800012f0:	03013303          	ld	t1,48(sp)
    800012f4:	03813383          	ld	t2,56(sp)
    800012f8:	04013403          	ld	s0,64(sp)
    800012fc:	04813483          	ld	s1,72(sp)
    80001300:	05013503          	ld	a0,80(sp)
    80001304:	05813583          	ld	a1,88(sp)
    80001308:	06013603          	ld	a2,96(sp)
    8000130c:	06813683          	ld	a3,104(sp)
    80001310:	07013703          	ld	a4,112(sp)
    80001314:	07813783          	ld	a5,120(sp)
    80001318:	08013803          	ld	a6,128(sp)
    8000131c:	08813883          	ld	a7,136(sp)
    80001320:	09013903          	ld	s2,144(sp)
    80001324:	09813983          	ld	s3,152(sp)
    80001328:	0a013a03          	ld	s4,160(sp)
    8000132c:	0a813a83          	ld	s5,168(sp)
    80001330:	0b013b03          	ld	s6,176(sp)
    80001334:	0b813b83          	ld	s7,184(sp)
    80001338:	0c013c03          	ld	s8,192(sp)
    8000133c:	0c813c83          	ld	s9,200(sp)
    80001340:	0d013d03          	ld	s10,208(sp)
    80001344:	0d813d83          	ld	s11,216(sp)
    80001348:	0e013e03          	ld	t3,224(sp)
    8000134c:	0e813e83          	ld	t4,232(sp)
    80001350:	0f013f03          	ld	t5,240(sp)
    80001354:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001358:	10010113          	addi	sp,sp,256

    sret
    8000135c:	10200073          	sret
	...

0000000080001368 <_ZN5Riscv13pushRegistersEv>:
.global _ZN5Riscv13pushRegistersEv
.type _ZN5Riscv13pushRegistersEv, @function
_ZN5Riscv13pushRegistersEv:
    addi sp, sp, -256
    80001368:	f0010113          	addi	sp,sp,-256
    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    8000136c:	00313c23          	sd	gp,24(sp)
    80001370:	02413023          	sd	tp,32(sp)
    80001374:	02513423          	sd	t0,40(sp)
    80001378:	02613823          	sd	t1,48(sp)
    8000137c:	02713c23          	sd	t2,56(sp)
    80001380:	04813023          	sd	s0,64(sp)
    80001384:	04913423          	sd	s1,72(sp)
    80001388:	04a13823          	sd	a0,80(sp)
    8000138c:	04b13c23          	sd	a1,88(sp)
    80001390:	06c13023          	sd	a2,96(sp)
    80001394:	06d13423          	sd	a3,104(sp)
    80001398:	06e13823          	sd	a4,112(sp)
    8000139c:	06f13c23          	sd	a5,120(sp)
    800013a0:	09013023          	sd	a6,128(sp)
    800013a4:	09113423          	sd	a7,136(sp)
    800013a8:	09213823          	sd	s2,144(sp)
    800013ac:	09313c23          	sd	s3,152(sp)
    800013b0:	0b413023          	sd	s4,160(sp)
    800013b4:	0b513423          	sd	s5,168(sp)
    800013b8:	0b613823          	sd	s6,176(sp)
    800013bc:	0b713c23          	sd	s7,184(sp)
    800013c0:	0d813023          	sd	s8,192(sp)
    800013c4:	0d913423          	sd	s9,200(sp)
    800013c8:	0da13823          	sd	s10,208(sp)
    800013cc:	0db13c23          	sd	s11,216(sp)
    800013d0:	0fc13023          	sd	t3,224(sp)
    800013d4:	0fd13423          	sd	t4,232(sp)
    800013d8:	0fe13823          	sd	t5,240(sp)
    800013dc:	0ff13c23          	sd	t6,248(sp)
    ret
    800013e0:	00008067          	ret

00000000800013e4 <_ZN5Riscv12popRegistersEv>:
.global _ZN5Riscv12popRegistersEv
.type _ZN5Riscv12popRegistersEv, @function
_ZN5Riscv12popRegistersEv:
    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800013e4:	01813183          	ld	gp,24(sp)
    800013e8:	02013203          	ld	tp,32(sp)
    800013ec:	02813283          	ld	t0,40(sp)
    800013f0:	03013303          	ld	t1,48(sp)
    800013f4:	03813383          	ld	t2,56(sp)
    800013f8:	04013403          	ld	s0,64(sp)
    800013fc:	04813483          	ld	s1,72(sp)
    80001400:	05013503          	ld	a0,80(sp)
    80001404:	05813583          	ld	a1,88(sp)
    80001408:	06013603          	ld	a2,96(sp)
    8000140c:	06813683          	ld	a3,104(sp)
    80001410:	07013703          	ld	a4,112(sp)
    80001414:	07813783          	ld	a5,120(sp)
    80001418:	08013803          	ld	a6,128(sp)
    8000141c:	08813883          	ld	a7,136(sp)
    80001420:	09013903          	ld	s2,144(sp)
    80001424:	09813983          	ld	s3,152(sp)
    80001428:	0a013a03          	ld	s4,160(sp)
    8000142c:	0a813a83          	ld	s5,168(sp)
    80001430:	0b013b03          	ld	s6,176(sp)
    80001434:	0b813b83          	ld	s7,184(sp)
    80001438:	0c013c03          	ld	s8,192(sp)
    8000143c:	0c813c83          	ld	s9,200(sp)
    80001440:	0d013d03          	ld	s10,208(sp)
    80001444:	0d813d83          	ld	s11,216(sp)
    80001448:	0e013e03          	ld	t3,224(sp)
    8000144c:	0e813e83          	ld	t4,232(sp)
    80001450:	0f013f03          	ld	t5,240(sp)
    80001454:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001458:	10010113          	addi	sp,sp,256
    8000145c:	00008067          	ret

0000000080001460 <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    80001460:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    80001464:	00b29a63          	bne	t0,a1,80001478 <fail>
    sc.w t0, a2, (a0)      # Try to update.
    80001468:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    8000146c:	fe029ae3          	bnez	t0,80001460 <copy_and_swap>
    li a0, 0               # Set return to success.
    80001470:	00000513          	li	a0,0
    jr ra                  # Return.
    80001474:	00008067          	ret

0000000080001478 <fail>:
    fail:
    li a0, 1               # Set return to failure.
    80001478:	00100513          	li	a0,1
    8000147c:	00008067          	ret

0000000080001480 <_ZN7_thread13contextSwitchEPNS_7ContextES1_>:
.global _ZN7_thread13contextSwitchEPNS_7ContextES1_
.type _ZN7_thread13contextSwitchEPNS_7ContextES1_, @function
_ZN7_thread13contextSwitchEPNS_7ContextES1_:
    # a0 - &old->context
    # a1 - &running->context
    sd ra, 0 * 8(a0)
    80001480:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
    sd sp, 1 * 8(a0)
    80001484:	00253423          	sd	sp,8(a0)

    ld ra, 0 * 8(a1)
    80001488:	0005b083          	ld	ra,0(a1)
    ld sp, 1 * 8(a1)
    8000148c:	0085b103          	ld	sp,8(a1)

    80001490:	00008067          	ret

0000000080001494 <_Z10abiInvokeriz>:
#include "../h/syscall_c.hpp"
#include "../h/ABICodes.hpp"
#include "../h/printing.hpp"
#include "../lib/console.h"

void abiInvoker(int serviceID, ...) {
    80001494:	fb010113          	addi	sp,sp,-80
    80001498:	00813423          	sd	s0,8(sp)
    8000149c:	01010413          	addi	s0,sp,16
    800014a0:	00b43423          	sd	a1,8(s0)
    800014a4:	00c43823          	sd	a2,16(s0)
    800014a8:	00d43c23          	sd	a3,24(s0)
    800014ac:	02e43023          	sd	a4,32(s0)
    800014b0:	02f43423          	sd	a5,40(s0)
    800014b4:	03043823          	sd	a6,48(s0)
    800014b8:	03143c23          	sd	a7,56(s0)
    __asm__ volatile("ecall");
    800014bc:	00000073          	ecall
}
    800014c0:	00813403          	ld	s0,8(sp)
    800014c4:	05010113          	addi	sp,sp,80
    800014c8:	00008067          	ret

00000000800014cc <_Z9mem_allocm>:

void* mem_alloc (size_t size) {
    if (!size) return nullptr;
    800014cc:	04050663          	beqz	a0,80001518 <_Z9mem_allocm+0x4c>
void* mem_alloc (size_t size) {
    800014d0:	ff010113          	addi	sp,sp,-16
    800014d4:	00113423          	sd	ra,8(sp)
    800014d8:	00813023          	sd	s0,0(sp)
    800014dc:	01010413          	addi	s0,sp,16
    size_t blks = (size % MEM_BLOCK_SIZE == 0) ? (size / MEM_BLOCK_SIZE) : (size / MEM_BLOCK_SIZE) + 1;
    800014e0:	03f57793          	andi	a5,a0,63
    800014e4:	02079463          	bnez	a5,8000150c <_Z9mem_allocm+0x40>
    800014e8:	00655593          	srli	a1,a0,0x6
    abiInvoker(MEM_ALLOC, blks);
    800014ec:	00100513          	li	a0,1
    800014f0:	00000097          	auipc	ra,0x0
    800014f4:	fa4080e7          	jalr	-92(ra) # 80001494 <_Z10abiInvokeriz>
    uint64 ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    800014f8:	00050513          	mv	a0,a0
    return (void*) ret;
}
    800014fc:	00813083          	ld	ra,8(sp)
    80001500:	00013403          	ld	s0,0(sp)
    80001504:	01010113          	addi	sp,sp,16
    80001508:	00008067          	ret
    size_t blks = (size % MEM_BLOCK_SIZE == 0) ? (size / MEM_BLOCK_SIZE) : (size / MEM_BLOCK_SIZE) + 1;
    8000150c:	00655513          	srli	a0,a0,0x6
    80001510:	00150593          	addi	a1,a0,1
    80001514:	fd9ff06f          	j	800014ec <_Z9mem_allocm+0x20>
    if (!size) return nullptr;
    80001518:	00000513          	li	a0,0
}
    8000151c:	00008067          	ret

0000000080001520 <_Z8mem_freePv>:

int mem_free (void* p) {
    if (!p) return -1;
    80001520:	02050e63          	beqz	a0,8000155c <_Z8mem_freePv+0x3c>
int mem_free (void* p) {
    80001524:	ff010113          	addi	sp,sp,-16
    80001528:	00113423          	sd	ra,8(sp)
    8000152c:	00813023          	sd	s0,0(sp)
    80001530:	01010413          	addi	s0,sp,16
    80001534:	00050593          	mv	a1,a0
    abiInvoker(MEM_FREE, p);
    80001538:	00200513          	li	a0,2
    8000153c:	00000097          	auipc	ra,0x0
    80001540:	f58080e7          	jalr	-168(ra) # 80001494 <_Z10abiInvokeriz>
    uint64 ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    80001544:	00050513          	mv	a0,a0
    return (int) ret;
    80001548:	0005051b          	sext.w	a0,a0
}
    8000154c:	00813083          	ld	ra,8(sp)
    80001550:	00013403          	ld	s0,0(sp)
    80001554:	01010113          	addi	sp,sp,16
    80001558:	00008067          	ret
    if (!p) return -1;
    8000155c:	fff00513          	li	a0,-1
}
    80001560:	00008067          	ret

0000000080001564 <_Z13thread_createPP7_threadPFvPvES2_>:

int thread_create (thread_t* handle, void(*start_routine)(void*), void* arg) {
    if (!handle) return -1;
    80001564:	04050463          	beqz	a0,800015ac <_Z13thread_createPP7_threadPFvPvES2_+0x48>
    80001568:	00060693          	mv	a3,a2
    if (!start_routine) return -1;
    8000156c:	04058463          	beqz	a1,800015b4 <_Z13thread_createPP7_threadPFvPvES2_+0x50>
int thread_create (thread_t* handle, void(*start_routine)(void*), void* arg) {
    80001570:	ff010113          	addi	sp,sp,-16
    80001574:	00113423          	sd	ra,8(sp)
    80001578:	00813023          	sd	s0,0(sp)
    8000157c:	01010413          	addi	s0,sp,16
    abiInvoker(THREAD_CREATE, handle, start_routine, arg);
    80001580:	00058613          	mv	a2,a1
    80001584:	00050593          	mv	a1,a0
    80001588:	01100513          	li	a0,17
    8000158c:	00000097          	auipc	ra,0x0
    80001590:	f08080e7          	jalr	-248(ra) # 80001494 <_Z10abiInvokeriz>
    uint64 ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    80001594:	00050513          	mv	a0,a0
    return (int) ret;
    80001598:	0005051b          	sext.w	a0,a0
}
    8000159c:	00813083          	ld	ra,8(sp)
    800015a0:	00013403          	ld	s0,0(sp)
    800015a4:	01010113          	addi	sp,sp,16
    800015a8:	00008067          	ret
    if (!handle) return -1;
    800015ac:	fff00513          	li	a0,-1
    800015b0:	00008067          	ret
    if (!start_routine) return -1;
    800015b4:	fff00513          	li	a0,-1
}
    800015b8:	00008067          	ret

00000000800015bc <_Z11thread_onlyPP7_threadPFvPvES2_>:

int thread_only (thread_t* handle, void(*start_routine)(void*), void* arg) {
    if (!handle) return -1;
    800015bc:	04050463          	beqz	a0,80001604 <_Z11thread_onlyPP7_threadPFvPvES2_+0x48>
    800015c0:	00060693          	mv	a3,a2
    if (!start_routine) return -1;
    800015c4:	04058463          	beqz	a1,8000160c <_Z11thread_onlyPP7_threadPFvPvES2_+0x50>
int thread_only (thread_t* handle, void(*start_routine)(void*), void* arg) {
    800015c8:	ff010113          	addi	sp,sp,-16
    800015cc:	00113423          	sd	ra,8(sp)
    800015d0:	00813023          	sd	s0,0(sp)
    800015d4:	01010413          	addi	s0,sp,16
    abiInvoker(THREAD_ONLY, handle, start_routine, arg);
    800015d8:	00058613          	mv	a2,a1
    800015dc:	00050593          	mv	a1,a0
    800015e0:	01600513          	li	a0,22
    800015e4:	00000097          	auipc	ra,0x0
    800015e8:	eb0080e7          	jalr	-336(ra) # 80001494 <_Z10abiInvokeriz>
    uint64 ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    800015ec:	00050513          	mv	a0,a0
    return (int) ret;
    800015f0:	0005051b          	sext.w	a0,a0
}
    800015f4:	00813083          	ld	ra,8(sp)
    800015f8:	00013403          	ld	s0,0(sp)
    800015fc:	01010113          	addi	sp,sp,16
    80001600:	00008067          	ret
    if (!handle) return -1;
    80001604:	fff00513          	li	a0,-1
    80001608:	00008067          	ret
    if (!start_routine) return -1;
    8000160c:	fff00513          	li	a0,-1
}
    80001610:	00008067          	ret

0000000080001614 <_Z12thread_startP7_thread>:

int thread_start(thread_t handle) {
    if (!handle) return -1;
    80001614:	02050e63          	beqz	a0,80001650 <_Z12thread_startP7_thread+0x3c>
int thread_start(thread_t handle) {
    80001618:	ff010113          	addi	sp,sp,-16
    8000161c:	00113423          	sd	ra,8(sp)
    80001620:	00813023          	sd	s0,0(sp)
    80001624:	01010413          	addi	s0,sp,16
    80001628:	00050593          	mv	a1,a0
    abiInvoker(THREAD_START, handle);
    8000162c:	01500513          	li	a0,21
    80001630:	00000097          	auipc	ra,0x0
    80001634:	e64080e7          	jalr	-412(ra) # 80001494 <_Z10abiInvokeriz>
    uint64 ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    80001638:	00050513          	mv	a0,a0
    return (int) ret;
    8000163c:	0005051b          	sext.w	a0,a0
}
    80001640:	00813083          	ld	ra,8(sp)
    80001644:	00013403          	ld	s0,0(sp)
    80001648:	01010113          	addi	sp,sp,16
    8000164c:	00008067          	ret
    if (!handle) return -1;
    80001650:	fff00513          	li	a0,-1
}
    80001654:	00008067          	ret

0000000080001658 <_Z11thread_exitv>:

int thread_exit() {
    80001658:	ff010113          	addi	sp,sp,-16
    8000165c:	00113423          	sd	ra,8(sp)
    80001660:	00813023          	sd	s0,0(sp)
    80001664:	01010413          	addi	s0,sp,16
    abiInvoker(THREAD_EXIT);
    80001668:	01200513          	li	a0,18
    8000166c:	00000097          	auipc	ra,0x0
    80001670:	e28080e7          	jalr	-472(ra) # 80001494 <_Z10abiInvokeriz>
    uint64 ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    80001674:	00050513          	mv	a0,a0
    return (int) ret;
}
    80001678:	0005051b          	sext.w	a0,a0
    8000167c:	00813083          	ld	ra,8(sp)
    80001680:	00013403          	ld	s0,0(sp)
    80001684:	01010113          	addi	sp,sp,16
    80001688:	00008067          	ret

000000008000168c <_Z15thread_dispatchv>:

void thread_dispatch () {
    8000168c:	ff010113          	addi	sp,sp,-16
    80001690:	00113423          	sd	ra,8(sp)
    80001694:	00813023          	sd	s0,0(sp)
    80001698:	01010413          	addi	s0,sp,16
    abiInvoker(THREAD_DISPATCH);
    8000169c:	01300513          	li	a0,19
    800016a0:	00000097          	auipc	ra,0x0
    800016a4:	df4080e7          	jalr	-524(ra) # 80001494 <_Z10abiInvokeriz>
}
    800016a8:	00813083          	ld	ra,8(sp)
    800016ac:	00013403          	ld	s0,0(sp)
    800016b0:	01010113          	addi	sp,sp,16
    800016b4:	00008067          	ret

00000000800016b8 <_Z11thread_joinP7_thread>:

void thread_join (thread_t handle) {
    if (!handle) return;
    800016b8:	02050a63          	beqz	a0,800016ec <_Z11thread_joinP7_thread+0x34>
void thread_join (thread_t handle) {
    800016bc:	ff010113          	addi	sp,sp,-16
    800016c0:	00113423          	sd	ra,8(sp)
    800016c4:	00813023          	sd	s0,0(sp)
    800016c8:	01010413          	addi	s0,sp,16
    800016cc:	00050593          	mv	a1,a0
    abiInvoker(THREAD_JOIN, handle);
    800016d0:	01400513          	li	a0,20
    800016d4:	00000097          	auipc	ra,0x0
    800016d8:	dc0080e7          	jalr	-576(ra) # 80001494 <_Z10abiInvokeriz>
}
    800016dc:	00813083          	ld	ra,8(sp)
    800016e0:	00013403          	ld	s0,0(sp)
    800016e4:	01010113          	addi	sp,sp,16
    800016e8:	00008067          	ret
    800016ec:	00008067          	ret

00000000800016f0 <_Z8sem_openPP4_semj>:

int sem_open (sem_t* handle, unsigned init) {
    if (!handle) return -1;
    800016f0:	04050063          	beqz	a0,80001730 <_Z8sem_openPP4_semj+0x40>
int sem_open (sem_t* handle, unsigned init) {
    800016f4:	ff010113          	addi	sp,sp,-16
    800016f8:	00113423          	sd	ra,8(sp)
    800016fc:	00813023          	sd	s0,0(sp)
    80001700:	01010413          	addi	s0,sp,16
    80001704:	00058613          	mv	a2,a1
    abiInvoker(SEM_OPEN, handle, init);
    80001708:	00050593          	mv	a1,a0
    8000170c:	02100513          	li	a0,33
    80001710:	00000097          	auipc	ra,0x0
    80001714:	d84080e7          	jalr	-636(ra) # 80001494 <_Z10abiInvokeriz>
    uint64 ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    80001718:	00050513          	mv	a0,a0
    return (int) ret;
    8000171c:	0005051b          	sext.w	a0,a0
}
    80001720:	00813083          	ld	ra,8(sp)
    80001724:	00013403          	ld	s0,0(sp)
    80001728:	01010113          	addi	sp,sp,16
    8000172c:	00008067          	ret
    if (!handle) return -1;
    80001730:	fff00513          	li	a0,-1
}
    80001734:	00008067          	ret

0000000080001738 <_Z9sem_closeP4_sem>:

int sem_close (sem_t handle) {
    if (!handle) return -1;
    80001738:	02050e63          	beqz	a0,80001774 <_Z9sem_closeP4_sem+0x3c>
int sem_close (sem_t handle) {
    8000173c:	ff010113          	addi	sp,sp,-16
    80001740:	00113423          	sd	ra,8(sp)
    80001744:	00813023          	sd	s0,0(sp)
    80001748:	01010413          	addi	s0,sp,16
    8000174c:	00050593          	mv	a1,a0
    abiInvoker(SEM_CLOSE, handle);
    80001750:	02200513          	li	a0,34
    80001754:	00000097          	auipc	ra,0x0
    80001758:	d40080e7          	jalr	-704(ra) # 80001494 <_Z10abiInvokeriz>
    uint64 ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    8000175c:	00050513          	mv	a0,a0
    return (int) ret;
    80001760:	0005051b          	sext.w	a0,a0
}
    80001764:	00813083          	ld	ra,8(sp)
    80001768:	00013403          	ld	s0,0(sp)
    8000176c:	01010113          	addi	sp,sp,16
    80001770:	00008067          	ret
    if (!handle) return -1;
    80001774:	fff00513          	li	a0,-1
}
    80001778:	00008067          	ret

000000008000177c <_Z8sem_waitP4_sem>:

int sem_wait (sem_t id) {
    if (!id) return -1;
    8000177c:	02050e63          	beqz	a0,800017b8 <_Z8sem_waitP4_sem+0x3c>
int sem_wait (sem_t id) {
    80001780:	ff010113          	addi	sp,sp,-16
    80001784:	00113423          	sd	ra,8(sp)
    80001788:	00813023          	sd	s0,0(sp)
    8000178c:	01010413          	addi	s0,sp,16
    80001790:	00050593          	mv	a1,a0
    abiInvoker(SEM_WAIT, id);
    80001794:	02300513          	li	a0,35
    80001798:	00000097          	auipc	ra,0x0
    8000179c:	cfc080e7          	jalr	-772(ra) # 80001494 <_Z10abiInvokeriz>
    uint64 ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    800017a0:	00050513          	mv	a0,a0
    return (int) ret;
    800017a4:	0005051b          	sext.w	a0,a0
}
    800017a8:	00813083          	ld	ra,8(sp)
    800017ac:	00013403          	ld	s0,0(sp)
    800017b0:	01010113          	addi	sp,sp,16
    800017b4:	00008067          	ret
    if (!id) return -1;
    800017b8:	fff00513          	li	a0,-1
}
    800017bc:	00008067          	ret

00000000800017c0 <_Z10sem_signalP4_sem>:

int sem_signal (sem_t id) {
    if (!id) return -1;
    800017c0:	02050e63          	beqz	a0,800017fc <_Z10sem_signalP4_sem+0x3c>
int sem_signal (sem_t id) {
    800017c4:	ff010113          	addi	sp,sp,-16
    800017c8:	00113423          	sd	ra,8(sp)
    800017cc:	00813023          	sd	s0,0(sp)
    800017d0:	01010413          	addi	s0,sp,16
    800017d4:	00050593          	mv	a1,a0
    abiInvoker(SEM_SIGNAL, id);
    800017d8:	02400513          	li	a0,36
    800017dc:	00000097          	auipc	ra,0x0
    800017e0:	cb8080e7          	jalr	-840(ra) # 80001494 <_Z10abiInvokeriz>
    uint64 ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    800017e4:	00050513          	mv	a0,a0
    return (int) ret;
    800017e8:	0005051b          	sext.w	a0,a0
}
    800017ec:	00813083          	ld	ra,8(sp)
    800017f0:	00013403          	ld	s0,0(sp)
    800017f4:	01010113          	addi	sp,sp,16
    800017f8:	00008067          	ret
    if (!id) return -1;
    800017fc:	fff00513          	li	a0,-1
}
    80001800:	00008067          	ret

0000000080001804 <_Z4getcv>:

char getc () {
    80001804:	ff010113          	addi	sp,sp,-16
    80001808:	00113423          	sd	ra,8(sp)
    8000180c:	00813023          	sd	s0,0(sp)
    80001810:	01010413          	addi	s0,sp,16
    abiInvoker(GET_C);
    80001814:	04100513          	li	a0,65
    80001818:	00000097          	auipc	ra,0x0
    8000181c:	c7c080e7          	jalr	-900(ra) # 80001494 <_Z10abiInvokeriz>
    uint64 ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    80001820:	00050513          	mv	a0,a0
    return (char) ret;
}
    80001824:	0ff57513          	andi	a0,a0,255
    80001828:	00813083          	ld	ra,8(sp)
    8000182c:	00013403          	ld	s0,0(sp)
    80001830:	01010113          	addi	sp,sp,16
    80001834:	00008067          	ret

0000000080001838 <_Z4putcc>:

void putc (char c) {
    if (!c) return;
    80001838:	00051463          	bnez	a0,80001840 <_Z4putcc+0x8>
    8000183c:	00008067          	ret
void putc (char c) {
    80001840:	ff010113          	addi	sp,sp,-16
    80001844:	00113423          	sd	ra,8(sp)
    80001848:	00813023          	sd	s0,0(sp)
    8000184c:	01010413          	addi	s0,sp,16
    abiInvoker(PUT_C, c);
    80001850:	00050593          	mv	a1,a0
    80001854:	04200513          	li	a0,66
    80001858:	00000097          	auipc	ra,0x0
    8000185c:	c3c080e7          	jalr	-964(ra) # 80001494 <_Z10abiInvokeriz>
    80001860:	00813083          	ld	ra,8(sp)
    80001864:	00013403          	ld	s0,0(sp)
    80001868:	01010113          	addi	sp,sp,16
    8000186c:	00008067          	ret

0000000080001870 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80001870:	fe010113          	addi	sp,sp,-32
    80001874:	00113c23          	sd	ra,24(sp)
    80001878:	00813823          	sd	s0,16(sp)
    8000187c:	00913423          	sd	s1,8(sp)
    80001880:	01213023          	sd	s2,0(sp)
    80001884:	02010413          	addi	s0,sp,32
    80001888:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    8000188c:	00000913          	li	s2,0
    80001890:	00c0006f          	j	8000189c <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x30) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80001894:	00000097          	auipc	ra,0x0
    80001898:	df8080e7          	jalr	-520(ra) # 8000168c <_Z15thread_dispatchv>
    while ((key = getc()) != 0x30) {
    8000189c:	00000097          	auipc	ra,0x0
    800018a0:	f68080e7          	jalr	-152(ra) # 80001804 <_Z4getcv>
    800018a4:	0005059b          	sext.w	a1,a0
    800018a8:	03000793          	li	a5,48
    800018ac:	02f58a63          	beq	a1,a5,800018e0 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    800018b0:	0084b503          	ld	a0,8(s1)
    800018b4:	00004097          	auipc	ra,0x4
    800018b8:	1ec080e7          	jalr	492(ra) # 80005aa0 <_ZN6Buffer3putEi>
        i++;
    800018bc:	0019071b          	addiw	a4,s2,1
    800018c0:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800018c4:	0004a683          	lw	a3,0(s1)
    800018c8:	0026979b          	slliw	a5,a3,0x2
    800018cc:	00d787bb          	addw	a5,a5,a3
    800018d0:	0017979b          	slliw	a5,a5,0x1
    800018d4:	02f767bb          	remw	a5,a4,a5
    800018d8:	fc0792e3          	bnez	a5,8000189c <_ZL16producerKeyboardPv+0x2c>
    800018dc:	fb9ff06f          	j	80001894 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    800018e0:	00100793          	li	a5,1
    800018e4:	00009717          	auipc	a4,0x9
    800018e8:	ccf72623          	sw	a5,-820(a4) # 8000a5b0 <_ZL9threadEnd>
    data->buffer->put('!');
    800018ec:	02100593          	li	a1,33
    800018f0:	0084b503          	ld	a0,8(s1)
    800018f4:	00004097          	auipc	ra,0x4
    800018f8:	1ac080e7          	jalr	428(ra) # 80005aa0 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    800018fc:	0104b503          	ld	a0,16(s1)
    80001900:	00000097          	auipc	ra,0x0
    80001904:	ec0080e7          	jalr	-320(ra) # 800017c0 <_Z10sem_signalP4_sem>
}
    80001908:	01813083          	ld	ra,24(sp)
    8000190c:	01013403          	ld	s0,16(sp)
    80001910:	00813483          	ld	s1,8(sp)
    80001914:	00013903          	ld	s2,0(sp)
    80001918:	02010113          	addi	sp,sp,32
    8000191c:	00008067          	ret

0000000080001920 <_ZL8producerPv>:

static void producer(void *arg) {
    80001920:	fe010113          	addi	sp,sp,-32
    80001924:	00113c23          	sd	ra,24(sp)
    80001928:	00813823          	sd	s0,16(sp)
    8000192c:	00913423          	sd	s1,8(sp)
    80001930:	01213023          	sd	s2,0(sp)
    80001934:	02010413          	addi	s0,sp,32
    80001938:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    8000193c:	00000913          	li	s2,0
    80001940:	00c0006f          	j	8000194c <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80001944:	00000097          	auipc	ra,0x0
    80001948:	d48080e7          	jalr	-696(ra) # 8000168c <_Z15thread_dispatchv>
    while (!threadEnd) {
    8000194c:	00009797          	auipc	a5,0x9
    80001950:	c647a783          	lw	a5,-924(a5) # 8000a5b0 <_ZL9threadEnd>
    80001954:	02079e63          	bnez	a5,80001990 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80001958:	0004a583          	lw	a1,0(s1)
    8000195c:	0305859b          	addiw	a1,a1,48
    80001960:	0084b503          	ld	a0,8(s1)
    80001964:	00004097          	auipc	ra,0x4
    80001968:	13c080e7          	jalr	316(ra) # 80005aa0 <_ZN6Buffer3putEi>
        i++;
    8000196c:	0019071b          	addiw	a4,s2,1
    80001970:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80001974:	0004a683          	lw	a3,0(s1)
    80001978:	0026979b          	slliw	a5,a3,0x2
    8000197c:	00d787bb          	addw	a5,a5,a3
    80001980:	0017979b          	slliw	a5,a5,0x1
    80001984:	02f767bb          	remw	a5,a4,a5
    80001988:	fc0792e3          	bnez	a5,8000194c <_ZL8producerPv+0x2c>
    8000198c:	fb9ff06f          	j	80001944 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80001990:	0104b503          	ld	a0,16(s1)
    80001994:	00000097          	auipc	ra,0x0
    80001998:	e2c080e7          	jalr	-468(ra) # 800017c0 <_Z10sem_signalP4_sem>
}
    8000199c:	01813083          	ld	ra,24(sp)
    800019a0:	01013403          	ld	s0,16(sp)
    800019a4:	00813483          	ld	s1,8(sp)
    800019a8:	00013903          	ld	s2,0(sp)
    800019ac:	02010113          	addi	sp,sp,32
    800019b0:	00008067          	ret

00000000800019b4 <_ZL8consumerPv>:

static void consumer(void *arg) {
    800019b4:	fd010113          	addi	sp,sp,-48
    800019b8:	02113423          	sd	ra,40(sp)
    800019bc:	02813023          	sd	s0,32(sp)
    800019c0:	00913c23          	sd	s1,24(sp)
    800019c4:	01213823          	sd	s2,16(sp)
    800019c8:	01313423          	sd	s3,8(sp)
    800019cc:	03010413          	addi	s0,sp,48
    800019d0:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800019d4:	00000993          	li	s3,0
    800019d8:	01c0006f          	j	800019f4 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    800019dc:	00000097          	auipc	ra,0x0
    800019e0:	cb0080e7          	jalr	-848(ra) # 8000168c <_Z15thread_dispatchv>
    800019e4:	0500006f          	j	80001a34 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    800019e8:	00a00513          	li	a0,10
    800019ec:	00000097          	auipc	ra,0x0
    800019f0:	e4c080e7          	jalr	-436(ra) # 80001838 <_Z4putcc>
    while (!threadEnd) {
    800019f4:	00009797          	auipc	a5,0x9
    800019f8:	bbc7a783          	lw	a5,-1092(a5) # 8000a5b0 <_ZL9threadEnd>
    800019fc:	06079063          	bnez	a5,80001a5c <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    80001a00:	00893503          	ld	a0,8(s2)
    80001a04:	00004097          	auipc	ra,0x4
    80001a08:	12c080e7          	jalr	300(ra) # 80005b30 <_ZN6Buffer3getEv>
        i++;
    80001a0c:	0019849b          	addiw	s1,s3,1
    80001a10:	0004899b          	sext.w	s3,s1
        putc(key);
    80001a14:	0ff57513          	andi	a0,a0,255
    80001a18:	00000097          	auipc	ra,0x0
    80001a1c:	e20080e7          	jalr	-480(ra) # 80001838 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80001a20:	00092703          	lw	a4,0(s2)
    80001a24:	0027179b          	slliw	a5,a4,0x2
    80001a28:	00e787bb          	addw	a5,a5,a4
    80001a2c:	02f4e7bb          	remw	a5,s1,a5
    80001a30:	fa0786e3          	beqz	a5,800019dc <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80001a34:	05000793          	li	a5,80
    80001a38:	02f4e4bb          	remw	s1,s1,a5
    80001a3c:	fa049ce3          	bnez	s1,800019f4 <_ZL8consumerPv+0x40>
    80001a40:	fa9ff06f          	j	800019e8 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80001a44:	00893503          	ld	a0,8(s2)
    80001a48:	00004097          	auipc	ra,0x4
    80001a4c:	0e8080e7          	jalr	232(ra) # 80005b30 <_ZN6Buffer3getEv>
        putc(key);
    80001a50:	0ff57513          	andi	a0,a0,255
    80001a54:	00000097          	auipc	ra,0x0
    80001a58:	de4080e7          	jalr	-540(ra) # 80001838 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80001a5c:	00893503          	ld	a0,8(s2)
    80001a60:	00004097          	auipc	ra,0x4
    80001a64:	15c080e7          	jalr	348(ra) # 80005bbc <_ZN6Buffer6getCntEv>
    80001a68:	fca04ee3          	bgtz	a0,80001a44 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80001a6c:	01093503          	ld	a0,16(s2)
    80001a70:	00000097          	auipc	ra,0x0
    80001a74:	d50080e7          	jalr	-688(ra) # 800017c0 <_Z10sem_signalP4_sem>
}
    80001a78:	02813083          	ld	ra,40(sp)
    80001a7c:	02013403          	ld	s0,32(sp)
    80001a80:	01813483          	ld	s1,24(sp)
    80001a84:	01013903          	ld	s2,16(sp)
    80001a88:	00813983          	ld	s3,8(sp)
    80001a8c:	03010113          	addi	sp,sp,48
    80001a90:	00008067          	ret

0000000080001a94 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80001a94:	f9010113          	addi	sp,sp,-112
    80001a98:	06113423          	sd	ra,104(sp)
    80001a9c:	06813023          	sd	s0,96(sp)
    80001aa0:	04913c23          	sd	s1,88(sp)
    80001aa4:	05213823          	sd	s2,80(sp)
    80001aa8:	05313423          	sd	s3,72(sp)
    80001aac:	05413023          	sd	s4,64(sp)
    80001ab0:	03513c23          	sd	s5,56(sp)
    80001ab4:	03613823          	sd	s6,48(sp)
    80001ab8:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80001abc:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80001ac0:	00006517          	auipc	a0,0x6
    80001ac4:	56050513          	addi	a0,a0,1376 # 80008020 <CONSOLE_STATUS+0x10>
    80001ac8:	00002097          	auipc	ra,0x2
    80001acc:	37c080e7          	jalr	892(ra) # 80003e44 <_Z11printStringPKc>
    getString(input, 30);
    80001ad0:	01e00593          	li	a1,30
    80001ad4:	fa040493          	addi	s1,s0,-96
    80001ad8:	00048513          	mv	a0,s1
    80001adc:	00002097          	auipc	ra,0x2
    80001ae0:	3f0080e7          	jalr	1008(ra) # 80003ecc <_Z9getStringPci>
    threadNum = stringToInt(input);
    80001ae4:	00048513          	mv	a0,s1
    80001ae8:	00002097          	auipc	ra,0x2
    80001aec:	4bc080e7          	jalr	1212(ra) # 80003fa4 <_Z11stringToIntPKc>
    80001af0:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80001af4:	00006517          	auipc	a0,0x6
    80001af8:	54c50513          	addi	a0,a0,1356 # 80008040 <CONSOLE_STATUS+0x30>
    80001afc:	00002097          	auipc	ra,0x2
    80001b00:	348080e7          	jalr	840(ra) # 80003e44 <_Z11printStringPKc>
    getString(input, 30);
    80001b04:	01e00593          	li	a1,30
    80001b08:	00048513          	mv	a0,s1
    80001b0c:	00002097          	auipc	ra,0x2
    80001b10:	3c0080e7          	jalr	960(ra) # 80003ecc <_Z9getStringPci>
    n = stringToInt(input);
    80001b14:	00048513          	mv	a0,s1
    80001b18:	00002097          	auipc	ra,0x2
    80001b1c:	48c080e7          	jalr	1164(ra) # 80003fa4 <_Z11stringToIntPKc>
    80001b20:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80001b24:	00006517          	auipc	a0,0x6
    80001b28:	53c50513          	addi	a0,a0,1340 # 80008060 <CONSOLE_STATUS+0x50>
    80001b2c:	00002097          	auipc	ra,0x2
    80001b30:	318080e7          	jalr	792(ra) # 80003e44 <_Z11printStringPKc>
    80001b34:	00000613          	li	a2,0
    80001b38:	00a00593          	li	a1,10
    80001b3c:	00090513          	mv	a0,s2
    80001b40:	00002097          	auipc	ra,0x2
    80001b44:	4b4080e7          	jalr	1204(ra) # 80003ff4 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80001b48:	00006517          	auipc	a0,0x6
    80001b4c:	53050513          	addi	a0,a0,1328 # 80008078 <CONSOLE_STATUS+0x68>
    80001b50:	00002097          	auipc	ra,0x2
    80001b54:	2f4080e7          	jalr	756(ra) # 80003e44 <_Z11printStringPKc>
    80001b58:	00000613          	li	a2,0
    80001b5c:	00a00593          	li	a1,10
    80001b60:	00048513          	mv	a0,s1
    80001b64:	00002097          	auipc	ra,0x2
    80001b68:	490080e7          	jalr	1168(ra) # 80003ff4 <_Z8printIntiii>
    printString(".\n");
    80001b6c:	00006517          	auipc	a0,0x6
    80001b70:	52450513          	addi	a0,a0,1316 # 80008090 <CONSOLE_STATUS+0x80>
    80001b74:	00002097          	auipc	ra,0x2
    80001b78:	2d0080e7          	jalr	720(ra) # 80003e44 <_Z11printStringPKc>
    if(threadNum > n) {
    80001b7c:	0324c463          	blt	s1,s2,80001ba4 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80001b80:	03205c63          	blez	s2,80001bb8 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80001b84:	03800513          	li	a0,56
    80001b88:	00003097          	auipc	ra,0x3
    80001b8c:	d80080e7          	jalr	-640(ra) # 80004908 <_Znwm>
    80001b90:	00050a13          	mv	s4,a0
    80001b94:	00048593          	mv	a1,s1
    80001b98:	00004097          	auipc	ra,0x4
    80001b9c:	e6c080e7          	jalr	-404(ra) # 80005a04 <_ZN6BufferC1Ei>
    80001ba0:	0300006f          	j	80001bd0 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80001ba4:	00006517          	auipc	a0,0x6
    80001ba8:	4f450513          	addi	a0,a0,1268 # 80008098 <CONSOLE_STATUS+0x88>
    80001bac:	00002097          	auipc	ra,0x2
    80001bb0:	298080e7          	jalr	664(ra) # 80003e44 <_Z11printStringPKc>
        return;
    80001bb4:	0140006f          	j	80001bc8 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80001bb8:	00006517          	auipc	a0,0x6
    80001bbc:	52050513          	addi	a0,a0,1312 # 800080d8 <CONSOLE_STATUS+0xc8>
    80001bc0:	00002097          	auipc	ra,0x2
    80001bc4:	284080e7          	jalr	644(ra) # 80003e44 <_Z11printStringPKc>
        return;
    80001bc8:	000b0113          	mv	sp,s6
    80001bcc:	1500006f          	j	80001d1c <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80001bd0:	00000593          	li	a1,0
    80001bd4:	00009517          	auipc	a0,0x9
    80001bd8:	9e450513          	addi	a0,a0,-1564 # 8000a5b8 <_ZL10waitForAll>
    80001bdc:	00000097          	auipc	ra,0x0
    80001be0:	b14080e7          	jalr	-1260(ra) # 800016f0 <_Z8sem_openPP4_semj>
    thread_t threads[threadNum];
    80001be4:	00391793          	slli	a5,s2,0x3
    80001be8:	00f78793          	addi	a5,a5,15
    80001bec:	ff07f793          	andi	a5,a5,-16
    80001bf0:	40f10133          	sub	sp,sp,a5
    80001bf4:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80001bf8:	0019071b          	addiw	a4,s2,1
    80001bfc:	00171793          	slli	a5,a4,0x1
    80001c00:	00e787b3          	add	a5,a5,a4
    80001c04:	00379793          	slli	a5,a5,0x3
    80001c08:	00f78793          	addi	a5,a5,15
    80001c0c:	ff07f793          	andi	a5,a5,-16
    80001c10:	40f10133          	sub	sp,sp,a5
    80001c14:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80001c18:	00191613          	slli	a2,s2,0x1
    80001c1c:	012607b3          	add	a5,a2,s2
    80001c20:	00379793          	slli	a5,a5,0x3
    80001c24:	00f987b3          	add	a5,s3,a5
    80001c28:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80001c2c:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80001c30:	00009717          	auipc	a4,0x9
    80001c34:	98873703          	ld	a4,-1656(a4) # 8000a5b8 <_ZL10waitForAll>
    80001c38:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80001c3c:	00078613          	mv	a2,a5
    80001c40:	00000597          	auipc	a1,0x0
    80001c44:	d7458593          	addi	a1,a1,-652 # 800019b4 <_ZL8consumerPv>
    80001c48:	f9840513          	addi	a0,s0,-104
    80001c4c:	00000097          	auipc	ra,0x0
    80001c50:	918080e7          	jalr	-1768(ra) # 80001564 <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80001c54:	00000493          	li	s1,0
    80001c58:	0280006f          	j	80001c80 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80001c5c:	00000597          	auipc	a1,0x0
    80001c60:	c1458593          	addi	a1,a1,-1004 # 80001870 <_ZL16producerKeyboardPv>
                      data + i);
    80001c64:	00179613          	slli	a2,a5,0x1
    80001c68:	00f60633          	add	a2,a2,a5
    80001c6c:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80001c70:	00c98633          	add	a2,s3,a2
    80001c74:	00000097          	auipc	ra,0x0
    80001c78:	8f0080e7          	jalr	-1808(ra) # 80001564 <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80001c7c:	0014849b          	addiw	s1,s1,1
    80001c80:	0524d263          	bge	s1,s2,80001cc4 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80001c84:	00149793          	slli	a5,s1,0x1
    80001c88:	009787b3          	add	a5,a5,s1
    80001c8c:	00379793          	slli	a5,a5,0x3
    80001c90:	00f987b3          	add	a5,s3,a5
    80001c94:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80001c98:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80001c9c:	00009717          	auipc	a4,0x9
    80001ca0:	91c73703          	ld	a4,-1764(a4) # 8000a5b8 <_ZL10waitForAll>
    80001ca4:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80001ca8:	00048793          	mv	a5,s1
    80001cac:	00349513          	slli	a0,s1,0x3
    80001cb0:	00aa8533          	add	a0,s5,a0
    80001cb4:	fa9054e3          	blez	s1,80001c5c <_Z22producerConsumer_C_APIv+0x1c8>
    80001cb8:	00000597          	auipc	a1,0x0
    80001cbc:	c6858593          	addi	a1,a1,-920 # 80001920 <_ZL8producerPv>
    80001cc0:	fa5ff06f          	j	80001c64 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80001cc4:	00000097          	auipc	ra,0x0
    80001cc8:	9c8080e7          	jalr	-1592(ra) # 8000168c <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80001ccc:	00000493          	li	s1,0
    80001cd0:	00994e63          	blt	s2,s1,80001cec <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80001cd4:	00009517          	auipc	a0,0x9
    80001cd8:	8e453503          	ld	a0,-1820(a0) # 8000a5b8 <_ZL10waitForAll>
    80001cdc:	00000097          	auipc	ra,0x0
    80001ce0:	aa0080e7          	jalr	-1376(ra) # 8000177c <_Z8sem_waitP4_sem>
    for (int i = 0; i <= threadNum; i++) {
    80001ce4:	0014849b          	addiw	s1,s1,1
    80001ce8:	fe9ff06f          	j	80001cd0 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80001cec:	00009517          	auipc	a0,0x9
    80001cf0:	8cc53503          	ld	a0,-1844(a0) # 8000a5b8 <_ZL10waitForAll>
    80001cf4:	00000097          	auipc	ra,0x0
    80001cf8:	a44080e7          	jalr	-1468(ra) # 80001738 <_Z9sem_closeP4_sem>
    delete buffer;
    80001cfc:	000a0e63          	beqz	s4,80001d18 <_Z22producerConsumer_C_APIv+0x284>
    80001d00:	000a0513          	mv	a0,s4
    80001d04:	00004097          	auipc	ra,0x4
    80001d08:	f40080e7          	jalr	-192(ra) # 80005c44 <_ZN6BufferD1Ev>
    80001d0c:	000a0513          	mv	a0,s4
    80001d10:	00003097          	auipc	ra,0x3
    80001d14:	c48080e7          	jalr	-952(ra) # 80004958 <_ZdlPv>
    80001d18:	000b0113          	mv	sp,s6

}
    80001d1c:	f9040113          	addi	sp,s0,-112
    80001d20:	06813083          	ld	ra,104(sp)
    80001d24:	06013403          	ld	s0,96(sp)
    80001d28:	05813483          	ld	s1,88(sp)
    80001d2c:	05013903          	ld	s2,80(sp)
    80001d30:	04813983          	ld	s3,72(sp)
    80001d34:	04013a03          	ld	s4,64(sp)
    80001d38:	03813a83          	ld	s5,56(sp)
    80001d3c:	03013b03          	ld	s6,48(sp)
    80001d40:	07010113          	addi	sp,sp,112
    80001d44:	00008067          	ret
    80001d48:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80001d4c:	000a0513          	mv	a0,s4
    80001d50:	00003097          	auipc	ra,0x3
    80001d54:	c08080e7          	jalr	-1016(ra) # 80004958 <_ZdlPv>
    80001d58:	00048513          	mv	a0,s1
    80001d5c:	0000a097          	auipc	ra,0xa
    80001d60:	98c080e7          	jalr	-1652(ra) # 8000b6e8 <_Unwind_Resume>

0000000080001d64 <_ZN7_thread5startEv>:
    void setFinished(bool f) {
        _thread::finished = f;
    }

    bool hasStarted() const {
        return started;
    80001d64:	02954783          	lbu	a5,41(a0)
_thread *_thread::createProcess(Body body, void* args){
    return new _thread(body, args);
}

int _thread::start() {
    if (!this->hasStarted()) {
    80001d68:	02079c63          	bnez	a5,80001da0 <_ZN7_thread5startEv+0x3c>
int _thread::start() {
    80001d6c:	ff010113          	addi	sp,sp,-16
    80001d70:	00113423          	sd	ra,8(sp)
    80001d74:	00813023          	sd	s0,0(sp)
    80001d78:	01010413          	addi	s0,sp,16
    }

    void setStarted(bool s) {
        _thread::started = s;
    80001d7c:	00100793          	li	a5,1
    80001d80:	02f504a3          	sb	a5,41(a0)
        this->setStarted(true);
        Scheduler::put(this);
    80001d84:	00003097          	auipc	ra,0x3
    80001d88:	940080e7          	jalr	-1728(ra) # 800046c4 <_ZN9Scheduler3putEP7_thread>
        return 0;
    80001d8c:	00000513          	li	a0,0
    }
    return -1;
}
    80001d90:	00813083          	ld	ra,8(sp)
    80001d94:	00013403          	ld	s0,0(sp)
    80001d98:	01010113          	addi	sp,sp,16
    80001d9c:	00008067          	ret
    return -1;
    80001da0:	fff00513          	li	a0,-1
}
    80001da4:	00008067          	ret

0000000080001da8 <_ZN7_thread4exitEv>:

int _thread::exit() {
    80001da8:	ff010113          	addi	sp,sp,-16
    80001dac:	00113423          	sd	ra,8(sp)
    80001db0:	00813023          	sd	s0,0(sp)
    80001db4:	01010413          	addi	s0,sp,16
        _thread::finished = f;
    80001db8:	00009797          	auipc	a5,0x9
    80001dbc:	8087b783          	ld	a5,-2040(a5) # 8000a5c0 <_ZN7_thread7runningE>
    80001dc0:	00100713          	li	a4,1
    80001dc4:	02e78423          	sb	a4,40(a5)
    running->setFinished(true);
    thread_dispatch();
    80001dc8:	00000097          	auipc	ra,0x0
    80001dcc:	8c4080e7          	jalr	-1852(ra) # 8000168c <_Z15thread_dispatchv>
    return 0;
}
    80001dd0:	00000513          	li	a0,0
    80001dd4:	00813083          	ld	ra,8(sp)
    80001dd8:	00013403          	ld	s0,0(sp)
    80001ddc:	01010113          	addi	sp,sp,16
    80001de0:	00008067          	ret

0000000080001de4 <_ZN7_thread13threadWrapperEv>:
    running = Scheduler::get();
    abiInvoker(0);
    _thread::contextSwitch(&old->context, &running->context);
}

void _thread::threadWrapper() {
    80001de4:	ff010113          	addi	sp,sp,-16
    80001de8:	00113423          	sd	ra,8(sp)
    80001dec:	00813023          	sd	s0,0(sp)
    80001df0:	01010413          	addi	s0,sp,16
    Riscv::popSppSpie();
    80001df4:	00003097          	auipc	ra,0x3
    80001df8:	bb4080e7          	jalr	-1100(ra) # 800049a8 <_ZN5Riscv10popSppSpieEv>
    running->body(running->arg);
    80001dfc:	00008797          	auipc	a5,0x8
    80001e00:	7c47b783          	ld	a5,1988(a5) # 8000a5c0 <_ZN7_thread7runningE>
    80001e04:	0007b703          	ld	a4,0(a5)
    80001e08:	0087b503          	ld	a0,8(a5)
    80001e0c:	000700e7          	jalr	a4
    _thread::exit();
    80001e10:	00000097          	auipc	ra,0x0
    80001e14:	f98080e7          	jalr	-104(ra) # 80001da8 <_ZN7_thread4exitEv>
}
    80001e18:	00813083          	ld	ra,8(sp)
    80001e1c:	00013403          	ld	s0,0(sp)
    80001e20:	01010113          	addi	sp,sp,16
    80001e24:	00008067          	ret

0000000080001e28 <_ZN7_thread8dispatchEv>:
void _thread::dispatch() {
    80001e28:	fe010113          	addi	sp,sp,-32
    80001e2c:	00113c23          	sd	ra,24(sp)
    80001e30:	00813823          	sd	s0,16(sp)
    80001e34:	00913423          	sd	s1,8(sp)
    80001e38:	01213023          	sd	s2,0(sp)
    80001e3c:	02010413          	addi	s0,sp,32
    _thread *old = running;
    80001e40:	00008497          	auipc	s1,0x8
    80001e44:	7804b483          	ld	s1,1920(s1) # 8000a5c0 <_ZN7_thread7runningE>
    if (!old->finished && !old->blocked) {
    80001e48:	0284c783          	lbu	a5,40(s1)
    80001e4c:	00079663          	bnez	a5,80001e58 <_ZN7_thread8dispatchEv+0x30>
    80001e50:	02b4c783          	lbu	a5,43(s1)
    80001e54:	04078863          	beqz	a5,80001ea4 <_ZN7_thread8dispatchEv+0x7c>
    running = Scheduler::get();
    80001e58:	00003097          	auipc	ra,0x3
    80001e5c:	83c080e7          	jalr	-1988(ra) # 80004694 <_ZN9Scheduler3getEv>
    80001e60:	00008917          	auipc	s2,0x8
    80001e64:	76090913          	addi	s2,s2,1888 # 8000a5c0 <_ZN7_thread7runningE>
    80001e68:	00a93023          	sd	a0,0(s2)
    abiInvoker(0);
    80001e6c:	00000513          	li	a0,0
    80001e70:	fffff097          	auipc	ra,0xfffff
    80001e74:	624080e7          	jalr	1572(ra) # 80001494 <_Z10abiInvokeriz>
    _thread::contextSwitch(&old->context, &running->context);
    80001e78:	00093583          	ld	a1,0(s2)
    80001e7c:	01858593          	addi	a1,a1,24
    80001e80:	01848513          	addi	a0,s1,24
    80001e84:	fffff097          	auipc	ra,0xfffff
    80001e88:	5fc080e7          	jalr	1532(ra) # 80001480 <_ZN7_thread13contextSwitchEPNS_7ContextES1_>
}
    80001e8c:	01813083          	ld	ra,24(sp)
    80001e90:	01013403          	ld	s0,16(sp)
    80001e94:	00813483          	ld	s1,8(sp)
    80001e98:	00013903          	ld	s2,0(sp)
    80001e9c:	02010113          	addi	sp,sp,32
    80001ea0:	00008067          	ret
        Scheduler::put(old);
    80001ea4:	00048513          	mv	a0,s1
    80001ea8:	00003097          	auipc	ra,0x3
    80001eac:	81c080e7          	jalr	-2020(ra) # 800046c4 <_ZN9Scheduler3putEP7_thread>
    80001eb0:	fa9ff06f          	j	80001e58 <_ZN7_thread8dispatchEv+0x30>

0000000080001eb4 <_ZN7_thread5yieldEv>:
void _thread::yield() {
    80001eb4:	ff010113          	addi	sp,sp,-16
    80001eb8:	00113423          	sd	ra,8(sp)
    80001ebc:	00813023          	sd	s0,0(sp)
    80001ec0:	01010413          	addi	s0,sp,16
    dispatch();
    80001ec4:	00000097          	auipc	ra,0x0
    80001ec8:	f64080e7          	jalr	-156(ra) # 80001e28 <_ZN7_thread8dispatchEv>
}
    80001ecc:	00813083          	ld	ra,8(sp)
    80001ed0:	00013403          	ld	s0,0(sp)
    80001ed4:	01010113          	addi	sp,sp,16
    80001ed8:	00008067          	ret

0000000080001edc <_ZN7_threadnwEm>:

void *_thread::operator new(size_t size) {
    80001edc:	ff010113          	addi	sp,sp,-16
    80001ee0:	00113423          	sd	ra,8(sp)
    80001ee4:	00813023          	sd	s0,0(sp)
    80001ee8:	01010413          	addi	s0,sp,16
    return MemoryAllocator::mem_alloc(size);
    80001eec:	00004097          	auipc	ra,0x4
    80001ef0:	858080e7          	jalr	-1960(ra) # 80005744 <_ZN15MemoryAllocator9mem_allocEm>
}
    80001ef4:	00813083          	ld	ra,8(sp)
    80001ef8:	00013403          	ld	s0,0(sp)
    80001efc:	01010113          	addi	sp,sp,16
    80001f00:	00008067          	ret

0000000080001f04 <_ZN7_threadnaEm>:

void *_thread::operator new[](size_t size) {
    80001f04:	ff010113          	addi	sp,sp,-16
    80001f08:	00113423          	sd	ra,8(sp)
    80001f0c:	00813023          	sd	s0,0(sp)
    80001f10:	01010413          	addi	s0,sp,16
    return MemoryAllocator::mem_alloc(size);
    80001f14:	00004097          	auipc	ra,0x4
    80001f18:	830080e7          	jalr	-2000(ra) # 80005744 <_ZN15MemoryAllocator9mem_allocEm>
}
    80001f1c:	00813083          	ld	ra,8(sp)
    80001f20:	00013403          	ld	s0,0(sp)
    80001f24:	01010113          	addi	sp,sp,16
    80001f28:	00008067          	ret

0000000080001f2c <_ZN7_threaddlEPv>:

void _thread::operator delete(void *ptr) {
    80001f2c:	ff010113          	addi	sp,sp,-16
    80001f30:	00113423          	sd	ra,8(sp)
    80001f34:	00813023          	sd	s0,0(sp)
    80001f38:	01010413          	addi	s0,sp,16
    MemoryAllocator::mem_free(ptr);
    80001f3c:	00004097          	auipc	ra,0x4
    80001f40:	96c080e7          	jalr	-1684(ra) # 800058a8 <_ZN15MemoryAllocator8mem_freeEPv>
}
    80001f44:	00813083          	ld	ra,8(sp)
    80001f48:	00013403          	ld	s0,0(sp)
    80001f4c:	01010113          	addi	sp,sp,16
    80001f50:	00008067          	ret

0000000080001f54 <_ZN7_threaddaEPv>:

void _thread::operator delete[](void *ptr) {
    80001f54:	ff010113          	addi	sp,sp,-16
    80001f58:	00113423          	sd	ra,8(sp)
    80001f5c:	00813023          	sd	s0,0(sp)
    80001f60:	01010413          	addi	s0,sp,16
    MemoryAllocator::mem_free(ptr);
    80001f64:	00004097          	auipc	ra,0x4
    80001f68:	944080e7          	jalr	-1724(ra) # 800058a8 <_ZN15MemoryAllocator8mem_freeEPv>
}
    80001f6c:	00813083          	ld	ra,8(sp)
    80001f70:	00013403          	ld	s0,0(sp)
    80001f74:	01010113          	addi	sp,sp,16
    80001f78:	00008067          	ret

0000000080001f7c <_ZN7_threadC1EPFvPvES0_>:

_thread::_thread(_thread::Body body, void *arg)
    80001f7c:	fe010113          	addi	sp,sp,-32
    80001f80:	00113c23          	sd	ra,24(sp)
    80001f84:	00813823          	sd	s0,16(sp)
    80001f88:	00913423          	sd	s1,8(sp)
    80001f8c:	01213023          	sd	s2,0(sp)
    80001f90:	02010413          	addi	s0,sp,32
    80001f94:	00050493          	mv	s1,a0
    80001f98:	00058913          	mv	s2,a1
    stack(body != nullptr ? (uint64*) MemoryAllocator::mem_alloc(sizeof(uint64) * DEFAULT_STACK_SIZE) : nullptr),
    context({
    body != nullptr ? (uint64) &threadWrapper: 0,
    stack != nullptr ? (uint64) &stack[DEFAULT_STACK_SIZE] : 0
    }),
    main(body == nullptr)
    80001f9c:	00b53023          	sd	a1,0(a0)
    80001fa0:	00c53423          	sd	a2,8(a0)
    stack(body != nullptr ? (uint64*) MemoryAllocator::mem_alloc(sizeof(uint64) * DEFAULT_STACK_SIZE) : nullptr),
    80001fa4:	06058063          	beqz	a1,80002004 <_ZN7_threadC1EPFvPvES0_+0x88>
    80001fa8:	00008537          	lui	a0,0x8
    80001fac:	00003097          	auipc	ra,0x3
    80001fb0:	798080e7          	jalr	1944(ra) # 80005744 <_ZN15MemoryAllocator9mem_allocEm>
    main(body == nullptr)
    80001fb4:	00a4b823          	sd	a0,16(s1)
    body != nullptr ? (uint64) &threadWrapper: 0,
    80001fb8:	04090a63          	beqz	s2,8000200c <_ZN7_threadC1EPFvPvES0_+0x90>
    80001fbc:	00000797          	auipc	a5,0x0
    80001fc0:	e2878793          	addi	a5,a5,-472 # 80001de4 <_ZN7_thread13threadWrapperEv>
    main(body == nullptr)
    80001fc4:	00f4bc23          	sd	a5,24(s1)
    stack != nullptr ? (uint64) &stack[DEFAULT_STACK_SIZE] : 0
    80001fc8:	04050663          	beqz	a0,80002014 <_ZN7_threadC1EPFvPvES0_+0x98>
    80001fcc:	000087b7          	lui	a5,0x8
    80001fd0:	00f50533          	add	a0,a0,a5
    main(body == nullptr)
    80001fd4:	02a4b023          	sd	a0,32(s1)
    80001fd8:	00193913          	seqz	s2,s2
    80001fdc:	03248523          	sb	s2,42(s1)
    {
        finished = false;
    80001fe0:	02048423          	sb	zero,40(s1)
        started = false;
    80001fe4:	020484a3          	sb	zero,41(s1)
        blocked = false;
    80001fe8:	020485a3          	sb	zero,43(s1)
    }
    80001fec:	01813083          	ld	ra,24(sp)
    80001ff0:	01013403          	ld	s0,16(sp)
    80001ff4:	00813483          	ld	s1,8(sp)
    80001ff8:	00013903          	ld	s2,0(sp)
    80001ffc:	02010113          	addi	sp,sp,32
    80002000:	00008067          	ret
    stack(body != nullptr ? (uint64*) MemoryAllocator::mem_alloc(sizeof(uint64) * DEFAULT_STACK_SIZE) : nullptr),
    80002004:	00000513          	li	a0,0
    80002008:	fadff06f          	j	80001fb4 <_ZN7_threadC1EPFvPvES0_+0x38>
    body != nullptr ? (uint64) &threadWrapper: 0,
    8000200c:	00000793          	li	a5,0
    80002010:	fb5ff06f          	j	80001fc4 <_ZN7_threadC1EPFvPvES0_+0x48>
    stack != nullptr ? (uint64) &stack[DEFAULT_STACK_SIZE] : 0
    80002014:	00000513          	li	a0,0
    80002018:	fbdff06f          	j	80001fd4 <_ZN7_threadC1EPFvPvES0_+0x58>

000000008000201c <_ZN7_thread13createProcessEPFvPvES0_>:
_thread *_thread::createProcess(Body body, void* args){
    8000201c:	fd010113          	addi	sp,sp,-48
    80002020:	02113423          	sd	ra,40(sp)
    80002024:	02813023          	sd	s0,32(sp)
    80002028:	00913c23          	sd	s1,24(sp)
    8000202c:	01213823          	sd	s2,16(sp)
    80002030:	01313423          	sd	s3,8(sp)
    80002034:	03010413          	addi	s0,sp,48
    80002038:	00050913          	mv	s2,a0
    8000203c:	00058993          	mv	s3,a1
    return new _thread(body, args);
    80002040:	03000513          	li	a0,48
    80002044:	00000097          	auipc	ra,0x0
    80002048:	e98080e7          	jalr	-360(ra) # 80001edc <_ZN7_threadnwEm>
    8000204c:	00050493          	mv	s1,a0
    80002050:	00098613          	mv	a2,s3
    80002054:	00090593          	mv	a1,s2
    80002058:	00000097          	auipc	ra,0x0
    8000205c:	f24080e7          	jalr	-220(ra) # 80001f7c <_ZN7_threadC1EPFvPvES0_>
    80002060:	0200006f          	j	80002080 <_ZN7_thread13createProcessEPFvPvES0_+0x64>
    80002064:	00050913          	mv	s2,a0
    80002068:	00048513          	mv	a0,s1
    8000206c:	00000097          	auipc	ra,0x0
    80002070:	ec0080e7          	jalr	-320(ra) # 80001f2c <_ZN7_threaddlEPv>
    80002074:	00090513          	mv	a0,s2
    80002078:	00009097          	auipc	ra,0x9
    8000207c:	670080e7          	jalr	1648(ra) # 8000b6e8 <_Unwind_Resume>
}
    80002080:	00048513          	mv	a0,s1
    80002084:	02813083          	ld	ra,40(sp)
    80002088:	02013403          	ld	s0,32(sp)
    8000208c:	01813483          	ld	s1,24(sp)
    80002090:	01013903          	ld	s2,16(sp)
    80002094:	00813983          	ld	s3,8(sp)
    80002098:	03010113          	addi	sp,sp,48
    8000209c:	00008067          	ret

00000000800020a0 <_ZNK7_thread6isMainEv>:

bool _thread::isMain() const {
    800020a0:	ff010113          	addi	sp,sp,-16
    800020a4:	00813423          	sd	s0,8(sp)
    800020a8:	01010413          	addi	s0,sp,16
    return main;
}
    800020ac:	02a54503          	lbu	a0,42(a0) # 802a <_entry-0x7fff7fd6>
    800020b0:	00813403          	ld	s0,8(sp)
    800020b4:	01010113          	addi	sp,sp,16
    800020b8:	00008067          	ret

00000000800020bc <_ZN7_thread7setMainEb>:

void _thread::setMain(bool m) {
    800020bc:	ff010113          	addi	sp,sp,-16
    800020c0:	00813423          	sd	s0,8(sp)
    800020c4:	01010413          	addi	s0,sp,16
    main = m;
    800020c8:	02b50523          	sb	a1,42(a0)
}
    800020cc:	00813403          	ld	s0,8(sp)
    800020d0:	01010113          	addi	sp,sp,16
    800020d4:	00008067          	ret

00000000800020d8 <_ZN7_thread10setBlockedEb>:

void _thread::setBlocked(bool b) {
    800020d8:	ff010113          	addi	sp,sp,-16
    800020dc:	00813423          	sd	s0,8(sp)
    800020e0:	01010413          	addi	s0,sp,16
    blocked = b;
    800020e4:	02b505a3          	sb	a1,43(a0)
}
    800020e8:	00813403          	ld	s0,8(sp)
    800020ec:	01010113          	addi	sp,sp,16
    800020f0:	00008067          	ret

00000000800020f4 <_ZNK7_thread9isBlockedEv>:

bool _thread::isBlocked() const {
    800020f4:	ff010113          	addi	sp,sp,-16
    800020f8:	00813423          	sd	s0,8(sp)
    800020fc:	01010413          	addi	s0,sp,16
    return blocked;
}
    80002100:	02b54503          	lbu	a0,43(a0)
    80002104:	00813403          	ld	s0,8(sp)
    80002108:	01010113          	addi	sp,sp,16
    8000210c:	00008067          	ret

0000000080002110 <_ZN7_thread4joinEPS_>:

void _thread::join(_thread* t) {
    80002110:	fe010113          	addi	sp,sp,-32
    80002114:	00113c23          	sd	ra,24(sp)
    80002118:	00813823          	sd	s0,16(sp)
    8000211c:	00913423          	sd	s1,8(sp)
    80002120:	02010413          	addi	s0,sp,32
    80002124:	00050493          	mv	s1,a0
        return finished;
    80002128:	0284c783          	lbu	a5,40(s1)
    while(!t->isFinished()) {
    8000212c:	00079863          	bnez	a5,8000213c <_ZN7_thread4joinEPS_+0x2c>
        dispatch();
    80002130:	00000097          	auipc	ra,0x0
    80002134:	cf8080e7          	jalr	-776(ra) # 80001e28 <_ZN7_thread8dispatchEv>
    while(!t->isFinished()) {
    80002138:	ff1ff06f          	j	80002128 <_ZN7_thread4joinEPS_+0x18>
    }
}
    8000213c:	01813083          	ld	ra,24(sp)
    80002140:	01013403          	ld	s0,16(sp)
    80002144:	00813483          	ld	s1,8(sp)
    80002148:	02010113          	addi	sp,sp,32
    8000214c:	00008067          	ret

0000000080002150 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    80002150:	ff010113          	addi	sp,sp,-16
    80002154:	00113423          	sd	ra,8(sp)
    80002158:	00813023          	sd	s0,0(sp)
    8000215c:	01010413          	addi	s0,sp,16
    80002160:	00008797          	auipc	a5,0x8
    80002164:	26878793          	addi	a5,a5,616 # 8000a3c8 <_ZTV9Semaphore+0x10>
    80002168:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    8000216c:	00853503          	ld	a0,8(a0)
    80002170:	fffff097          	auipc	ra,0xfffff
    80002174:	5c8080e7          	jalr	1480(ra) # 80001738 <_Z9sem_closeP4_sem>
}
    80002178:	00813083          	ld	ra,8(sp)
    8000217c:	00013403          	ld	s0,0(sp)
    80002180:	01010113          	addi	sp,sp,16
    80002184:	00008067          	ret

0000000080002188 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80002188:	fe010113          	addi	sp,sp,-32
    8000218c:	00113c23          	sd	ra,24(sp)
    80002190:	00813823          	sd	s0,16(sp)
    80002194:	00913423          	sd	s1,8(sp)
    80002198:	02010413          	addi	s0,sp,32
    8000219c:	00050493          	mv	s1,a0
}
    800021a0:	00000097          	auipc	ra,0x0
    800021a4:	fb0080e7          	jalr	-80(ra) # 80002150 <_ZN9SemaphoreD1Ev>
    800021a8:	00048513          	mv	a0,s1
    800021ac:	00002097          	auipc	ra,0x2
    800021b0:	7ac080e7          	jalr	1964(ra) # 80004958 <_ZdlPv>
    800021b4:	01813083          	ld	ra,24(sp)
    800021b8:	01013403          	ld	s0,16(sp)
    800021bc:	00813483          	ld	s1,8(sp)
    800021c0:	02010113          	addi	sp,sp,32
    800021c4:	00008067          	ret

00000000800021c8 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    800021c8:	ff010113          	addi	sp,sp,-16
    800021cc:	00113423          	sd	ra,8(sp)
    800021d0:	00813023          	sd	s0,0(sp)
    800021d4:	01010413          	addi	s0,sp,16
    800021d8:	00008797          	auipc	a5,0x8
    800021dc:	1f078793          	addi	a5,a5,496 # 8000a3c8 <_ZTV9Semaphore+0x10>
    800021e0:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle, init);
    800021e4:	00850513          	addi	a0,a0,8
    800021e8:	fffff097          	auipc	ra,0xfffff
    800021ec:	508080e7          	jalr	1288(ra) # 800016f0 <_Z8sem_openPP4_semj>
}
    800021f0:	00813083          	ld	ra,8(sp)
    800021f4:	00013403          	ld	s0,0(sp)
    800021f8:	01010113          	addi	sp,sp,16
    800021fc:	00008067          	ret

0000000080002200 <_ZN9Semaphore4waitEv>:

int Semaphore::wait() {
    80002200:	ff010113          	addi	sp,sp,-16
    80002204:	00113423          	sd	ra,8(sp)
    80002208:	00813023          	sd	s0,0(sp)
    8000220c:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    80002210:	00853503          	ld	a0,8(a0)
    80002214:	fffff097          	auipc	ra,0xfffff
    80002218:	568080e7          	jalr	1384(ra) # 8000177c <_Z8sem_waitP4_sem>
}
    8000221c:	00813083          	ld	ra,8(sp)
    80002220:	00013403          	ld	s0,0(sp)
    80002224:	01010113          	addi	sp,sp,16
    80002228:	00008067          	ret

000000008000222c <_ZN9Semaphore6signalEv>:

int Semaphore::signal() {
    8000222c:	ff010113          	addi	sp,sp,-16
    80002230:	00113423          	sd	ra,8(sp)
    80002234:	00813023          	sd	s0,0(sp)
    80002238:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    8000223c:	00853503          	ld	a0,8(a0)
    80002240:	fffff097          	auipc	ra,0xfffff
    80002244:	580080e7          	jalr	1408(ra) # 800017c0 <_Z10sem_signalP4_sem>
    80002248:	00813083          	ld	ra,8(sp)
    8000224c:	00013403          	ld	s0,0(sp)
    80002250:	01010113          	addi	sp,sp,16
    80002254:	00008067          	ret

0000000080002258 <_ZN4List8addFirstEP7_thread>:
//
// Created by Danilo on 6/2/23.
//
#include "../h/list.hpp"

void List::addFirst(_thread *data) {
    80002258:	fe010113          	addi	sp,sp,-32
    8000225c:	00113c23          	sd	ra,24(sp)
    80002260:	00813823          	sd	s0,16(sp)
    80002264:	00913423          	sd	s1,8(sp)
    80002268:	01213023          	sd	s2,0(sp)
    8000226c:	02010413          	addi	s0,sp,32
    80002270:	00050493          	mv	s1,a0
    80002274:	00058913          	mv	s2,a1
    Elem *elem = (Elem*) MemoryAllocator::mem_alloc(sizeof(Elem));
    80002278:	01000513          	li	a0,16
    8000227c:	00003097          	auipc	ra,0x3
    80002280:	4c8080e7          	jalr	1224(ra) # 80005744 <_ZN15MemoryAllocator9mem_allocEm>
    elem->data = data;
    80002284:	01253023          	sd	s2,0(a0)
    elem->next = head;
    80002288:	0004b783          	ld	a5,0(s1)
    8000228c:	00f53423          	sd	a5,8(a0)
    head = elem;
    80002290:	00a4b023          	sd	a0,0(s1)
    if(!tail) {
    80002294:	0084b783          	ld	a5,8(s1)
    80002298:	00078e63          	beqz	a5,800022b4 <_ZN4List8addFirstEP7_thread+0x5c>
        tail = head;
    }
}
    8000229c:	01813083          	ld	ra,24(sp)
    800022a0:	01013403          	ld	s0,16(sp)
    800022a4:	00813483          	ld	s1,8(sp)
    800022a8:	00013903          	ld	s2,0(sp)
    800022ac:	02010113          	addi	sp,sp,32
    800022b0:	00008067          	ret
        tail = head;
    800022b4:	00a4b423          	sd	a0,8(s1)
}
    800022b8:	fe5ff06f          	j	8000229c <_ZN4List8addFirstEP7_thread+0x44>

00000000800022bc <_ZN4List7addLastEP7_thread>:

void List::addLast(_thread *data) {
    800022bc:	fe010113          	addi	sp,sp,-32
    800022c0:	00113c23          	sd	ra,24(sp)
    800022c4:	00813823          	sd	s0,16(sp)
    800022c8:	00913423          	sd	s1,8(sp)
    800022cc:	01213023          	sd	s2,0(sp)
    800022d0:	02010413          	addi	s0,sp,32
    800022d4:	00050493          	mv	s1,a0
    800022d8:	00058913          	mv	s2,a1
    Elem *elem = (Elem*) MemoryAllocator::mem_alloc(sizeof(Elem));
    800022dc:	01000513          	li	a0,16
    800022e0:	00003097          	auipc	ra,0x3
    800022e4:	464080e7          	jalr	1124(ra) # 80005744 <_ZN15MemoryAllocator9mem_allocEm>
    elem->data = data;
    800022e8:	01253023          	sd	s2,0(a0)
    elem->next = nullptr;
    800022ec:	00053423          	sd	zero,8(a0)
    if(tail) {
    800022f0:	0084b783          	ld	a5,8(s1)
    800022f4:	02078263          	beqz	a5,80002318 <_ZN4List7addLastEP7_thread+0x5c>
        tail->next = elem;
    800022f8:	00a7b423          	sd	a0,8(a5)
        tail = elem;
    800022fc:	00a4b423          	sd	a0,8(s1)
    }
    else {
        head = tail = elem;
    }
}
    80002300:	01813083          	ld	ra,24(sp)
    80002304:	01013403          	ld	s0,16(sp)
    80002308:	00813483          	ld	s1,8(sp)
    8000230c:	00013903          	ld	s2,0(sp)
    80002310:	02010113          	addi	sp,sp,32
    80002314:	00008067          	ret
        head = tail = elem;
    80002318:	00a4b423          	sd	a0,8(s1)
    8000231c:	00a4b023          	sd	a0,0(s1)
}
    80002320:	fe1ff06f          	j	80002300 <_ZN4List7addLastEP7_thread+0x44>

0000000080002324 <_ZN4List11removeFirstEv>:

_thread *List::removeFirst() {
    80002324:	fe010113          	addi	sp,sp,-32
    80002328:	00113c23          	sd	ra,24(sp)
    8000232c:	00813823          	sd	s0,16(sp)
    80002330:	00913423          	sd	s1,8(sp)
    80002334:	02010413          	addi	s0,sp,32
    80002338:	00050793          	mv	a5,a0
    if(!head) {
    8000233c:	00053503          	ld	a0,0(a0)
    80002340:	02050e63          	beqz	a0,8000237c <_ZN4List11removeFirstEv+0x58>
        return 0;
    }
    Elem *elem = head;
    head = head->next;
    80002344:	00853703          	ld	a4,8(a0)
    80002348:	00e7b023          	sd	a4,0(a5)
    if(!head) {
    8000234c:	02070463          	beqz	a4,80002374 <_ZN4List11removeFirstEv+0x50>
        tail = 0;
    }
    _thread *ret = elem->data;
    80002350:	00053483          	ld	s1,0(a0)
    MemoryAllocator::mem_free(elem);
    80002354:	00003097          	auipc	ra,0x3
    80002358:	554080e7          	jalr	1364(ra) # 800058a8 <_ZN15MemoryAllocator8mem_freeEPv>
    return ret;
}
    8000235c:	00048513          	mv	a0,s1
    80002360:	01813083          	ld	ra,24(sp)
    80002364:	01013403          	ld	s0,16(sp)
    80002368:	00813483          	ld	s1,8(sp)
    8000236c:	02010113          	addi	sp,sp,32
    80002370:	00008067          	ret
        tail = 0;
    80002374:	0007b423          	sd	zero,8(a5)
    80002378:	fd9ff06f          	j	80002350 <_ZN4List11removeFirstEv+0x2c>
        return 0;
    8000237c:	00050493          	mv	s1,a0
    80002380:	fddff06f          	j	8000235c <_ZN4List11removeFirstEv+0x38>

0000000080002384 <_ZN4List9peekFirstEv>:

_thread *List::peekFirst() {
    80002384:	ff010113          	addi	sp,sp,-16
    80002388:	00813423          	sd	s0,8(sp)
    8000238c:	01010413          	addi	s0,sp,16
    if(!head) {
    80002390:	00053503          	ld	a0,0(a0)
    80002394:	00050463          	beqz	a0,8000239c <_ZN4List9peekFirstEv+0x18>
        return 0;
    }
    return head->data;
    80002398:	00053503          	ld	a0,0(a0)
}
    8000239c:	00813403          	ld	s0,8(sp)
    800023a0:	01010113          	addi	sp,sp,16
    800023a4:	00008067          	ret

00000000800023a8 <_ZN4List10removeLastEv>:

_thread *List::removeLast() {
    800023a8:	fe010113          	addi	sp,sp,-32
    800023ac:	00113c23          	sd	ra,24(sp)
    800023b0:	00813823          	sd	s0,16(sp)
    800023b4:	00913423          	sd	s1,8(sp)
    800023b8:	02010413          	addi	s0,sp,32
    if(!head) {
    800023bc:	00053483          	ld	s1,0(a0)
    800023c0:	04048063          	beqz	s1,80002400 <_ZN4List10removeLastEv+0x58>
    800023c4:	00050713          	mv	a4,a0
        return 0;
    }
    Elem *prev = 0;
    800023c8:	00000693          	li	a3,0
    for(Elem *curr = head; curr && curr != tail; curr = curr->next) {
    800023cc:	00048c63          	beqz	s1,800023e4 <_ZN4List10removeLastEv+0x3c>
    800023d0:	00873783          	ld	a5,8(a4)
    800023d4:	00978863          	beq	a5,s1,800023e4 <_ZN4List10removeLastEv+0x3c>
        prev = curr;
    800023d8:	00048693          	mv	a3,s1
    for(Elem *curr = head; curr && curr != tail; curr = curr->next) {
    800023dc:	0084b483          	ld	s1,8(s1)
    800023e0:	fedff06f          	j	800023cc <_ZN4List10removeLastEv+0x24>
    }
    Elem *elem = tail;
    800023e4:	00873503          	ld	a0,8(a4)
    if(prev) {
    800023e8:	02068863          	beqz	a3,80002418 <_ZN4List10removeLastEv+0x70>
        prev->next = 0;
    800023ec:	0006b423          	sd	zero,8(a3)
    }
    else {
        head = 0;
    }
    tail = prev;
    800023f0:	00d73423          	sd	a3,8(a4)

    _thread *ret = elem->data;
    800023f4:	00053483          	ld	s1,0(a0)
    MemoryAllocator::mem_free(elem);
    800023f8:	00003097          	auipc	ra,0x3
    800023fc:	4b0080e7          	jalr	1200(ra) # 800058a8 <_ZN15MemoryAllocator8mem_freeEPv>
    return ret;
}
    80002400:	00048513          	mv	a0,s1
    80002404:	01813083          	ld	ra,24(sp)
    80002408:	01013403          	ld	s0,16(sp)
    8000240c:	00813483          	ld	s1,8(sp)
    80002410:	02010113          	addi	sp,sp,32
    80002414:	00008067          	ret
        head = 0;
    80002418:	00073023          	sd	zero,0(a4)
    8000241c:	fd5ff06f          	j	800023f0 <_ZN4List10removeLastEv+0x48>

0000000080002420 <_ZN4List8peekLastEv>:

_thread *List::peekLast() {
    80002420:	ff010113          	addi	sp,sp,-16
    80002424:	00813423          	sd	s0,8(sp)
    80002428:	01010413          	addi	s0,sp,16
    if(!tail) {
    8000242c:	00853503          	ld	a0,8(a0)
    80002430:	00050463          	beqz	a0,80002438 <_ZN4List8peekLastEv+0x18>
        return 0;
    }
    return tail->data;
    80002434:	00053503          	ld	a0,0(a0)
}
    80002438:	00813403          	ld	s0,8(sp)
    8000243c:	01010113          	addi	sp,sp,16
    80002440:	00008067          	ret

0000000080002444 <_ZN4List4initEv>:

void List::init() {
    80002444:	ff010113          	addi	sp,sp,-16
    80002448:	00813423          	sd	s0,8(sp)
    8000244c:	01010413          	addi	s0,sp,16
    head = 0;
    80002450:	00053023          	sd	zero,0(a0)
    tail = 0;
    80002454:	00053423          	sd	zero,8(a0)
}
    80002458:	00813403          	ld	s0,8(sp)
    8000245c:	01010113          	addi	sp,sp,16
    80002460:	00008067          	ret

0000000080002464 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80002464:	fe010113          	addi	sp,sp,-32
    80002468:	00113c23          	sd	ra,24(sp)
    8000246c:	00813823          	sd	s0,16(sp)
    80002470:	00913423          	sd	s1,8(sp)
    80002474:	01213023          	sd	s2,0(sp)
    80002478:	02010413          	addi	s0,sp,32
    8000247c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80002480:	00100793          	li	a5,1
    80002484:	02a7f863          	bgeu	a5,a0,800024b4 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80002488:	00a00793          	li	a5,10
    8000248c:	02f577b3          	remu	a5,a0,a5
    80002490:	02078e63          	beqz	a5,800024cc <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80002494:	fff48513          	addi	a0,s1,-1
    80002498:	00000097          	auipc	ra,0x0
    8000249c:	fcc080e7          	jalr	-52(ra) # 80002464 <_ZL9fibonaccim>
    800024a0:	00050913          	mv	s2,a0
    800024a4:	ffe48513          	addi	a0,s1,-2
    800024a8:	00000097          	auipc	ra,0x0
    800024ac:	fbc080e7          	jalr	-68(ra) # 80002464 <_ZL9fibonaccim>
    800024b0:	00a90533          	add	a0,s2,a0
}
    800024b4:	01813083          	ld	ra,24(sp)
    800024b8:	01013403          	ld	s0,16(sp)
    800024bc:	00813483          	ld	s1,8(sp)
    800024c0:	00013903          	ld	s2,0(sp)
    800024c4:	02010113          	addi	sp,sp,32
    800024c8:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800024cc:	fffff097          	auipc	ra,0xfffff
    800024d0:	1c0080e7          	jalr	448(ra) # 8000168c <_Z15thread_dispatchv>
    800024d4:	fc1ff06f          	j	80002494 <_ZL9fibonaccim+0x30>

00000000800024d8 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    800024d8:	fe010113          	addi	sp,sp,-32
    800024dc:	00113c23          	sd	ra,24(sp)
    800024e0:	00813823          	sd	s0,16(sp)
    800024e4:	00913423          	sd	s1,8(sp)
    800024e8:	01213023          	sd	s2,0(sp)
    800024ec:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800024f0:	00000913          	li	s2,0
    800024f4:	0380006f          	j	8000252c <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    800024f8:	fffff097          	auipc	ra,0xfffff
    800024fc:	194080e7          	jalr	404(ra) # 8000168c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80002500:	00148493          	addi	s1,s1,1
    80002504:	000027b7          	lui	a5,0x2
    80002508:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000250c:	0097ee63          	bltu	a5,s1,80002528 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80002510:	00000713          	li	a4,0
    80002514:	000077b7          	lui	a5,0x7
    80002518:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000251c:	fce7eee3          	bltu	a5,a4,800024f8 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80002520:	00170713          	addi	a4,a4,1
    80002524:	ff1ff06f          	j	80002514 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80002528:	00190913          	addi	s2,s2,1
    8000252c:	00900793          	li	a5,9
    80002530:	0527e063          	bltu	a5,s2,80002570 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80002534:	00006517          	auipc	a0,0x6
    80002538:	bd450513          	addi	a0,a0,-1068 # 80008108 <CONSOLE_STATUS+0xf8>
    8000253c:	00002097          	auipc	ra,0x2
    80002540:	908080e7          	jalr	-1784(ra) # 80003e44 <_Z11printStringPKc>
    80002544:	00000613          	li	a2,0
    80002548:	00a00593          	li	a1,10
    8000254c:	0009051b          	sext.w	a0,s2
    80002550:	00002097          	auipc	ra,0x2
    80002554:	aa4080e7          	jalr	-1372(ra) # 80003ff4 <_Z8printIntiii>
    80002558:	00006517          	auipc	a0,0x6
    8000255c:	e3050513          	addi	a0,a0,-464 # 80008388 <CONSOLE_STATUS+0x378>
    80002560:	00002097          	auipc	ra,0x2
    80002564:	8e4080e7          	jalr	-1820(ra) # 80003e44 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80002568:	00000493          	li	s1,0
    8000256c:	f99ff06f          	j	80002504 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80002570:	00006517          	auipc	a0,0x6
    80002574:	ba050513          	addi	a0,a0,-1120 # 80008110 <CONSOLE_STATUS+0x100>
    80002578:	00002097          	auipc	ra,0x2
    8000257c:	8cc080e7          	jalr	-1844(ra) # 80003e44 <_Z11printStringPKc>
    finishedA = true;
    80002580:	00100793          	li	a5,1
    80002584:	00008717          	auipc	a4,0x8
    80002588:	04f70223          	sb	a5,68(a4) # 8000a5c8 <_ZL9finishedA>
}
    8000258c:	01813083          	ld	ra,24(sp)
    80002590:	01013403          	ld	s0,16(sp)
    80002594:	00813483          	ld	s1,8(sp)
    80002598:	00013903          	ld	s2,0(sp)
    8000259c:	02010113          	addi	sp,sp,32
    800025a0:	00008067          	ret

00000000800025a4 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    800025a4:	fe010113          	addi	sp,sp,-32
    800025a8:	00113c23          	sd	ra,24(sp)
    800025ac:	00813823          	sd	s0,16(sp)
    800025b0:	00913423          	sd	s1,8(sp)
    800025b4:	01213023          	sd	s2,0(sp)
    800025b8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800025bc:	00000913          	li	s2,0
    800025c0:	0380006f          	j	800025f8 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    800025c4:	fffff097          	auipc	ra,0xfffff
    800025c8:	0c8080e7          	jalr	200(ra) # 8000168c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800025cc:	00148493          	addi	s1,s1,1
    800025d0:	000027b7          	lui	a5,0x2
    800025d4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800025d8:	0097ee63          	bltu	a5,s1,800025f4 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800025dc:	00000713          	li	a4,0
    800025e0:	000077b7          	lui	a5,0x7
    800025e4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800025e8:	fce7eee3          	bltu	a5,a4,800025c4 <_ZN7WorkerB11workerBodyBEPv+0x20>
    800025ec:	00170713          	addi	a4,a4,1
    800025f0:	ff1ff06f          	j	800025e0 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    800025f4:	00190913          	addi	s2,s2,1
    800025f8:	00f00793          	li	a5,15
    800025fc:	0527e063          	bltu	a5,s2,8000263c <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80002600:	00006517          	auipc	a0,0x6
    80002604:	b2050513          	addi	a0,a0,-1248 # 80008120 <CONSOLE_STATUS+0x110>
    80002608:	00002097          	auipc	ra,0x2
    8000260c:	83c080e7          	jalr	-1988(ra) # 80003e44 <_Z11printStringPKc>
    80002610:	00000613          	li	a2,0
    80002614:	00a00593          	li	a1,10
    80002618:	0009051b          	sext.w	a0,s2
    8000261c:	00002097          	auipc	ra,0x2
    80002620:	9d8080e7          	jalr	-1576(ra) # 80003ff4 <_Z8printIntiii>
    80002624:	00006517          	auipc	a0,0x6
    80002628:	d6450513          	addi	a0,a0,-668 # 80008388 <CONSOLE_STATUS+0x378>
    8000262c:	00002097          	auipc	ra,0x2
    80002630:	818080e7          	jalr	-2024(ra) # 80003e44 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80002634:	00000493          	li	s1,0
    80002638:	f99ff06f          	j	800025d0 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    8000263c:	00006517          	auipc	a0,0x6
    80002640:	aec50513          	addi	a0,a0,-1300 # 80008128 <CONSOLE_STATUS+0x118>
    80002644:	00002097          	auipc	ra,0x2
    80002648:	800080e7          	jalr	-2048(ra) # 80003e44 <_Z11printStringPKc>
    finishedB = true;
    8000264c:	00100793          	li	a5,1
    80002650:	00008717          	auipc	a4,0x8
    80002654:	f6f70ca3          	sb	a5,-135(a4) # 8000a5c9 <_ZL9finishedB>
    thread_dispatch();
    80002658:	fffff097          	auipc	ra,0xfffff
    8000265c:	034080e7          	jalr	52(ra) # 8000168c <_Z15thread_dispatchv>
}
    80002660:	01813083          	ld	ra,24(sp)
    80002664:	01013403          	ld	s0,16(sp)
    80002668:	00813483          	ld	s1,8(sp)
    8000266c:	00013903          	ld	s2,0(sp)
    80002670:	02010113          	addi	sp,sp,32
    80002674:	00008067          	ret

0000000080002678 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80002678:	fe010113          	addi	sp,sp,-32
    8000267c:	00113c23          	sd	ra,24(sp)
    80002680:	00813823          	sd	s0,16(sp)
    80002684:	00913423          	sd	s1,8(sp)
    80002688:	01213023          	sd	s2,0(sp)
    8000268c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80002690:	00000493          	li	s1,0
    80002694:	0400006f          	j	800026d4 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80002698:	00006517          	auipc	a0,0x6
    8000269c:	aa050513          	addi	a0,a0,-1376 # 80008138 <CONSOLE_STATUS+0x128>
    800026a0:	00001097          	auipc	ra,0x1
    800026a4:	7a4080e7          	jalr	1956(ra) # 80003e44 <_Z11printStringPKc>
    800026a8:	00000613          	li	a2,0
    800026ac:	00a00593          	li	a1,10
    800026b0:	00048513          	mv	a0,s1
    800026b4:	00002097          	auipc	ra,0x2
    800026b8:	940080e7          	jalr	-1728(ra) # 80003ff4 <_Z8printIntiii>
    800026bc:	00006517          	auipc	a0,0x6
    800026c0:	ccc50513          	addi	a0,a0,-820 # 80008388 <CONSOLE_STATUS+0x378>
    800026c4:	00001097          	auipc	ra,0x1
    800026c8:	780080e7          	jalr	1920(ra) # 80003e44 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800026cc:	0014849b          	addiw	s1,s1,1
    800026d0:	0ff4f493          	andi	s1,s1,255
    800026d4:	00200793          	li	a5,2
    800026d8:	fc97f0e3          	bgeu	a5,s1,80002698 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    800026dc:	00006517          	auipc	a0,0x6
    800026e0:	a6450513          	addi	a0,a0,-1436 # 80008140 <CONSOLE_STATUS+0x130>
    800026e4:	00001097          	auipc	ra,0x1
    800026e8:	760080e7          	jalr	1888(ra) # 80003e44 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800026ec:	00700313          	li	t1,7
    thread_dispatch();
    800026f0:	fffff097          	auipc	ra,0xfffff
    800026f4:	f9c080e7          	jalr	-100(ra) # 8000168c <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800026f8:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    800026fc:	00006517          	auipc	a0,0x6
    80002700:	a5450513          	addi	a0,a0,-1452 # 80008150 <CONSOLE_STATUS+0x140>
    80002704:	00001097          	auipc	ra,0x1
    80002708:	740080e7          	jalr	1856(ra) # 80003e44 <_Z11printStringPKc>
    8000270c:	00000613          	li	a2,0
    80002710:	00a00593          	li	a1,10
    80002714:	0009051b          	sext.w	a0,s2
    80002718:	00002097          	auipc	ra,0x2
    8000271c:	8dc080e7          	jalr	-1828(ra) # 80003ff4 <_Z8printIntiii>
    80002720:	00006517          	auipc	a0,0x6
    80002724:	c6850513          	addi	a0,a0,-920 # 80008388 <CONSOLE_STATUS+0x378>
    80002728:	00001097          	auipc	ra,0x1
    8000272c:	71c080e7          	jalr	1820(ra) # 80003e44 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80002730:	00c00513          	li	a0,12
    80002734:	00000097          	auipc	ra,0x0
    80002738:	d30080e7          	jalr	-720(ra) # 80002464 <_ZL9fibonaccim>
    8000273c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80002740:	00006517          	auipc	a0,0x6
    80002744:	a1850513          	addi	a0,a0,-1512 # 80008158 <CONSOLE_STATUS+0x148>
    80002748:	00001097          	auipc	ra,0x1
    8000274c:	6fc080e7          	jalr	1788(ra) # 80003e44 <_Z11printStringPKc>
    80002750:	00000613          	li	a2,0
    80002754:	00a00593          	li	a1,10
    80002758:	0009051b          	sext.w	a0,s2
    8000275c:	00002097          	auipc	ra,0x2
    80002760:	898080e7          	jalr	-1896(ra) # 80003ff4 <_Z8printIntiii>
    80002764:	00006517          	auipc	a0,0x6
    80002768:	c2450513          	addi	a0,a0,-988 # 80008388 <CONSOLE_STATUS+0x378>
    8000276c:	00001097          	auipc	ra,0x1
    80002770:	6d8080e7          	jalr	1752(ra) # 80003e44 <_Z11printStringPKc>
    80002774:	0400006f          	j	800027b4 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80002778:	00006517          	auipc	a0,0x6
    8000277c:	9c050513          	addi	a0,a0,-1600 # 80008138 <CONSOLE_STATUS+0x128>
    80002780:	00001097          	auipc	ra,0x1
    80002784:	6c4080e7          	jalr	1732(ra) # 80003e44 <_Z11printStringPKc>
    80002788:	00000613          	li	a2,0
    8000278c:	00a00593          	li	a1,10
    80002790:	00048513          	mv	a0,s1
    80002794:	00002097          	auipc	ra,0x2
    80002798:	860080e7          	jalr	-1952(ra) # 80003ff4 <_Z8printIntiii>
    8000279c:	00006517          	auipc	a0,0x6
    800027a0:	bec50513          	addi	a0,a0,-1044 # 80008388 <CONSOLE_STATUS+0x378>
    800027a4:	00001097          	auipc	ra,0x1
    800027a8:	6a0080e7          	jalr	1696(ra) # 80003e44 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800027ac:	0014849b          	addiw	s1,s1,1
    800027b0:	0ff4f493          	andi	s1,s1,255
    800027b4:	00500793          	li	a5,5
    800027b8:	fc97f0e3          	bgeu	a5,s1,80002778 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    800027bc:	00006517          	auipc	a0,0x6
    800027c0:	95450513          	addi	a0,a0,-1708 # 80008110 <CONSOLE_STATUS+0x100>
    800027c4:	00001097          	auipc	ra,0x1
    800027c8:	680080e7          	jalr	1664(ra) # 80003e44 <_Z11printStringPKc>
    finishedC = true;
    800027cc:	00100793          	li	a5,1
    800027d0:	00008717          	auipc	a4,0x8
    800027d4:	def70d23          	sb	a5,-518(a4) # 8000a5ca <_ZL9finishedC>
    thread_dispatch();
    800027d8:	fffff097          	auipc	ra,0xfffff
    800027dc:	eb4080e7          	jalr	-332(ra) # 8000168c <_Z15thread_dispatchv>
}
    800027e0:	01813083          	ld	ra,24(sp)
    800027e4:	01013403          	ld	s0,16(sp)
    800027e8:	00813483          	ld	s1,8(sp)
    800027ec:	00013903          	ld	s2,0(sp)
    800027f0:	02010113          	addi	sp,sp,32
    800027f4:	00008067          	ret

00000000800027f8 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    800027f8:	fe010113          	addi	sp,sp,-32
    800027fc:	00113c23          	sd	ra,24(sp)
    80002800:	00813823          	sd	s0,16(sp)
    80002804:	00913423          	sd	s1,8(sp)
    80002808:	01213023          	sd	s2,0(sp)
    8000280c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80002810:	00a00493          	li	s1,10
    80002814:	0400006f          	j	80002854 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80002818:	00006517          	auipc	a0,0x6
    8000281c:	95050513          	addi	a0,a0,-1712 # 80008168 <CONSOLE_STATUS+0x158>
    80002820:	00001097          	auipc	ra,0x1
    80002824:	624080e7          	jalr	1572(ra) # 80003e44 <_Z11printStringPKc>
    80002828:	00000613          	li	a2,0
    8000282c:	00a00593          	li	a1,10
    80002830:	00048513          	mv	a0,s1
    80002834:	00001097          	auipc	ra,0x1
    80002838:	7c0080e7          	jalr	1984(ra) # 80003ff4 <_Z8printIntiii>
    8000283c:	00006517          	auipc	a0,0x6
    80002840:	b4c50513          	addi	a0,a0,-1204 # 80008388 <CONSOLE_STATUS+0x378>
    80002844:	00001097          	auipc	ra,0x1
    80002848:	600080e7          	jalr	1536(ra) # 80003e44 <_Z11printStringPKc>
    for (; i < 13; i++) {
    8000284c:	0014849b          	addiw	s1,s1,1
    80002850:	0ff4f493          	andi	s1,s1,255
    80002854:	00c00793          	li	a5,12
    80002858:	fc97f0e3          	bgeu	a5,s1,80002818 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    8000285c:	00006517          	auipc	a0,0x6
    80002860:	91450513          	addi	a0,a0,-1772 # 80008170 <CONSOLE_STATUS+0x160>
    80002864:	00001097          	auipc	ra,0x1
    80002868:	5e0080e7          	jalr	1504(ra) # 80003e44 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    8000286c:	00500313          	li	t1,5
    thread_dispatch();
    80002870:	fffff097          	auipc	ra,0xfffff
    80002874:	e1c080e7          	jalr	-484(ra) # 8000168c <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80002878:	01000513          	li	a0,16
    8000287c:	00000097          	auipc	ra,0x0
    80002880:	be8080e7          	jalr	-1048(ra) # 80002464 <_ZL9fibonaccim>
    80002884:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80002888:	00006517          	auipc	a0,0x6
    8000288c:	8f850513          	addi	a0,a0,-1800 # 80008180 <CONSOLE_STATUS+0x170>
    80002890:	00001097          	auipc	ra,0x1
    80002894:	5b4080e7          	jalr	1460(ra) # 80003e44 <_Z11printStringPKc>
    80002898:	00000613          	li	a2,0
    8000289c:	00a00593          	li	a1,10
    800028a0:	0009051b          	sext.w	a0,s2
    800028a4:	00001097          	auipc	ra,0x1
    800028a8:	750080e7          	jalr	1872(ra) # 80003ff4 <_Z8printIntiii>
    800028ac:	00006517          	auipc	a0,0x6
    800028b0:	adc50513          	addi	a0,a0,-1316 # 80008388 <CONSOLE_STATUS+0x378>
    800028b4:	00001097          	auipc	ra,0x1
    800028b8:	590080e7          	jalr	1424(ra) # 80003e44 <_Z11printStringPKc>
    800028bc:	0400006f          	j	800028fc <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800028c0:	00006517          	auipc	a0,0x6
    800028c4:	8a850513          	addi	a0,a0,-1880 # 80008168 <CONSOLE_STATUS+0x158>
    800028c8:	00001097          	auipc	ra,0x1
    800028cc:	57c080e7          	jalr	1404(ra) # 80003e44 <_Z11printStringPKc>
    800028d0:	00000613          	li	a2,0
    800028d4:	00a00593          	li	a1,10
    800028d8:	00048513          	mv	a0,s1
    800028dc:	00001097          	auipc	ra,0x1
    800028e0:	718080e7          	jalr	1816(ra) # 80003ff4 <_Z8printIntiii>
    800028e4:	00006517          	auipc	a0,0x6
    800028e8:	aa450513          	addi	a0,a0,-1372 # 80008388 <CONSOLE_STATUS+0x378>
    800028ec:	00001097          	auipc	ra,0x1
    800028f0:	558080e7          	jalr	1368(ra) # 80003e44 <_Z11printStringPKc>
    for (; i < 16; i++) {
    800028f4:	0014849b          	addiw	s1,s1,1
    800028f8:	0ff4f493          	andi	s1,s1,255
    800028fc:	00f00793          	li	a5,15
    80002900:	fc97f0e3          	bgeu	a5,s1,800028c0 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80002904:	00006517          	auipc	a0,0x6
    80002908:	88c50513          	addi	a0,a0,-1908 # 80008190 <CONSOLE_STATUS+0x180>
    8000290c:	00001097          	auipc	ra,0x1
    80002910:	538080e7          	jalr	1336(ra) # 80003e44 <_Z11printStringPKc>
    finishedD = true;
    80002914:	00100793          	li	a5,1
    80002918:	00008717          	auipc	a4,0x8
    8000291c:	caf709a3          	sb	a5,-845(a4) # 8000a5cb <_ZL9finishedD>
    thread_dispatch();
    80002920:	fffff097          	auipc	ra,0xfffff
    80002924:	d6c080e7          	jalr	-660(ra) # 8000168c <_Z15thread_dispatchv>
}
    80002928:	01813083          	ld	ra,24(sp)
    8000292c:	01013403          	ld	s0,16(sp)
    80002930:	00813483          	ld	s1,8(sp)
    80002934:	00013903          	ld	s2,0(sp)
    80002938:	02010113          	addi	sp,sp,32
    8000293c:	00008067          	ret

0000000080002940 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80002940:	fc010113          	addi	sp,sp,-64
    80002944:	02113c23          	sd	ra,56(sp)
    80002948:	02813823          	sd	s0,48(sp)
    8000294c:	02913423          	sd	s1,40(sp)
    80002950:	03213023          	sd	s2,32(sp)
    80002954:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80002958:	02000513          	li	a0,32
    8000295c:	00002097          	auipc	ra,0x2
    80002960:	fac080e7          	jalr	-84(ra) # 80004908 <_Znwm>
    80002964:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80002968:	00001097          	auipc	ra,0x1
    8000296c:	480080e7          	jalr	1152(ra) # 80003de8 <_ZN6ThreadC1Ev>
    80002970:	00008797          	auipc	a5,0x8
    80002974:	a7878793          	addi	a5,a5,-1416 # 8000a3e8 <_ZTV7WorkerA+0x10>
    80002978:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    8000297c:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80002980:	00006517          	auipc	a0,0x6
    80002984:	82050513          	addi	a0,a0,-2016 # 800081a0 <CONSOLE_STATUS+0x190>
    80002988:	00001097          	auipc	ra,0x1
    8000298c:	4bc080e7          	jalr	1212(ra) # 80003e44 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80002990:	02000513          	li	a0,32
    80002994:	00002097          	auipc	ra,0x2
    80002998:	f74080e7          	jalr	-140(ra) # 80004908 <_Znwm>
    8000299c:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    800029a0:	00001097          	auipc	ra,0x1
    800029a4:	448080e7          	jalr	1096(ra) # 80003de8 <_ZN6ThreadC1Ev>
    800029a8:	00008797          	auipc	a5,0x8
    800029ac:	a6878793          	addi	a5,a5,-1432 # 8000a410 <_ZTV7WorkerB+0x10>
    800029b0:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    800029b4:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    800029b8:	00006517          	auipc	a0,0x6
    800029bc:	80050513          	addi	a0,a0,-2048 # 800081b8 <CONSOLE_STATUS+0x1a8>
    800029c0:	00001097          	auipc	ra,0x1
    800029c4:	484080e7          	jalr	1156(ra) # 80003e44 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    800029c8:	02000513          	li	a0,32
    800029cc:	00002097          	auipc	ra,0x2
    800029d0:	f3c080e7          	jalr	-196(ra) # 80004908 <_Znwm>
    800029d4:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    800029d8:	00001097          	auipc	ra,0x1
    800029dc:	410080e7          	jalr	1040(ra) # 80003de8 <_ZN6ThreadC1Ev>
    800029e0:	00008797          	auipc	a5,0x8
    800029e4:	a5878793          	addi	a5,a5,-1448 # 8000a438 <_ZTV7WorkerC+0x10>
    800029e8:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    800029ec:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    800029f0:	00005517          	auipc	a0,0x5
    800029f4:	7e050513          	addi	a0,a0,2016 # 800081d0 <CONSOLE_STATUS+0x1c0>
    800029f8:	00001097          	auipc	ra,0x1
    800029fc:	44c080e7          	jalr	1100(ra) # 80003e44 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80002a00:	02000513          	li	a0,32
    80002a04:	00002097          	auipc	ra,0x2
    80002a08:	f04080e7          	jalr	-252(ra) # 80004908 <_Znwm>
    80002a0c:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80002a10:	00001097          	auipc	ra,0x1
    80002a14:	3d8080e7          	jalr	984(ra) # 80003de8 <_ZN6ThreadC1Ev>
    80002a18:	00008797          	auipc	a5,0x8
    80002a1c:	a4878793          	addi	a5,a5,-1464 # 8000a460 <_ZTV7WorkerD+0x10>
    80002a20:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80002a24:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80002a28:	00005517          	auipc	a0,0x5
    80002a2c:	7c050513          	addi	a0,a0,1984 # 800081e8 <CONSOLE_STATUS+0x1d8>
    80002a30:	00001097          	auipc	ra,0x1
    80002a34:	414080e7          	jalr	1044(ra) # 80003e44 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80002a38:	00000493          	li	s1,0
    80002a3c:	00300793          	li	a5,3
    80002a40:	0297c663          	blt	a5,s1,80002a6c <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80002a44:	00349793          	slli	a5,s1,0x3
    80002a48:	fe040713          	addi	a4,s0,-32
    80002a4c:	00f707b3          	add	a5,a4,a5
    80002a50:	fe07b503          	ld	a0,-32(a5)
    80002a54:	00001097          	auipc	ra,0x1
    80002a58:	314080e7          	jalr	788(ra) # 80003d68 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80002a5c:	0014849b          	addiw	s1,s1,1
    80002a60:	fddff06f          	j	80002a3c <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80002a64:	00001097          	auipc	ra,0x1
    80002a68:	35c080e7          	jalr	860(ra) # 80003dc0 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80002a6c:	00008797          	auipc	a5,0x8
    80002a70:	b5c7c783          	lbu	a5,-1188(a5) # 8000a5c8 <_ZL9finishedA>
    80002a74:	fe0788e3          	beqz	a5,80002a64 <_Z20Threads_CPP_API_testv+0x124>
    80002a78:	00008797          	auipc	a5,0x8
    80002a7c:	b517c783          	lbu	a5,-1199(a5) # 8000a5c9 <_ZL9finishedB>
    80002a80:	fe0782e3          	beqz	a5,80002a64 <_Z20Threads_CPP_API_testv+0x124>
    80002a84:	00008797          	auipc	a5,0x8
    80002a88:	b467c783          	lbu	a5,-1210(a5) # 8000a5ca <_ZL9finishedC>
    80002a8c:	fc078ce3          	beqz	a5,80002a64 <_Z20Threads_CPP_API_testv+0x124>
    80002a90:	00008797          	auipc	a5,0x8
    80002a94:	b3b7c783          	lbu	a5,-1221(a5) # 8000a5cb <_ZL9finishedD>
    80002a98:	fc0786e3          	beqz	a5,80002a64 <_Z20Threads_CPP_API_testv+0x124>
    80002a9c:	fc040493          	addi	s1,s0,-64
    80002aa0:	0080006f          	j	80002aa8 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    80002aa4:	00848493          	addi	s1,s1,8
    80002aa8:	fe040793          	addi	a5,s0,-32
    80002aac:	08f48663          	beq	s1,a5,80002b38 <_Z20Threads_CPP_API_testv+0x1f8>
    80002ab0:	0004b503          	ld	a0,0(s1)
    80002ab4:	fe0508e3          	beqz	a0,80002aa4 <_Z20Threads_CPP_API_testv+0x164>
    80002ab8:	00053783          	ld	a5,0(a0)
    80002abc:	0087b783          	ld	a5,8(a5)
    80002ac0:	000780e7          	jalr	a5
    80002ac4:	fe1ff06f          	j	80002aa4 <_Z20Threads_CPP_API_testv+0x164>
    80002ac8:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80002acc:	00048513          	mv	a0,s1
    80002ad0:	00002097          	auipc	ra,0x2
    80002ad4:	e88080e7          	jalr	-376(ra) # 80004958 <_ZdlPv>
    80002ad8:	00090513          	mv	a0,s2
    80002adc:	00009097          	auipc	ra,0x9
    80002ae0:	c0c080e7          	jalr	-1012(ra) # 8000b6e8 <_Unwind_Resume>
    80002ae4:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80002ae8:	00048513          	mv	a0,s1
    80002aec:	00002097          	auipc	ra,0x2
    80002af0:	e6c080e7          	jalr	-404(ra) # 80004958 <_ZdlPv>
    80002af4:	00090513          	mv	a0,s2
    80002af8:	00009097          	auipc	ra,0x9
    80002afc:	bf0080e7          	jalr	-1040(ra) # 8000b6e8 <_Unwind_Resume>
    80002b00:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80002b04:	00048513          	mv	a0,s1
    80002b08:	00002097          	auipc	ra,0x2
    80002b0c:	e50080e7          	jalr	-432(ra) # 80004958 <_ZdlPv>
    80002b10:	00090513          	mv	a0,s2
    80002b14:	00009097          	auipc	ra,0x9
    80002b18:	bd4080e7          	jalr	-1068(ra) # 8000b6e8 <_Unwind_Resume>
    80002b1c:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80002b20:	00048513          	mv	a0,s1
    80002b24:	00002097          	auipc	ra,0x2
    80002b28:	e34080e7          	jalr	-460(ra) # 80004958 <_ZdlPv>
    80002b2c:	00090513          	mv	a0,s2
    80002b30:	00009097          	auipc	ra,0x9
    80002b34:	bb8080e7          	jalr	-1096(ra) # 8000b6e8 <_Unwind_Resume>
}
    80002b38:	03813083          	ld	ra,56(sp)
    80002b3c:	03013403          	ld	s0,48(sp)
    80002b40:	02813483          	ld	s1,40(sp)
    80002b44:	02013903          	ld	s2,32(sp)
    80002b48:	04010113          	addi	sp,sp,64
    80002b4c:	00008067          	ret

0000000080002b50 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80002b50:	ff010113          	addi	sp,sp,-16
    80002b54:	00113423          	sd	ra,8(sp)
    80002b58:	00813023          	sd	s0,0(sp)
    80002b5c:	01010413          	addi	s0,sp,16
    80002b60:	00008797          	auipc	a5,0x8
    80002b64:	88878793          	addi	a5,a5,-1912 # 8000a3e8 <_ZTV7WorkerA+0x10>
    80002b68:	00f53023          	sd	a5,0(a0)
    80002b6c:	00001097          	auipc	ra,0x1
    80002b70:	12c080e7          	jalr	300(ra) # 80003c98 <_ZN6ThreadD1Ev>
    80002b74:	00813083          	ld	ra,8(sp)
    80002b78:	00013403          	ld	s0,0(sp)
    80002b7c:	01010113          	addi	sp,sp,16
    80002b80:	00008067          	ret

0000000080002b84 <_ZN7WorkerAD0Ev>:
    80002b84:	fe010113          	addi	sp,sp,-32
    80002b88:	00113c23          	sd	ra,24(sp)
    80002b8c:	00813823          	sd	s0,16(sp)
    80002b90:	00913423          	sd	s1,8(sp)
    80002b94:	02010413          	addi	s0,sp,32
    80002b98:	00050493          	mv	s1,a0
    80002b9c:	00008797          	auipc	a5,0x8
    80002ba0:	84c78793          	addi	a5,a5,-1972 # 8000a3e8 <_ZTV7WorkerA+0x10>
    80002ba4:	00f53023          	sd	a5,0(a0)
    80002ba8:	00001097          	auipc	ra,0x1
    80002bac:	0f0080e7          	jalr	240(ra) # 80003c98 <_ZN6ThreadD1Ev>
    80002bb0:	00048513          	mv	a0,s1
    80002bb4:	00002097          	auipc	ra,0x2
    80002bb8:	da4080e7          	jalr	-604(ra) # 80004958 <_ZdlPv>
    80002bbc:	01813083          	ld	ra,24(sp)
    80002bc0:	01013403          	ld	s0,16(sp)
    80002bc4:	00813483          	ld	s1,8(sp)
    80002bc8:	02010113          	addi	sp,sp,32
    80002bcc:	00008067          	ret

0000000080002bd0 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80002bd0:	ff010113          	addi	sp,sp,-16
    80002bd4:	00113423          	sd	ra,8(sp)
    80002bd8:	00813023          	sd	s0,0(sp)
    80002bdc:	01010413          	addi	s0,sp,16
    80002be0:	00008797          	auipc	a5,0x8
    80002be4:	83078793          	addi	a5,a5,-2000 # 8000a410 <_ZTV7WorkerB+0x10>
    80002be8:	00f53023          	sd	a5,0(a0)
    80002bec:	00001097          	auipc	ra,0x1
    80002bf0:	0ac080e7          	jalr	172(ra) # 80003c98 <_ZN6ThreadD1Ev>
    80002bf4:	00813083          	ld	ra,8(sp)
    80002bf8:	00013403          	ld	s0,0(sp)
    80002bfc:	01010113          	addi	sp,sp,16
    80002c00:	00008067          	ret

0000000080002c04 <_ZN7WorkerBD0Ev>:
    80002c04:	fe010113          	addi	sp,sp,-32
    80002c08:	00113c23          	sd	ra,24(sp)
    80002c0c:	00813823          	sd	s0,16(sp)
    80002c10:	00913423          	sd	s1,8(sp)
    80002c14:	02010413          	addi	s0,sp,32
    80002c18:	00050493          	mv	s1,a0
    80002c1c:	00007797          	auipc	a5,0x7
    80002c20:	7f478793          	addi	a5,a5,2036 # 8000a410 <_ZTV7WorkerB+0x10>
    80002c24:	00f53023          	sd	a5,0(a0)
    80002c28:	00001097          	auipc	ra,0x1
    80002c2c:	070080e7          	jalr	112(ra) # 80003c98 <_ZN6ThreadD1Ev>
    80002c30:	00048513          	mv	a0,s1
    80002c34:	00002097          	auipc	ra,0x2
    80002c38:	d24080e7          	jalr	-732(ra) # 80004958 <_ZdlPv>
    80002c3c:	01813083          	ld	ra,24(sp)
    80002c40:	01013403          	ld	s0,16(sp)
    80002c44:	00813483          	ld	s1,8(sp)
    80002c48:	02010113          	addi	sp,sp,32
    80002c4c:	00008067          	ret

0000000080002c50 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80002c50:	ff010113          	addi	sp,sp,-16
    80002c54:	00113423          	sd	ra,8(sp)
    80002c58:	00813023          	sd	s0,0(sp)
    80002c5c:	01010413          	addi	s0,sp,16
    80002c60:	00007797          	auipc	a5,0x7
    80002c64:	7d878793          	addi	a5,a5,2008 # 8000a438 <_ZTV7WorkerC+0x10>
    80002c68:	00f53023          	sd	a5,0(a0)
    80002c6c:	00001097          	auipc	ra,0x1
    80002c70:	02c080e7          	jalr	44(ra) # 80003c98 <_ZN6ThreadD1Ev>
    80002c74:	00813083          	ld	ra,8(sp)
    80002c78:	00013403          	ld	s0,0(sp)
    80002c7c:	01010113          	addi	sp,sp,16
    80002c80:	00008067          	ret

0000000080002c84 <_ZN7WorkerCD0Ev>:
    80002c84:	fe010113          	addi	sp,sp,-32
    80002c88:	00113c23          	sd	ra,24(sp)
    80002c8c:	00813823          	sd	s0,16(sp)
    80002c90:	00913423          	sd	s1,8(sp)
    80002c94:	02010413          	addi	s0,sp,32
    80002c98:	00050493          	mv	s1,a0
    80002c9c:	00007797          	auipc	a5,0x7
    80002ca0:	79c78793          	addi	a5,a5,1948 # 8000a438 <_ZTV7WorkerC+0x10>
    80002ca4:	00f53023          	sd	a5,0(a0)
    80002ca8:	00001097          	auipc	ra,0x1
    80002cac:	ff0080e7          	jalr	-16(ra) # 80003c98 <_ZN6ThreadD1Ev>
    80002cb0:	00048513          	mv	a0,s1
    80002cb4:	00002097          	auipc	ra,0x2
    80002cb8:	ca4080e7          	jalr	-860(ra) # 80004958 <_ZdlPv>
    80002cbc:	01813083          	ld	ra,24(sp)
    80002cc0:	01013403          	ld	s0,16(sp)
    80002cc4:	00813483          	ld	s1,8(sp)
    80002cc8:	02010113          	addi	sp,sp,32
    80002ccc:	00008067          	ret

0000000080002cd0 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80002cd0:	ff010113          	addi	sp,sp,-16
    80002cd4:	00113423          	sd	ra,8(sp)
    80002cd8:	00813023          	sd	s0,0(sp)
    80002cdc:	01010413          	addi	s0,sp,16
    80002ce0:	00007797          	auipc	a5,0x7
    80002ce4:	78078793          	addi	a5,a5,1920 # 8000a460 <_ZTV7WorkerD+0x10>
    80002ce8:	00f53023          	sd	a5,0(a0)
    80002cec:	00001097          	auipc	ra,0x1
    80002cf0:	fac080e7          	jalr	-84(ra) # 80003c98 <_ZN6ThreadD1Ev>
    80002cf4:	00813083          	ld	ra,8(sp)
    80002cf8:	00013403          	ld	s0,0(sp)
    80002cfc:	01010113          	addi	sp,sp,16
    80002d00:	00008067          	ret

0000000080002d04 <_ZN7WorkerDD0Ev>:
    80002d04:	fe010113          	addi	sp,sp,-32
    80002d08:	00113c23          	sd	ra,24(sp)
    80002d0c:	00813823          	sd	s0,16(sp)
    80002d10:	00913423          	sd	s1,8(sp)
    80002d14:	02010413          	addi	s0,sp,32
    80002d18:	00050493          	mv	s1,a0
    80002d1c:	00007797          	auipc	a5,0x7
    80002d20:	74478793          	addi	a5,a5,1860 # 8000a460 <_ZTV7WorkerD+0x10>
    80002d24:	00f53023          	sd	a5,0(a0)
    80002d28:	00001097          	auipc	ra,0x1
    80002d2c:	f70080e7          	jalr	-144(ra) # 80003c98 <_ZN6ThreadD1Ev>
    80002d30:	00048513          	mv	a0,s1
    80002d34:	00002097          	auipc	ra,0x2
    80002d38:	c24080e7          	jalr	-988(ra) # 80004958 <_ZdlPv>
    80002d3c:	01813083          	ld	ra,24(sp)
    80002d40:	01013403          	ld	s0,16(sp)
    80002d44:	00813483          	ld	s1,8(sp)
    80002d48:	02010113          	addi	sp,sp,32
    80002d4c:	00008067          	ret

0000000080002d50 <_ZN7WorkerA3runEv>:
    void run() override {
    80002d50:	ff010113          	addi	sp,sp,-16
    80002d54:	00113423          	sd	ra,8(sp)
    80002d58:	00813023          	sd	s0,0(sp)
    80002d5c:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80002d60:	00000593          	li	a1,0
    80002d64:	fffff097          	auipc	ra,0xfffff
    80002d68:	774080e7          	jalr	1908(ra) # 800024d8 <_ZN7WorkerA11workerBodyAEPv>
    }
    80002d6c:	00813083          	ld	ra,8(sp)
    80002d70:	00013403          	ld	s0,0(sp)
    80002d74:	01010113          	addi	sp,sp,16
    80002d78:	00008067          	ret

0000000080002d7c <_ZN7WorkerB3runEv>:
    void run() override {
    80002d7c:	ff010113          	addi	sp,sp,-16
    80002d80:	00113423          	sd	ra,8(sp)
    80002d84:	00813023          	sd	s0,0(sp)
    80002d88:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80002d8c:	00000593          	li	a1,0
    80002d90:	00000097          	auipc	ra,0x0
    80002d94:	814080e7          	jalr	-2028(ra) # 800025a4 <_ZN7WorkerB11workerBodyBEPv>
    }
    80002d98:	00813083          	ld	ra,8(sp)
    80002d9c:	00013403          	ld	s0,0(sp)
    80002da0:	01010113          	addi	sp,sp,16
    80002da4:	00008067          	ret

0000000080002da8 <_ZN7WorkerC3runEv>:
    void run() override {
    80002da8:	ff010113          	addi	sp,sp,-16
    80002dac:	00113423          	sd	ra,8(sp)
    80002db0:	00813023          	sd	s0,0(sp)
    80002db4:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80002db8:	00000593          	li	a1,0
    80002dbc:	00000097          	auipc	ra,0x0
    80002dc0:	8bc080e7          	jalr	-1860(ra) # 80002678 <_ZN7WorkerC11workerBodyCEPv>
    }
    80002dc4:	00813083          	ld	ra,8(sp)
    80002dc8:	00013403          	ld	s0,0(sp)
    80002dcc:	01010113          	addi	sp,sp,16
    80002dd0:	00008067          	ret

0000000080002dd4 <_ZN7WorkerD3runEv>:
    void run() override {
    80002dd4:	ff010113          	addi	sp,sp,-16
    80002dd8:	00113423          	sd	ra,8(sp)
    80002ddc:	00813023          	sd	s0,0(sp)
    80002de0:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80002de4:	00000593          	li	a1,0
    80002de8:	00000097          	auipc	ra,0x0
    80002dec:	a10080e7          	jalr	-1520(ra) # 800027f8 <_ZN7WorkerD11workerBodyDEPv>
    }
    80002df0:	00813083          	ld	ra,8(sp)
    80002df4:	00013403          	ld	s0,0(sp)
    80002df8:	01010113          	addi	sp,sp,16
    80002dfc:	00008067          	ret

0000000080002e00 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80002e00:	fe010113          	addi	sp,sp,-32
    80002e04:	00113c23          	sd	ra,24(sp)
    80002e08:	00813823          	sd	s0,16(sp)
    80002e0c:	00913423          	sd	s1,8(sp)
    80002e10:	01213023          	sd	s2,0(sp)
    80002e14:	02010413          	addi	s0,sp,32
    80002e18:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80002e1c:	00100793          	li	a5,1
    80002e20:	02a7f863          	bgeu	a5,a0,80002e50 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80002e24:	00a00793          	li	a5,10
    80002e28:	02f577b3          	remu	a5,a0,a5
    80002e2c:	02078e63          	beqz	a5,80002e68 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80002e30:	fff48513          	addi	a0,s1,-1
    80002e34:	00000097          	auipc	ra,0x0
    80002e38:	fcc080e7          	jalr	-52(ra) # 80002e00 <_ZL9fibonaccim>
    80002e3c:	00050913          	mv	s2,a0
    80002e40:	ffe48513          	addi	a0,s1,-2
    80002e44:	00000097          	auipc	ra,0x0
    80002e48:	fbc080e7          	jalr	-68(ra) # 80002e00 <_ZL9fibonaccim>
    80002e4c:	00a90533          	add	a0,s2,a0
}
    80002e50:	01813083          	ld	ra,24(sp)
    80002e54:	01013403          	ld	s0,16(sp)
    80002e58:	00813483          	ld	s1,8(sp)
    80002e5c:	00013903          	ld	s2,0(sp)
    80002e60:	02010113          	addi	sp,sp,32
    80002e64:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80002e68:	fffff097          	auipc	ra,0xfffff
    80002e6c:	824080e7          	jalr	-2012(ra) # 8000168c <_Z15thread_dispatchv>
    80002e70:	fc1ff06f          	j	80002e30 <_ZL9fibonaccim+0x30>

0000000080002e74 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80002e74:	fe010113          	addi	sp,sp,-32
    80002e78:	00113c23          	sd	ra,24(sp)
    80002e7c:	00813823          	sd	s0,16(sp)
    80002e80:	00913423          	sd	s1,8(sp)
    80002e84:	01213023          	sd	s2,0(sp)
    80002e88:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80002e8c:	00a00493          	li	s1,10
    80002e90:	0400006f          	j	80002ed0 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80002e94:	00005517          	auipc	a0,0x5
    80002e98:	2d450513          	addi	a0,a0,724 # 80008168 <CONSOLE_STATUS+0x158>
    80002e9c:	00001097          	auipc	ra,0x1
    80002ea0:	fa8080e7          	jalr	-88(ra) # 80003e44 <_Z11printStringPKc>
    80002ea4:	00000613          	li	a2,0
    80002ea8:	00a00593          	li	a1,10
    80002eac:	00048513          	mv	a0,s1
    80002eb0:	00001097          	auipc	ra,0x1
    80002eb4:	144080e7          	jalr	324(ra) # 80003ff4 <_Z8printIntiii>
    80002eb8:	00005517          	auipc	a0,0x5
    80002ebc:	4d050513          	addi	a0,a0,1232 # 80008388 <CONSOLE_STATUS+0x378>
    80002ec0:	00001097          	auipc	ra,0x1
    80002ec4:	f84080e7          	jalr	-124(ra) # 80003e44 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80002ec8:	0014849b          	addiw	s1,s1,1
    80002ecc:	0ff4f493          	andi	s1,s1,255
    80002ed0:	00c00793          	li	a5,12
    80002ed4:	fc97f0e3          	bgeu	a5,s1,80002e94 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80002ed8:	00005517          	auipc	a0,0x5
    80002edc:	29850513          	addi	a0,a0,664 # 80008170 <CONSOLE_STATUS+0x160>
    80002ee0:	00001097          	auipc	ra,0x1
    80002ee4:	f64080e7          	jalr	-156(ra) # 80003e44 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80002ee8:	00500313          	li	t1,5
    thread_dispatch();
    80002eec:	ffffe097          	auipc	ra,0xffffe
    80002ef0:	7a0080e7          	jalr	1952(ra) # 8000168c <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80002ef4:	01000513          	li	a0,16
    80002ef8:	00000097          	auipc	ra,0x0
    80002efc:	f08080e7          	jalr	-248(ra) # 80002e00 <_ZL9fibonaccim>
    80002f00:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80002f04:	00005517          	auipc	a0,0x5
    80002f08:	27c50513          	addi	a0,a0,636 # 80008180 <CONSOLE_STATUS+0x170>
    80002f0c:	00001097          	auipc	ra,0x1
    80002f10:	f38080e7          	jalr	-200(ra) # 80003e44 <_Z11printStringPKc>
    80002f14:	00000613          	li	a2,0
    80002f18:	00a00593          	li	a1,10
    80002f1c:	0009051b          	sext.w	a0,s2
    80002f20:	00001097          	auipc	ra,0x1
    80002f24:	0d4080e7          	jalr	212(ra) # 80003ff4 <_Z8printIntiii>
    80002f28:	00005517          	auipc	a0,0x5
    80002f2c:	46050513          	addi	a0,a0,1120 # 80008388 <CONSOLE_STATUS+0x378>
    80002f30:	00001097          	auipc	ra,0x1
    80002f34:	f14080e7          	jalr	-236(ra) # 80003e44 <_Z11printStringPKc>
    80002f38:	0400006f          	j	80002f78 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80002f3c:	00005517          	auipc	a0,0x5
    80002f40:	22c50513          	addi	a0,a0,556 # 80008168 <CONSOLE_STATUS+0x158>
    80002f44:	00001097          	auipc	ra,0x1
    80002f48:	f00080e7          	jalr	-256(ra) # 80003e44 <_Z11printStringPKc>
    80002f4c:	00000613          	li	a2,0
    80002f50:	00a00593          	li	a1,10
    80002f54:	00048513          	mv	a0,s1
    80002f58:	00001097          	auipc	ra,0x1
    80002f5c:	09c080e7          	jalr	156(ra) # 80003ff4 <_Z8printIntiii>
    80002f60:	00005517          	auipc	a0,0x5
    80002f64:	42850513          	addi	a0,a0,1064 # 80008388 <CONSOLE_STATUS+0x378>
    80002f68:	00001097          	auipc	ra,0x1
    80002f6c:	edc080e7          	jalr	-292(ra) # 80003e44 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80002f70:	0014849b          	addiw	s1,s1,1
    80002f74:	0ff4f493          	andi	s1,s1,255
    80002f78:	00f00793          	li	a5,15
    80002f7c:	fc97f0e3          	bgeu	a5,s1,80002f3c <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80002f80:	00005517          	auipc	a0,0x5
    80002f84:	21050513          	addi	a0,a0,528 # 80008190 <CONSOLE_STATUS+0x180>
    80002f88:	00001097          	auipc	ra,0x1
    80002f8c:	ebc080e7          	jalr	-324(ra) # 80003e44 <_Z11printStringPKc>
    finishedD = true;
    80002f90:	00100793          	li	a5,1
    80002f94:	00007717          	auipc	a4,0x7
    80002f98:	62f70c23          	sb	a5,1592(a4) # 8000a5cc <_ZL9finishedD>
    thread_dispatch();
    80002f9c:	ffffe097          	auipc	ra,0xffffe
    80002fa0:	6f0080e7          	jalr	1776(ra) # 8000168c <_Z15thread_dispatchv>
}
    80002fa4:	01813083          	ld	ra,24(sp)
    80002fa8:	01013403          	ld	s0,16(sp)
    80002fac:	00813483          	ld	s1,8(sp)
    80002fb0:	00013903          	ld	s2,0(sp)
    80002fb4:	02010113          	addi	sp,sp,32
    80002fb8:	00008067          	ret

0000000080002fbc <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80002fbc:	fe010113          	addi	sp,sp,-32
    80002fc0:	00113c23          	sd	ra,24(sp)
    80002fc4:	00813823          	sd	s0,16(sp)
    80002fc8:	00913423          	sd	s1,8(sp)
    80002fcc:	01213023          	sd	s2,0(sp)
    80002fd0:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80002fd4:	00000493          	li	s1,0
    80002fd8:	0400006f          	j	80003018 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80002fdc:	00005517          	auipc	a0,0x5
    80002fe0:	15c50513          	addi	a0,a0,348 # 80008138 <CONSOLE_STATUS+0x128>
    80002fe4:	00001097          	auipc	ra,0x1
    80002fe8:	e60080e7          	jalr	-416(ra) # 80003e44 <_Z11printStringPKc>
    80002fec:	00000613          	li	a2,0
    80002ff0:	00a00593          	li	a1,10
    80002ff4:	00048513          	mv	a0,s1
    80002ff8:	00001097          	auipc	ra,0x1
    80002ffc:	ffc080e7          	jalr	-4(ra) # 80003ff4 <_Z8printIntiii>
    80003000:	00005517          	auipc	a0,0x5
    80003004:	38850513          	addi	a0,a0,904 # 80008388 <CONSOLE_STATUS+0x378>
    80003008:	00001097          	auipc	ra,0x1
    8000300c:	e3c080e7          	jalr	-452(ra) # 80003e44 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80003010:	0014849b          	addiw	s1,s1,1
    80003014:	0ff4f493          	andi	s1,s1,255
    80003018:	00200793          	li	a5,2
    8000301c:	fc97f0e3          	bgeu	a5,s1,80002fdc <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80003020:	00005517          	auipc	a0,0x5
    80003024:	12050513          	addi	a0,a0,288 # 80008140 <CONSOLE_STATUS+0x130>
    80003028:	00001097          	auipc	ra,0x1
    8000302c:	e1c080e7          	jalr	-484(ra) # 80003e44 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80003030:	00700313          	li	t1,7
    thread_dispatch();
    80003034:	ffffe097          	auipc	ra,0xffffe
    80003038:	658080e7          	jalr	1624(ra) # 8000168c <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    8000303c:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80003040:	00005517          	auipc	a0,0x5
    80003044:	11050513          	addi	a0,a0,272 # 80008150 <CONSOLE_STATUS+0x140>
    80003048:	00001097          	auipc	ra,0x1
    8000304c:	dfc080e7          	jalr	-516(ra) # 80003e44 <_Z11printStringPKc>
    80003050:	00000613          	li	a2,0
    80003054:	00a00593          	li	a1,10
    80003058:	0009051b          	sext.w	a0,s2
    8000305c:	00001097          	auipc	ra,0x1
    80003060:	f98080e7          	jalr	-104(ra) # 80003ff4 <_Z8printIntiii>
    80003064:	00005517          	auipc	a0,0x5
    80003068:	32450513          	addi	a0,a0,804 # 80008388 <CONSOLE_STATUS+0x378>
    8000306c:	00001097          	auipc	ra,0x1
    80003070:	dd8080e7          	jalr	-552(ra) # 80003e44 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80003074:	00c00513          	li	a0,12
    80003078:	00000097          	auipc	ra,0x0
    8000307c:	d88080e7          	jalr	-632(ra) # 80002e00 <_ZL9fibonaccim>
    80003080:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80003084:	00005517          	auipc	a0,0x5
    80003088:	0d450513          	addi	a0,a0,212 # 80008158 <CONSOLE_STATUS+0x148>
    8000308c:	00001097          	auipc	ra,0x1
    80003090:	db8080e7          	jalr	-584(ra) # 80003e44 <_Z11printStringPKc>
    80003094:	00000613          	li	a2,0
    80003098:	00a00593          	li	a1,10
    8000309c:	0009051b          	sext.w	a0,s2
    800030a0:	00001097          	auipc	ra,0x1
    800030a4:	f54080e7          	jalr	-172(ra) # 80003ff4 <_Z8printIntiii>
    800030a8:	00005517          	auipc	a0,0x5
    800030ac:	2e050513          	addi	a0,a0,736 # 80008388 <CONSOLE_STATUS+0x378>
    800030b0:	00001097          	auipc	ra,0x1
    800030b4:	d94080e7          	jalr	-620(ra) # 80003e44 <_Z11printStringPKc>
    800030b8:	0400006f          	j	800030f8 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800030bc:	00005517          	auipc	a0,0x5
    800030c0:	07c50513          	addi	a0,a0,124 # 80008138 <CONSOLE_STATUS+0x128>
    800030c4:	00001097          	auipc	ra,0x1
    800030c8:	d80080e7          	jalr	-640(ra) # 80003e44 <_Z11printStringPKc>
    800030cc:	00000613          	li	a2,0
    800030d0:	00a00593          	li	a1,10
    800030d4:	00048513          	mv	a0,s1
    800030d8:	00001097          	auipc	ra,0x1
    800030dc:	f1c080e7          	jalr	-228(ra) # 80003ff4 <_Z8printIntiii>
    800030e0:	00005517          	auipc	a0,0x5
    800030e4:	2a850513          	addi	a0,a0,680 # 80008388 <CONSOLE_STATUS+0x378>
    800030e8:	00001097          	auipc	ra,0x1
    800030ec:	d5c080e7          	jalr	-676(ra) # 80003e44 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800030f0:	0014849b          	addiw	s1,s1,1
    800030f4:	0ff4f493          	andi	s1,s1,255
    800030f8:	00500793          	li	a5,5
    800030fc:	fc97f0e3          	bgeu	a5,s1,800030bc <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80003100:	00005517          	auipc	a0,0x5
    80003104:	01050513          	addi	a0,a0,16 # 80008110 <CONSOLE_STATUS+0x100>
    80003108:	00001097          	auipc	ra,0x1
    8000310c:	d3c080e7          	jalr	-708(ra) # 80003e44 <_Z11printStringPKc>
    finishedC = true;
    80003110:	00100793          	li	a5,1
    80003114:	00007717          	auipc	a4,0x7
    80003118:	4af70ca3          	sb	a5,1209(a4) # 8000a5cd <_ZL9finishedC>
    thread_dispatch();
    8000311c:	ffffe097          	auipc	ra,0xffffe
    80003120:	570080e7          	jalr	1392(ra) # 8000168c <_Z15thread_dispatchv>
}
    80003124:	01813083          	ld	ra,24(sp)
    80003128:	01013403          	ld	s0,16(sp)
    8000312c:	00813483          	ld	s1,8(sp)
    80003130:	00013903          	ld	s2,0(sp)
    80003134:	02010113          	addi	sp,sp,32
    80003138:	00008067          	ret

000000008000313c <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    8000313c:	fe010113          	addi	sp,sp,-32
    80003140:	00113c23          	sd	ra,24(sp)
    80003144:	00813823          	sd	s0,16(sp)
    80003148:	00913423          	sd	s1,8(sp)
    8000314c:	01213023          	sd	s2,0(sp)
    80003150:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003154:	00000913          	li	s2,0
    80003158:	0380006f          	j	80003190 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    8000315c:	ffffe097          	auipc	ra,0xffffe
    80003160:	530080e7          	jalr	1328(ra) # 8000168c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003164:	00148493          	addi	s1,s1,1
    80003168:	000027b7          	lui	a5,0x2
    8000316c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003170:	0097ee63          	bltu	a5,s1,8000318c <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003174:	00000713          	li	a4,0
    80003178:	000077b7          	lui	a5,0x7
    8000317c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003180:	fce7eee3          	bltu	a5,a4,8000315c <_ZL11workerBodyBPv+0x20>
    80003184:	00170713          	addi	a4,a4,1
    80003188:	ff1ff06f          	j	80003178 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    8000318c:	00190913          	addi	s2,s2,1
    80003190:	00f00793          	li	a5,15
    80003194:	0527e063          	bltu	a5,s2,800031d4 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003198:	00005517          	auipc	a0,0x5
    8000319c:	f8850513          	addi	a0,a0,-120 # 80008120 <CONSOLE_STATUS+0x110>
    800031a0:	00001097          	auipc	ra,0x1
    800031a4:	ca4080e7          	jalr	-860(ra) # 80003e44 <_Z11printStringPKc>
    800031a8:	00000613          	li	a2,0
    800031ac:	00a00593          	li	a1,10
    800031b0:	0009051b          	sext.w	a0,s2
    800031b4:	00001097          	auipc	ra,0x1
    800031b8:	e40080e7          	jalr	-448(ra) # 80003ff4 <_Z8printIntiii>
    800031bc:	00005517          	auipc	a0,0x5
    800031c0:	1cc50513          	addi	a0,a0,460 # 80008388 <CONSOLE_STATUS+0x378>
    800031c4:	00001097          	auipc	ra,0x1
    800031c8:	c80080e7          	jalr	-896(ra) # 80003e44 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800031cc:	00000493          	li	s1,0
    800031d0:	f99ff06f          	j	80003168 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    800031d4:	00005517          	auipc	a0,0x5
    800031d8:	f5450513          	addi	a0,a0,-172 # 80008128 <CONSOLE_STATUS+0x118>
    800031dc:	00001097          	auipc	ra,0x1
    800031e0:	c68080e7          	jalr	-920(ra) # 80003e44 <_Z11printStringPKc>
    finishedB = true;
    800031e4:	00100793          	li	a5,1
    800031e8:	00007717          	auipc	a4,0x7
    800031ec:	3ef70323          	sb	a5,998(a4) # 8000a5ce <_ZL9finishedB>
    thread_dispatch();
    800031f0:	ffffe097          	auipc	ra,0xffffe
    800031f4:	49c080e7          	jalr	1180(ra) # 8000168c <_Z15thread_dispatchv>
}
    800031f8:	01813083          	ld	ra,24(sp)
    800031fc:	01013403          	ld	s0,16(sp)
    80003200:	00813483          	ld	s1,8(sp)
    80003204:	00013903          	ld	s2,0(sp)
    80003208:	02010113          	addi	sp,sp,32
    8000320c:	00008067          	ret

0000000080003210 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80003210:	fe010113          	addi	sp,sp,-32
    80003214:	00113c23          	sd	ra,24(sp)
    80003218:	00813823          	sd	s0,16(sp)
    8000321c:	00913423          	sd	s1,8(sp)
    80003220:	01213023          	sd	s2,0(sp)
    80003224:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003228:	00000913          	li	s2,0
    8000322c:	0380006f          	j	80003264 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80003230:	ffffe097          	auipc	ra,0xffffe
    80003234:	45c080e7          	jalr	1116(ra) # 8000168c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003238:	00148493          	addi	s1,s1,1
    8000323c:	000027b7          	lui	a5,0x2
    80003240:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003244:	0097ee63          	bltu	a5,s1,80003260 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003248:	00000713          	li	a4,0
    8000324c:	000077b7          	lui	a5,0x7
    80003250:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003254:	fce7eee3          	bltu	a5,a4,80003230 <_ZL11workerBodyAPv+0x20>
    80003258:	00170713          	addi	a4,a4,1
    8000325c:	ff1ff06f          	j	8000324c <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003260:	00190913          	addi	s2,s2,1
    80003264:	00900793          	li	a5,9
    80003268:	0527e063          	bltu	a5,s2,800032a8 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    8000326c:	00005517          	auipc	a0,0x5
    80003270:	e9c50513          	addi	a0,a0,-356 # 80008108 <CONSOLE_STATUS+0xf8>
    80003274:	00001097          	auipc	ra,0x1
    80003278:	bd0080e7          	jalr	-1072(ra) # 80003e44 <_Z11printStringPKc>
    8000327c:	00000613          	li	a2,0
    80003280:	00a00593          	li	a1,10
    80003284:	0009051b          	sext.w	a0,s2
    80003288:	00001097          	auipc	ra,0x1
    8000328c:	d6c080e7          	jalr	-660(ra) # 80003ff4 <_Z8printIntiii>
    80003290:	00005517          	auipc	a0,0x5
    80003294:	0f850513          	addi	a0,a0,248 # 80008388 <CONSOLE_STATUS+0x378>
    80003298:	00001097          	auipc	ra,0x1
    8000329c:	bac080e7          	jalr	-1108(ra) # 80003e44 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800032a0:	00000493          	li	s1,0
    800032a4:	f99ff06f          	j	8000323c <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    800032a8:	00005517          	auipc	a0,0x5
    800032ac:	e6850513          	addi	a0,a0,-408 # 80008110 <CONSOLE_STATUS+0x100>
    800032b0:	00001097          	auipc	ra,0x1
    800032b4:	b94080e7          	jalr	-1132(ra) # 80003e44 <_Z11printStringPKc>
    finishedA = true;
    800032b8:	00100793          	li	a5,1
    800032bc:	00007717          	auipc	a4,0x7
    800032c0:	30f709a3          	sb	a5,787(a4) # 8000a5cf <_ZL9finishedA>
}
    800032c4:	01813083          	ld	ra,24(sp)
    800032c8:	01013403          	ld	s0,16(sp)
    800032cc:	00813483          	ld	s1,8(sp)
    800032d0:	00013903          	ld	s2,0(sp)
    800032d4:	02010113          	addi	sp,sp,32
    800032d8:	00008067          	ret

00000000800032dc <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    800032dc:	fd010113          	addi	sp,sp,-48
    800032e0:	02113423          	sd	ra,40(sp)
    800032e4:	02813023          	sd	s0,32(sp)
    800032e8:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    800032ec:	00000613          	li	a2,0
    800032f0:	00000597          	auipc	a1,0x0
    800032f4:	f2058593          	addi	a1,a1,-224 # 80003210 <_ZL11workerBodyAPv>
    800032f8:	fd040513          	addi	a0,s0,-48
    800032fc:	ffffe097          	auipc	ra,0xffffe
    80003300:	268080e7          	jalr	616(ra) # 80001564 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadA created\n");
    80003304:	00005517          	auipc	a0,0x5
    80003308:	e9c50513          	addi	a0,a0,-356 # 800081a0 <CONSOLE_STATUS+0x190>
    8000330c:	00001097          	auipc	ra,0x1
    80003310:	b38080e7          	jalr	-1224(ra) # 80003e44 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80003314:	00000613          	li	a2,0
    80003318:	00000597          	auipc	a1,0x0
    8000331c:	e2458593          	addi	a1,a1,-476 # 8000313c <_ZL11workerBodyBPv>
    80003320:	fd840513          	addi	a0,s0,-40
    80003324:	ffffe097          	auipc	ra,0xffffe
    80003328:	240080e7          	jalr	576(ra) # 80001564 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadB created\n");
    8000332c:	00005517          	auipc	a0,0x5
    80003330:	e8c50513          	addi	a0,a0,-372 # 800081b8 <CONSOLE_STATUS+0x1a8>
    80003334:	00001097          	auipc	ra,0x1
    80003338:	b10080e7          	jalr	-1264(ra) # 80003e44 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    8000333c:	00000613          	li	a2,0
    80003340:	00000597          	auipc	a1,0x0
    80003344:	c7c58593          	addi	a1,a1,-900 # 80002fbc <_ZL11workerBodyCPv>
    80003348:	fe040513          	addi	a0,s0,-32
    8000334c:	ffffe097          	auipc	ra,0xffffe
    80003350:	218080e7          	jalr	536(ra) # 80001564 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadC created\n");
    80003354:	00005517          	auipc	a0,0x5
    80003358:	e7c50513          	addi	a0,a0,-388 # 800081d0 <CONSOLE_STATUS+0x1c0>
    8000335c:	00001097          	auipc	ra,0x1
    80003360:	ae8080e7          	jalr	-1304(ra) # 80003e44 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80003364:	00000613          	li	a2,0
    80003368:	00000597          	auipc	a1,0x0
    8000336c:	b0c58593          	addi	a1,a1,-1268 # 80002e74 <_ZL11workerBodyDPv>
    80003370:	fe840513          	addi	a0,s0,-24
    80003374:	ffffe097          	auipc	ra,0xffffe
    80003378:	1f0080e7          	jalr	496(ra) # 80001564 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadD created\n");
    8000337c:	00005517          	auipc	a0,0x5
    80003380:	e6c50513          	addi	a0,a0,-404 # 800081e8 <CONSOLE_STATUS+0x1d8>
    80003384:	00001097          	auipc	ra,0x1
    80003388:	ac0080e7          	jalr	-1344(ra) # 80003e44 <_Z11printStringPKc>
    8000338c:	00c0006f          	j	80003398 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80003390:	ffffe097          	auipc	ra,0xffffe
    80003394:	2fc080e7          	jalr	764(ra) # 8000168c <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80003398:	00007797          	auipc	a5,0x7
    8000339c:	2377c783          	lbu	a5,567(a5) # 8000a5cf <_ZL9finishedA>
    800033a0:	fe0788e3          	beqz	a5,80003390 <_Z18Threads_C_API_testv+0xb4>
    800033a4:	00007797          	auipc	a5,0x7
    800033a8:	22a7c783          	lbu	a5,554(a5) # 8000a5ce <_ZL9finishedB>
    800033ac:	fe0782e3          	beqz	a5,80003390 <_Z18Threads_C_API_testv+0xb4>
    800033b0:	00007797          	auipc	a5,0x7
    800033b4:	21d7c783          	lbu	a5,541(a5) # 8000a5cd <_ZL9finishedC>
    800033b8:	fc078ce3          	beqz	a5,80003390 <_Z18Threads_C_API_testv+0xb4>
    800033bc:	00007797          	auipc	a5,0x7
    800033c0:	2107c783          	lbu	a5,528(a5) # 8000a5cc <_ZL9finishedD>
    800033c4:	fc0786e3          	beqz	a5,80003390 <_Z18Threads_C_API_testv+0xb4>
    }

}
    800033c8:	02813083          	ld	ra,40(sp)
    800033cc:	02013403          	ld	s0,32(sp)
    800033d0:	03010113          	addi	sp,sp,48
    800033d4:	00008067          	ret

00000000800033d8 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    800033d8:	fd010113          	addi	sp,sp,-48
    800033dc:	02113423          	sd	ra,40(sp)
    800033e0:	02813023          	sd	s0,32(sp)
    800033e4:	00913c23          	sd	s1,24(sp)
    800033e8:	01213823          	sd	s2,16(sp)
    800033ec:	01313423          	sd	s3,8(sp)
    800033f0:	03010413          	addi	s0,sp,48
    800033f4:	00050993          	mv	s3,a0
    800033f8:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    800033fc:	00000913          	li	s2,0
    80003400:	00c0006f          	j	8000340c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x30) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80003404:	00001097          	auipc	ra,0x1
    80003408:	9bc080e7          	jalr	-1604(ra) # 80003dc0 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x30) {
    8000340c:	ffffe097          	auipc	ra,0xffffe
    80003410:	3f8080e7          	jalr	1016(ra) # 80001804 <_Z4getcv>
    80003414:	0005059b          	sext.w	a1,a0
    80003418:	03000793          	li	a5,48
    8000341c:	02f58a63          	beq	a1,a5,80003450 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80003420:	0084b503          	ld	a0,8(s1)
    80003424:	00001097          	auipc	ra,0x1
    80003428:	e44080e7          	jalr	-444(ra) # 80004268 <_ZN9BufferCPP3putEi>
        i++;
    8000342c:	0019071b          	addiw	a4,s2,1
    80003430:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003434:	0004a683          	lw	a3,0(s1)
    80003438:	0026979b          	slliw	a5,a3,0x2
    8000343c:	00d787bb          	addw	a5,a5,a3
    80003440:	0017979b          	slliw	a5,a5,0x1
    80003444:	02f767bb          	remw	a5,a4,a5
    80003448:	fc0792e3          	bnez	a5,8000340c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    8000344c:	fb9ff06f          	j	80003404 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80003450:	00100793          	li	a5,1
    80003454:	00007717          	auipc	a4,0x7
    80003458:	16f72e23          	sw	a5,380(a4) # 8000a5d0 <_ZL9threadEnd>
    td->buffer->put('!');
    8000345c:	0209b783          	ld	a5,32(s3)
    80003460:	02100593          	li	a1,33
    80003464:	0087b503          	ld	a0,8(a5)
    80003468:	00001097          	auipc	ra,0x1
    8000346c:	e00080e7          	jalr	-512(ra) # 80004268 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80003470:	0104b503          	ld	a0,16(s1)
    80003474:	fffff097          	auipc	ra,0xfffff
    80003478:	db8080e7          	jalr	-584(ra) # 8000222c <_ZN9Semaphore6signalEv>
}
    8000347c:	02813083          	ld	ra,40(sp)
    80003480:	02013403          	ld	s0,32(sp)
    80003484:	01813483          	ld	s1,24(sp)
    80003488:	01013903          	ld	s2,16(sp)
    8000348c:	00813983          	ld	s3,8(sp)
    80003490:	03010113          	addi	sp,sp,48
    80003494:	00008067          	ret

0000000080003498 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    80003498:	fe010113          	addi	sp,sp,-32
    8000349c:	00113c23          	sd	ra,24(sp)
    800034a0:	00813823          	sd	s0,16(sp)
    800034a4:	00913423          	sd	s1,8(sp)
    800034a8:	01213023          	sd	s2,0(sp)
    800034ac:	02010413          	addi	s0,sp,32
    800034b0:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800034b4:	00000913          	li	s2,0
    800034b8:	00c0006f          	j	800034c4 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    800034bc:	00001097          	auipc	ra,0x1
    800034c0:	904080e7          	jalr	-1788(ra) # 80003dc0 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    800034c4:	00007797          	auipc	a5,0x7
    800034c8:	10c7a783          	lw	a5,268(a5) # 8000a5d0 <_ZL9threadEnd>
    800034cc:	02079e63          	bnez	a5,80003508 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    800034d0:	0004a583          	lw	a1,0(s1)
    800034d4:	0305859b          	addiw	a1,a1,48
    800034d8:	0084b503          	ld	a0,8(s1)
    800034dc:	00001097          	auipc	ra,0x1
    800034e0:	d8c080e7          	jalr	-628(ra) # 80004268 <_ZN9BufferCPP3putEi>
        i++;
    800034e4:	0019071b          	addiw	a4,s2,1
    800034e8:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800034ec:	0004a683          	lw	a3,0(s1)
    800034f0:	0026979b          	slliw	a5,a3,0x2
    800034f4:	00d787bb          	addw	a5,a5,a3
    800034f8:	0017979b          	slliw	a5,a5,0x1
    800034fc:	02f767bb          	remw	a5,a4,a5
    80003500:	fc0792e3          	bnez	a5,800034c4 <_ZN12ProducerSync8producerEPv+0x2c>
    80003504:	fb9ff06f          	j	800034bc <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80003508:	0104b503          	ld	a0,16(s1)
    8000350c:	fffff097          	auipc	ra,0xfffff
    80003510:	d20080e7          	jalr	-736(ra) # 8000222c <_ZN9Semaphore6signalEv>
}
    80003514:	01813083          	ld	ra,24(sp)
    80003518:	01013403          	ld	s0,16(sp)
    8000351c:	00813483          	ld	s1,8(sp)
    80003520:	00013903          	ld	s2,0(sp)
    80003524:	02010113          	addi	sp,sp,32
    80003528:	00008067          	ret

000000008000352c <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    8000352c:	fd010113          	addi	sp,sp,-48
    80003530:	02113423          	sd	ra,40(sp)
    80003534:	02813023          	sd	s0,32(sp)
    80003538:	00913c23          	sd	s1,24(sp)
    8000353c:	01213823          	sd	s2,16(sp)
    80003540:	01313423          	sd	s3,8(sp)
    80003544:	01413023          	sd	s4,0(sp)
    80003548:	03010413          	addi	s0,sp,48
    8000354c:	00050993          	mv	s3,a0
    80003550:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003554:	00000a13          	li	s4,0
    80003558:	01c0006f          	j	80003574 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    8000355c:	00001097          	auipc	ra,0x1
    80003560:	864080e7          	jalr	-1948(ra) # 80003dc0 <_ZN6Thread8dispatchEv>
    80003564:	0500006f          	j	800035b4 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80003568:	00a00513          	li	a0,10
    8000356c:	ffffe097          	auipc	ra,0xffffe
    80003570:	2cc080e7          	jalr	716(ra) # 80001838 <_Z4putcc>
    while (!threadEnd) {
    80003574:	00007797          	auipc	a5,0x7
    80003578:	05c7a783          	lw	a5,92(a5) # 8000a5d0 <_ZL9threadEnd>
    8000357c:	06079263          	bnez	a5,800035e0 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80003580:	00893503          	ld	a0,8(s2)
    80003584:	00001097          	auipc	ra,0x1
    80003588:	d74080e7          	jalr	-652(ra) # 800042f8 <_ZN9BufferCPP3getEv>
        i++;
    8000358c:	001a049b          	addiw	s1,s4,1
    80003590:	00048a1b          	sext.w	s4,s1
        putc(key);
    80003594:	0ff57513          	andi	a0,a0,255
    80003598:	ffffe097          	auipc	ra,0xffffe
    8000359c:	2a0080e7          	jalr	672(ra) # 80001838 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    800035a0:	00092703          	lw	a4,0(s2)
    800035a4:	0027179b          	slliw	a5,a4,0x2
    800035a8:	00e787bb          	addw	a5,a5,a4
    800035ac:	02f4e7bb          	remw	a5,s1,a5
    800035b0:	fa0786e3          	beqz	a5,8000355c <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    800035b4:	05000793          	li	a5,80
    800035b8:	02f4e4bb          	remw	s1,s1,a5
    800035bc:	fa049ce3          	bnez	s1,80003574 <_ZN12ConsumerSync8consumerEPv+0x48>
    800035c0:	fa9ff06f          	j	80003568 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    800035c4:	0209b783          	ld	a5,32(s3)
    800035c8:	0087b503          	ld	a0,8(a5)
    800035cc:	00001097          	auipc	ra,0x1
    800035d0:	d2c080e7          	jalr	-724(ra) # 800042f8 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    800035d4:	0ff57513          	andi	a0,a0,255
    800035d8:	00001097          	auipc	ra,0x1
    800035dc:	17c080e7          	jalr	380(ra) # 80004754 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    800035e0:	0209b783          	ld	a5,32(s3)
    800035e4:	0087b503          	ld	a0,8(a5)
    800035e8:	00001097          	auipc	ra,0x1
    800035ec:	d9c080e7          	jalr	-612(ra) # 80004384 <_ZN9BufferCPP6getCntEv>
    800035f0:	fca04ae3          	bgtz	a0,800035c4 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    800035f4:	01093503          	ld	a0,16(s2)
    800035f8:	fffff097          	auipc	ra,0xfffff
    800035fc:	c34080e7          	jalr	-972(ra) # 8000222c <_ZN9Semaphore6signalEv>
}
    80003600:	02813083          	ld	ra,40(sp)
    80003604:	02013403          	ld	s0,32(sp)
    80003608:	01813483          	ld	s1,24(sp)
    8000360c:	01013903          	ld	s2,16(sp)
    80003610:	00813983          	ld	s3,8(sp)
    80003614:	00013a03          	ld	s4,0(sp)
    80003618:	03010113          	addi	sp,sp,48
    8000361c:	00008067          	ret

0000000080003620 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80003620:	f8010113          	addi	sp,sp,-128
    80003624:	06113c23          	sd	ra,120(sp)
    80003628:	06813823          	sd	s0,112(sp)
    8000362c:	06913423          	sd	s1,104(sp)
    80003630:	07213023          	sd	s2,96(sp)
    80003634:	05313c23          	sd	s3,88(sp)
    80003638:	05413823          	sd	s4,80(sp)
    8000363c:	05513423          	sd	s5,72(sp)
    80003640:	05613023          	sd	s6,64(sp)
    80003644:	03713c23          	sd	s7,56(sp)
    80003648:	03813823          	sd	s8,48(sp)
    8000364c:	03913423          	sd	s9,40(sp)
    80003650:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80003654:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80003658:	00005517          	auipc	a0,0x5
    8000365c:	9c850513          	addi	a0,a0,-1592 # 80008020 <CONSOLE_STATUS+0x10>
    80003660:	00000097          	auipc	ra,0x0
    80003664:	7e4080e7          	jalr	2020(ra) # 80003e44 <_Z11printStringPKc>
    getString(input, 30);
    80003668:	01e00593          	li	a1,30
    8000366c:	f8040493          	addi	s1,s0,-128
    80003670:	00048513          	mv	a0,s1
    80003674:	00001097          	auipc	ra,0x1
    80003678:	858080e7          	jalr	-1960(ra) # 80003ecc <_Z9getStringPci>
    threadNum = stringToInt(input);
    8000367c:	00048513          	mv	a0,s1
    80003680:	00001097          	auipc	ra,0x1
    80003684:	924080e7          	jalr	-1756(ra) # 80003fa4 <_Z11stringToIntPKc>
    80003688:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    8000368c:	00005517          	auipc	a0,0x5
    80003690:	9b450513          	addi	a0,a0,-1612 # 80008040 <CONSOLE_STATUS+0x30>
    80003694:	00000097          	auipc	ra,0x0
    80003698:	7b0080e7          	jalr	1968(ra) # 80003e44 <_Z11printStringPKc>
    getString(input, 30);
    8000369c:	01e00593          	li	a1,30
    800036a0:	00048513          	mv	a0,s1
    800036a4:	00001097          	auipc	ra,0x1
    800036a8:	828080e7          	jalr	-2008(ra) # 80003ecc <_Z9getStringPci>
    n = stringToInt(input);
    800036ac:	00048513          	mv	a0,s1
    800036b0:	00001097          	auipc	ra,0x1
    800036b4:	8f4080e7          	jalr	-1804(ra) # 80003fa4 <_Z11stringToIntPKc>
    800036b8:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    800036bc:	00005517          	auipc	a0,0x5
    800036c0:	9a450513          	addi	a0,a0,-1628 # 80008060 <CONSOLE_STATUS+0x50>
    800036c4:	00000097          	auipc	ra,0x0
    800036c8:	780080e7          	jalr	1920(ra) # 80003e44 <_Z11printStringPKc>
    800036cc:	00000613          	li	a2,0
    800036d0:	00a00593          	li	a1,10
    800036d4:	00090513          	mv	a0,s2
    800036d8:	00001097          	auipc	ra,0x1
    800036dc:	91c080e7          	jalr	-1764(ra) # 80003ff4 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    800036e0:	00005517          	auipc	a0,0x5
    800036e4:	99850513          	addi	a0,a0,-1640 # 80008078 <CONSOLE_STATUS+0x68>
    800036e8:	00000097          	auipc	ra,0x0
    800036ec:	75c080e7          	jalr	1884(ra) # 80003e44 <_Z11printStringPKc>
    800036f0:	00000613          	li	a2,0
    800036f4:	00a00593          	li	a1,10
    800036f8:	00048513          	mv	a0,s1
    800036fc:	00001097          	auipc	ra,0x1
    80003700:	8f8080e7          	jalr	-1800(ra) # 80003ff4 <_Z8printIntiii>
    printString(".\n");
    80003704:	00005517          	auipc	a0,0x5
    80003708:	98c50513          	addi	a0,a0,-1652 # 80008090 <CONSOLE_STATUS+0x80>
    8000370c:	00000097          	auipc	ra,0x0
    80003710:	738080e7          	jalr	1848(ra) # 80003e44 <_Z11printStringPKc>
    if(threadNum > n) {
    80003714:	0324c463          	blt	s1,s2,8000373c <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80003718:	03205c63          	blez	s2,80003750 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    8000371c:	03800513          	li	a0,56
    80003720:	00001097          	auipc	ra,0x1
    80003724:	1e8080e7          	jalr	488(ra) # 80004908 <_Znwm>
    80003728:	00050a93          	mv	s5,a0
    8000372c:	00048593          	mv	a1,s1
    80003730:	00001097          	auipc	ra,0x1
    80003734:	9e4080e7          	jalr	-1564(ra) # 80004114 <_ZN9BufferCPPC1Ei>
    80003738:	0300006f          	j	80003768 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    8000373c:	00005517          	auipc	a0,0x5
    80003740:	95c50513          	addi	a0,a0,-1700 # 80008098 <CONSOLE_STATUS+0x88>
    80003744:	00000097          	auipc	ra,0x0
    80003748:	700080e7          	jalr	1792(ra) # 80003e44 <_Z11printStringPKc>
        return;
    8000374c:	0140006f          	j	80003760 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80003750:	00005517          	auipc	a0,0x5
    80003754:	98850513          	addi	a0,a0,-1656 # 800080d8 <CONSOLE_STATUS+0xc8>
    80003758:	00000097          	auipc	ra,0x0
    8000375c:	6ec080e7          	jalr	1772(ra) # 80003e44 <_Z11printStringPKc>
        return;
    80003760:	000b8113          	mv	sp,s7
    80003764:	2380006f          	j	8000399c <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80003768:	01000513          	li	a0,16
    8000376c:	00001097          	auipc	ra,0x1
    80003770:	19c080e7          	jalr	412(ra) # 80004908 <_Znwm>
    80003774:	00050493          	mv	s1,a0
    80003778:	00000593          	li	a1,0
    8000377c:	fffff097          	auipc	ra,0xfffff
    80003780:	a4c080e7          	jalr	-1460(ra) # 800021c8 <_ZN9SemaphoreC1Ej>
    80003784:	00007797          	auipc	a5,0x7
    80003788:	e497ba23          	sd	s1,-428(a5) # 8000a5d8 <_ZL10waitForAll>
    Thread* threads[threadNum];
    8000378c:	00391793          	slli	a5,s2,0x3
    80003790:	00f78793          	addi	a5,a5,15
    80003794:	ff07f793          	andi	a5,a5,-16
    80003798:	40f10133          	sub	sp,sp,a5
    8000379c:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    800037a0:	0019071b          	addiw	a4,s2,1
    800037a4:	00171793          	slli	a5,a4,0x1
    800037a8:	00e787b3          	add	a5,a5,a4
    800037ac:	00379793          	slli	a5,a5,0x3
    800037b0:	00f78793          	addi	a5,a5,15
    800037b4:	ff07f793          	andi	a5,a5,-16
    800037b8:	40f10133          	sub	sp,sp,a5
    800037bc:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    800037c0:	00191c13          	slli	s8,s2,0x1
    800037c4:	012c07b3          	add	a5,s8,s2
    800037c8:	00379793          	slli	a5,a5,0x3
    800037cc:	00fa07b3          	add	a5,s4,a5
    800037d0:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    800037d4:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    800037d8:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    800037dc:	02800513          	li	a0,40
    800037e0:	00001097          	auipc	ra,0x1
    800037e4:	128080e7          	jalr	296(ra) # 80004908 <_Znwm>
    800037e8:	00050b13          	mv	s6,a0
    800037ec:	012c0c33          	add	s8,s8,s2
    800037f0:	003c1c13          	slli	s8,s8,0x3
    800037f4:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    800037f8:	00000097          	auipc	ra,0x0
    800037fc:	5f0080e7          	jalr	1520(ra) # 80003de8 <_ZN6ThreadC1Ev>
    80003800:	00007797          	auipc	a5,0x7
    80003804:	cd878793          	addi	a5,a5,-808 # 8000a4d8 <_ZTV12ConsumerSync+0x10>
    80003808:	00fb3023          	sd	a5,0(s6)
    8000380c:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80003810:	000b0513          	mv	a0,s6
    80003814:	00000097          	auipc	ra,0x0
    80003818:	554080e7          	jalr	1364(ra) # 80003d68 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    8000381c:	00000493          	li	s1,0
    80003820:	0380006f          	j	80003858 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80003824:	00007797          	auipc	a5,0x7
    80003828:	c8c78793          	addi	a5,a5,-884 # 8000a4b0 <_ZTV12ProducerSync+0x10>
    8000382c:	00fcb023          	sd	a5,0(s9)
    80003830:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80003834:	00349793          	slli	a5,s1,0x3
    80003838:	00f987b3          	add	a5,s3,a5
    8000383c:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80003840:	00349793          	slli	a5,s1,0x3
    80003844:	00f987b3          	add	a5,s3,a5
    80003848:	0007b503          	ld	a0,0(a5)
    8000384c:	00000097          	auipc	ra,0x0
    80003850:	51c080e7          	jalr	1308(ra) # 80003d68 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80003854:	0014849b          	addiw	s1,s1,1
    80003858:	0b24d063          	bge	s1,s2,800038f8 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    8000385c:	00149793          	slli	a5,s1,0x1
    80003860:	009787b3          	add	a5,a5,s1
    80003864:	00379793          	slli	a5,a5,0x3
    80003868:	00fa07b3          	add	a5,s4,a5
    8000386c:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80003870:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80003874:	00007717          	auipc	a4,0x7
    80003878:	d6473703          	ld	a4,-668(a4) # 8000a5d8 <_ZL10waitForAll>
    8000387c:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80003880:	02905863          	blez	s1,800038b0 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80003884:	02800513          	li	a0,40
    80003888:	00001097          	auipc	ra,0x1
    8000388c:	080080e7          	jalr	128(ra) # 80004908 <_Znwm>
    80003890:	00050c93          	mv	s9,a0
    80003894:	00149c13          	slli	s8,s1,0x1
    80003898:	009c0c33          	add	s8,s8,s1
    8000389c:	003c1c13          	slli	s8,s8,0x3
    800038a0:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    800038a4:	00000097          	auipc	ra,0x0
    800038a8:	544080e7          	jalr	1348(ra) # 80003de8 <_ZN6ThreadC1Ev>
    800038ac:	f79ff06f          	j	80003824 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    800038b0:	02800513          	li	a0,40
    800038b4:	00001097          	auipc	ra,0x1
    800038b8:	054080e7          	jalr	84(ra) # 80004908 <_Znwm>
    800038bc:	00050c93          	mv	s9,a0
    800038c0:	00149c13          	slli	s8,s1,0x1
    800038c4:	009c0c33          	add	s8,s8,s1
    800038c8:	003c1c13          	slli	s8,s8,0x3
    800038cc:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    800038d0:	00000097          	auipc	ra,0x0
    800038d4:	518080e7          	jalr	1304(ra) # 80003de8 <_ZN6ThreadC1Ev>
    800038d8:	00007797          	auipc	a5,0x7
    800038dc:	bb078793          	addi	a5,a5,-1104 # 8000a488 <_ZTV16ProducerKeyboard+0x10>
    800038e0:	00fcb023          	sd	a5,0(s9)
    800038e4:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    800038e8:	00349793          	slli	a5,s1,0x3
    800038ec:	00f987b3          	add	a5,s3,a5
    800038f0:	0197b023          	sd	s9,0(a5)
    800038f4:	f4dff06f          	j	80003840 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    800038f8:	00000097          	auipc	ra,0x0
    800038fc:	4c8080e7          	jalr	1224(ra) # 80003dc0 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80003900:	00000493          	li	s1,0
    80003904:	00994e63          	blt	s2,s1,80003920 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80003908:	00007517          	auipc	a0,0x7
    8000390c:	cd053503          	ld	a0,-816(a0) # 8000a5d8 <_ZL10waitForAll>
    80003910:	fffff097          	auipc	ra,0xfffff
    80003914:	8f0080e7          	jalr	-1808(ra) # 80002200 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80003918:	0014849b          	addiw	s1,s1,1
    8000391c:	fe9ff06f          	j	80003904 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80003920:	00000493          	li	s1,0
    80003924:	0080006f          	j	8000392c <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80003928:	0014849b          	addiw	s1,s1,1
    8000392c:	0324d263          	bge	s1,s2,80003950 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80003930:	00349793          	slli	a5,s1,0x3
    80003934:	00f987b3          	add	a5,s3,a5
    80003938:	0007b503          	ld	a0,0(a5)
    8000393c:	fe0506e3          	beqz	a0,80003928 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80003940:	00053783          	ld	a5,0(a0)
    80003944:	0087b783          	ld	a5,8(a5)
    80003948:	000780e7          	jalr	a5
    8000394c:	fddff06f          	j	80003928 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80003950:	000b0a63          	beqz	s6,80003964 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80003954:	000b3783          	ld	a5,0(s6)
    80003958:	0087b783          	ld	a5,8(a5)
    8000395c:	000b0513          	mv	a0,s6
    80003960:	000780e7          	jalr	a5
    delete waitForAll;
    80003964:	00007517          	auipc	a0,0x7
    80003968:	c7453503          	ld	a0,-908(a0) # 8000a5d8 <_ZL10waitForAll>
    8000396c:	00050863          	beqz	a0,8000397c <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80003970:	00053783          	ld	a5,0(a0)
    80003974:	0087b783          	ld	a5,8(a5)
    80003978:	000780e7          	jalr	a5
    delete buffer;
    8000397c:	000a8e63          	beqz	s5,80003998 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80003980:	000a8513          	mv	a0,s5
    80003984:	00001097          	auipc	ra,0x1
    80003988:	a88080e7          	jalr	-1400(ra) # 8000440c <_ZN9BufferCPPD1Ev>
    8000398c:	000a8513          	mv	a0,s5
    80003990:	00001097          	auipc	ra,0x1
    80003994:	fc8080e7          	jalr	-56(ra) # 80004958 <_ZdlPv>
    80003998:	000b8113          	mv	sp,s7

}
    8000399c:	f8040113          	addi	sp,s0,-128
    800039a0:	07813083          	ld	ra,120(sp)
    800039a4:	07013403          	ld	s0,112(sp)
    800039a8:	06813483          	ld	s1,104(sp)
    800039ac:	06013903          	ld	s2,96(sp)
    800039b0:	05813983          	ld	s3,88(sp)
    800039b4:	05013a03          	ld	s4,80(sp)
    800039b8:	04813a83          	ld	s5,72(sp)
    800039bc:	04013b03          	ld	s6,64(sp)
    800039c0:	03813b83          	ld	s7,56(sp)
    800039c4:	03013c03          	ld	s8,48(sp)
    800039c8:	02813c83          	ld	s9,40(sp)
    800039cc:	08010113          	addi	sp,sp,128
    800039d0:	00008067          	ret
    800039d4:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    800039d8:	000a8513          	mv	a0,s5
    800039dc:	00001097          	auipc	ra,0x1
    800039e0:	f7c080e7          	jalr	-132(ra) # 80004958 <_ZdlPv>
    800039e4:	00048513          	mv	a0,s1
    800039e8:	00008097          	auipc	ra,0x8
    800039ec:	d00080e7          	jalr	-768(ra) # 8000b6e8 <_Unwind_Resume>
    800039f0:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    800039f4:	00048513          	mv	a0,s1
    800039f8:	00001097          	auipc	ra,0x1
    800039fc:	f60080e7          	jalr	-160(ra) # 80004958 <_ZdlPv>
    80003a00:	00090513          	mv	a0,s2
    80003a04:	00008097          	auipc	ra,0x8
    80003a08:	ce4080e7          	jalr	-796(ra) # 8000b6e8 <_Unwind_Resume>
    80003a0c:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80003a10:	000b0513          	mv	a0,s6
    80003a14:	00001097          	auipc	ra,0x1
    80003a18:	f44080e7          	jalr	-188(ra) # 80004958 <_ZdlPv>
    80003a1c:	00048513          	mv	a0,s1
    80003a20:	00008097          	auipc	ra,0x8
    80003a24:	cc8080e7          	jalr	-824(ra) # 8000b6e8 <_Unwind_Resume>
    80003a28:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80003a2c:	000c8513          	mv	a0,s9
    80003a30:	00001097          	auipc	ra,0x1
    80003a34:	f28080e7          	jalr	-216(ra) # 80004958 <_ZdlPv>
    80003a38:	00048513          	mv	a0,s1
    80003a3c:	00008097          	auipc	ra,0x8
    80003a40:	cac080e7          	jalr	-852(ra) # 8000b6e8 <_Unwind_Resume>
    80003a44:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80003a48:	000c8513          	mv	a0,s9
    80003a4c:	00001097          	auipc	ra,0x1
    80003a50:	f0c080e7          	jalr	-244(ra) # 80004958 <_ZdlPv>
    80003a54:	00048513          	mv	a0,s1
    80003a58:	00008097          	auipc	ra,0x8
    80003a5c:	c90080e7          	jalr	-880(ra) # 8000b6e8 <_Unwind_Resume>

0000000080003a60 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80003a60:	ff010113          	addi	sp,sp,-16
    80003a64:	00113423          	sd	ra,8(sp)
    80003a68:	00813023          	sd	s0,0(sp)
    80003a6c:	01010413          	addi	s0,sp,16
    80003a70:	00007797          	auipc	a5,0x7
    80003a74:	a6878793          	addi	a5,a5,-1432 # 8000a4d8 <_ZTV12ConsumerSync+0x10>
    80003a78:	00f53023          	sd	a5,0(a0)
    80003a7c:	00000097          	auipc	ra,0x0
    80003a80:	21c080e7          	jalr	540(ra) # 80003c98 <_ZN6ThreadD1Ev>
    80003a84:	00813083          	ld	ra,8(sp)
    80003a88:	00013403          	ld	s0,0(sp)
    80003a8c:	01010113          	addi	sp,sp,16
    80003a90:	00008067          	ret

0000000080003a94 <_ZN12ConsumerSyncD0Ev>:
    80003a94:	fe010113          	addi	sp,sp,-32
    80003a98:	00113c23          	sd	ra,24(sp)
    80003a9c:	00813823          	sd	s0,16(sp)
    80003aa0:	00913423          	sd	s1,8(sp)
    80003aa4:	02010413          	addi	s0,sp,32
    80003aa8:	00050493          	mv	s1,a0
    80003aac:	00007797          	auipc	a5,0x7
    80003ab0:	a2c78793          	addi	a5,a5,-1492 # 8000a4d8 <_ZTV12ConsumerSync+0x10>
    80003ab4:	00f53023          	sd	a5,0(a0)
    80003ab8:	00000097          	auipc	ra,0x0
    80003abc:	1e0080e7          	jalr	480(ra) # 80003c98 <_ZN6ThreadD1Ev>
    80003ac0:	00048513          	mv	a0,s1
    80003ac4:	00001097          	auipc	ra,0x1
    80003ac8:	e94080e7          	jalr	-364(ra) # 80004958 <_ZdlPv>
    80003acc:	01813083          	ld	ra,24(sp)
    80003ad0:	01013403          	ld	s0,16(sp)
    80003ad4:	00813483          	ld	s1,8(sp)
    80003ad8:	02010113          	addi	sp,sp,32
    80003adc:	00008067          	ret

0000000080003ae0 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80003ae0:	ff010113          	addi	sp,sp,-16
    80003ae4:	00113423          	sd	ra,8(sp)
    80003ae8:	00813023          	sd	s0,0(sp)
    80003aec:	01010413          	addi	s0,sp,16
    80003af0:	00007797          	auipc	a5,0x7
    80003af4:	9c078793          	addi	a5,a5,-1600 # 8000a4b0 <_ZTV12ProducerSync+0x10>
    80003af8:	00f53023          	sd	a5,0(a0)
    80003afc:	00000097          	auipc	ra,0x0
    80003b00:	19c080e7          	jalr	412(ra) # 80003c98 <_ZN6ThreadD1Ev>
    80003b04:	00813083          	ld	ra,8(sp)
    80003b08:	00013403          	ld	s0,0(sp)
    80003b0c:	01010113          	addi	sp,sp,16
    80003b10:	00008067          	ret

0000000080003b14 <_ZN12ProducerSyncD0Ev>:
    80003b14:	fe010113          	addi	sp,sp,-32
    80003b18:	00113c23          	sd	ra,24(sp)
    80003b1c:	00813823          	sd	s0,16(sp)
    80003b20:	00913423          	sd	s1,8(sp)
    80003b24:	02010413          	addi	s0,sp,32
    80003b28:	00050493          	mv	s1,a0
    80003b2c:	00007797          	auipc	a5,0x7
    80003b30:	98478793          	addi	a5,a5,-1660 # 8000a4b0 <_ZTV12ProducerSync+0x10>
    80003b34:	00f53023          	sd	a5,0(a0)
    80003b38:	00000097          	auipc	ra,0x0
    80003b3c:	160080e7          	jalr	352(ra) # 80003c98 <_ZN6ThreadD1Ev>
    80003b40:	00048513          	mv	a0,s1
    80003b44:	00001097          	auipc	ra,0x1
    80003b48:	e14080e7          	jalr	-492(ra) # 80004958 <_ZdlPv>
    80003b4c:	01813083          	ld	ra,24(sp)
    80003b50:	01013403          	ld	s0,16(sp)
    80003b54:	00813483          	ld	s1,8(sp)
    80003b58:	02010113          	addi	sp,sp,32
    80003b5c:	00008067          	ret

0000000080003b60 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80003b60:	ff010113          	addi	sp,sp,-16
    80003b64:	00113423          	sd	ra,8(sp)
    80003b68:	00813023          	sd	s0,0(sp)
    80003b6c:	01010413          	addi	s0,sp,16
    80003b70:	00007797          	auipc	a5,0x7
    80003b74:	91878793          	addi	a5,a5,-1768 # 8000a488 <_ZTV16ProducerKeyboard+0x10>
    80003b78:	00f53023          	sd	a5,0(a0)
    80003b7c:	00000097          	auipc	ra,0x0
    80003b80:	11c080e7          	jalr	284(ra) # 80003c98 <_ZN6ThreadD1Ev>
    80003b84:	00813083          	ld	ra,8(sp)
    80003b88:	00013403          	ld	s0,0(sp)
    80003b8c:	01010113          	addi	sp,sp,16
    80003b90:	00008067          	ret

0000000080003b94 <_ZN16ProducerKeyboardD0Ev>:
    80003b94:	fe010113          	addi	sp,sp,-32
    80003b98:	00113c23          	sd	ra,24(sp)
    80003b9c:	00813823          	sd	s0,16(sp)
    80003ba0:	00913423          	sd	s1,8(sp)
    80003ba4:	02010413          	addi	s0,sp,32
    80003ba8:	00050493          	mv	s1,a0
    80003bac:	00007797          	auipc	a5,0x7
    80003bb0:	8dc78793          	addi	a5,a5,-1828 # 8000a488 <_ZTV16ProducerKeyboard+0x10>
    80003bb4:	00f53023          	sd	a5,0(a0)
    80003bb8:	00000097          	auipc	ra,0x0
    80003bbc:	0e0080e7          	jalr	224(ra) # 80003c98 <_ZN6ThreadD1Ev>
    80003bc0:	00048513          	mv	a0,s1
    80003bc4:	00001097          	auipc	ra,0x1
    80003bc8:	d94080e7          	jalr	-620(ra) # 80004958 <_ZdlPv>
    80003bcc:	01813083          	ld	ra,24(sp)
    80003bd0:	01013403          	ld	s0,16(sp)
    80003bd4:	00813483          	ld	s1,8(sp)
    80003bd8:	02010113          	addi	sp,sp,32
    80003bdc:	00008067          	ret

0000000080003be0 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80003be0:	ff010113          	addi	sp,sp,-16
    80003be4:	00113423          	sd	ra,8(sp)
    80003be8:	00813023          	sd	s0,0(sp)
    80003bec:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80003bf0:	02053583          	ld	a1,32(a0)
    80003bf4:	fffff097          	auipc	ra,0xfffff
    80003bf8:	7e4080e7          	jalr	2020(ra) # 800033d8 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80003bfc:	00813083          	ld	ra,8(sp)
    80003c00:	00013403          	ld	s0,0(sp)
    80003c04:	01010113          	addi	sp,sp,16
    80003c08:	00008067          	ret

0000000080003c0c <_ZN12ProducerSync3runEv>:
    void run() override {
    80003c0c:	ff010113          	addi	sp,sp,-16
    80003c10:	00113423          	sd	ra,8(sp)
    80003c14:	00813023          	sd	s0,0(sp)
    80003c18:	01010413          	addi	s0,sp,16
        producer(td);
    80003c1c:	02053583          	ld	a1,32(a0)
    80003c20:	00000097          	auipc	ra,0x0
    80003c24:	878080e7          	jalr	-1928(ra) # 80003498 <_ZN12ProducerSync8producerEPv>
    }
    80003c28:	00813083          	ld	ra,8(sp)
    80003c2c:	00013403          	ld	s0,0(sp)
    80003c30:	01010113          	addi	sp,sp,16
    80003c34:	00008067          	ret

0000000080003c38 <_ZN12ConsumerSync3runEv>:
    void run() override {
    80003c38:	ff010113          	addi	sp,sp,-16
    80003c3c:	00113423          	sd	ra,8(sp)
    80003c40:	00813023          	sd	s0,0(sp)
    80003c44:	01010413          	addi	s0,sp,16
        consumer(td);
    80003c48:	02053583          	ld	a1,32(a0)
    80003c4c:	00000097          	auipc	ra,0x0
    80003c50:	8e0080e7          	jalr	-1824(ra) # 8000352c <_ZN12ConsumerSync8consumerEPv>
    }
    80003c54:	00813083          	ld	ra,8(sp)
    80003c58:	00013403          	ld	s0,0(sp)
    80003c5c:	01010113          	addi	sp,sp,16
    80003c60:	00008067          	ret

0000000080003c64 <_ZN6Thread7wrapperEPv>:
void Thread::dispatch() {
    thread_dispatch();
}

void Thread::wrapper(void *args) {
    if(args){
    80003c64:	02050863          	beqz	a0,80003c94 <_ZN6Thread7wrapperEPv+0x30>
void Thread::wrapper(void *args) {
    80003c68:	ff010113          	addi	sp,sp,-16
    80003c6c:	00113423          	sd	ra,8(sp)
    80003c70:	00813023          	sd	s0,0(sp)
    80003c74:	01010413          	addi	s0,sp,16
        ((Thread*)args)->run();
    80003c78:	00053783          	ld	a5,0(a0)
    80003c7c:	0107b783          	ld	a5,16(a5)
    80003c80:	000780e7          	jalr	a5
    }
}
    80003c84:	00813083          	ld	ra,8(sp)
    80003c88:	00013403          	ld	s0,0(sp)
    80003c8c:	01010113          	addi	sp,sp,16
    80003c90:	00008067          	ret
    80003c94:	00008067          	ret

0000000080003c98 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    80003c98:	fe010113          	addi	sp,sp,-32
    80003c9c:	00113c23          	sd	ra,24(sp)
    80003ca0:	00813823          	sd	s0,16(sp)
    80003ca4:	00913423          	sd	s1,8(sp)
    80003ca8:	02010413          	addi	s0,sp,32
    80003cac:	00007797          	auipc	a5,0x7
    80003cb0:	85478793          	addi	a5,a5,-1964 # 8000a500 <_ZTV6Thread+0x10>
    80003cb4:	00f53023          	sd	a5,0(a0)
    delete this->myHandle;
    80003cb8:	00853483          	ld	s1,8(a0)
    80003cbc:	02048063          	beqz	s1,80003cdc <_ZN6ThreadD1Ev+0x44>
        delete[] stack;
    80003cc0:	0104b503          	ld	a0,16(s1)
    80003cc4:	00050663          	beqz	a0,80003cd0 <_ZN6ThreadD1Ev+0x38>
    80003cc8:	00001097          	auipc	ra,0x1
    80003ccc:	cb8080e7          	jalr	-840(ra) # 80004980 <_ZdaPv>
    80003cd0:	00048513          	mv	a0,s1
    80003cd4:	ffffe097          	auipc	ra,0xffffe
    80003cd8:	258080e7          	jalr	600(ra) # 80001f2c <_ZN7_threaddlEPv>
}
    80003cdc:	01813083          	ld	ra,24(sp)
    80003ce0:	01013403          	ld	s0,16(sp)
    80003ce4:	00813483          	ld	s1,8(sp)
    80003ce8:	02010113          	addi	sp,sp,32
    80003cec:	00008067          	ret

0000000080003cf0 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80003cf0:	fe010113          	addi	sp,sp,-32
    80003cf4:	00113c23          	sd	ra,24(sp)
    80003cf8:	00813823          	sd	s0,16(sp)
    80003cfc:	00913423          	sd	s1,8(sp)
    80003d00:	02010413          	addi	s0,sp,32
    80003d04:	00050493          	mv	s1,a0
}
    80003d08:	00000097          	auipc	ra,0x0
    80003d0c:	f90080e7          	jalr	-112(ra) # 80003c98 <_ZN6ThreadD1Ev>
    80003d10:	00048513          	mv	a0,s1
    80003d14:	00001097          	auipc	ra,0x1
    80003d18:	c44080e7          	jalr	-956(ra) # 80004958 <_ZdlPv>
    80003d1c:	01813083          	ld	ra,24(sp)
    80003d20:	01013403          	ld	s0,16(sp)
    80003d24:	00813483          	ld	s1,8(sp)
    80003d28:	02010113          	addi	sp,sp,32
    80003d2c:	00008067          	ret

0000000080003d30 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *args) {
    80003d30:	ff010113          	addi	sp,sp,-16
    80003d34:	00113423          	sd	ra,8(sp)
    80003d38:	00813023          	sd	s0,0(sp)
    80003d3c:	01010413          	addi	s0,sp,16
    80003d40:	00006797          	auipc	a5,0x6
    80003d44:	7c078793          	addi	a5,a5,1984 # 8000a500 <_ZTV6Thread+0x10>
    80003d48:	00f53023          	sd	a5,0(a0)
    thread_create(&this->myHandle, body, args);
    80003d4c:	00850513          	addi	a0,a0,8
    80003d50:	ffffe097          	auipc	ra,0xffffe
    80003d54:	814080e7          	jalr	-2028(ra) # 80001564 <_Z13thread_createPP7_threadPFvPvES2_>
}
    80003d58:	00813083          	ld	ra,8(sp)
    80003d5c:	00013403          	ld	s0,0(sp)
    80003d60:	01010113          	addi	sp,sp,16
    80003d64:	00008067          	ret

0000000080003d68 <_ZN6Thread5startEv>:
int Thread::start() {
    80003d68:	ff010113          	addi	sp,sp,-16
    80003d6c:	00113423          	sd	ra,8(sp)
    80003d70:	00813023          	sd	s0,0(sp)
    80003d74:	01010413          	addi	s0,sp,16
    return thread_start(this->myHandle);
    80003d78:	00853503          	ld	a0,8(a0)
    80003d7c:	ffffe097          	auipc	ra,0xffffe
    80003d80:	898080e7          	jalr	-1896(ra) # 80001614 <_Z12thread_startP7_thread>
}
    80003d84:	00813083          	ld	ra,8(sp)
    80003d88:	00013403          	ld	s0,0(sp)
    80003d8c:	01010113          	addi	sp,sp,16
    80003d90:	00008067          	ret

0000000080003d94 <_ZN6Thread4joinEv>:
void Thread::join() {
    80003d94:	ff010113          	addi	sp,sp,-16
    80003d98:	00113423          	sd	ra,8(sp)
    80003d9c:	00813023          	sd	s0,0(sp)
    80003da0:	01010413          	addi	s0,sp,16
    thread_join(this->myHandle);
    80003da4:	00853503          	ld	a0,8(a0)
    80003da8:	ffffe097          	auipc	ra,0xffffe
    80003dac:	910080e7          	jalr	-1776(ra) # 800016b8 <_Z11thread_joinP7_thread>
}
    80003db0:	00813083          	ld	ra,8(sp)
    80003db4:	00013403          	ld	s0,0(sp)
    80003db8:	01010113          	addi	sp,sp,16
    80003dbc:	00008067          	ret

0000000080003dc0 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80003dc0:	ff010113          	addi	sp,sp,-16
    80003dc4:	00113423          	sd	ra,8(sp)
    80003dc8:	00813023          	sd	s0,0(sp)
    80003dcc:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80003dd0:	ffffe097          	auipc	ra,0xffffe
    80003dd4:	8bc080e7          	jalr	-1860(ra) # 8000168c <_Z15thread_dispatchv>
}
    80003dd8:	00813083          	ld	ra,8(sp)
    80003ddc:	00013403          	ld	s0,0(sp)
    80003de0:	01010113          	addi	sp,sp,16
    80003de4:	00008067          	ret

0000000080003de8 <_ZN6ThreadC1Ev>:

Thread::Thread() {
    80003de8:	ff010113          	addi	sp,sp,-16
    80003dec:	00113423          	sd	ra,8(sp)
    80003df0:	00813023          	sd	s0,0(sp)
    80003df4:	01010413          	addi	s0,sp,16
    80003df8:	00006797          	auipc	a5,0x6
    80003dfc:	70878793          	addi	a5,a5,1800 # 8000a500 <_ZTV6Thread+0x10>
    80003e00:	00f53023          	sd	a5,0(a0)
    thread_only(&this->myHandle, Thread::wrapper, this);
    80003e04:	00050613          	mv	a2,a0
    80003e08:	00000597          	auipc	a1,0x0
    80003e0c:	e5c58593          	addi	a1,a1,-420 # 80003c64 <_ZN6Thread7wrapperEPv>
    80003e10:	00850513          	addi	a0,a0,8
    80003e14:	ffffd097          	auipc	ra,0xffffd
    80003e18:	7a8080e7          	jalr	1960(ra) # 800015bc <_Z11thread_onlyPP7_threadPFvPvES2_>
}
    80003e1c:	00813083          	ld	ra,8(sp)
    80003e20:	00013403          	ld	s0,0(sp)
    80003e24:	01010113          	addi	sp,sp,16
    80003e28:	00008067          	ret

0000000080003e2c <_ZN6Thread3runEv>:

    static void wrapper(void* args);

protected:
    Thread ();
    virtual void run () {}
    80003e2c:	ff010113          	addi	sp,sp,-16
    80003e30:	00813423          	sd	s0,8(sp)
    80003e34:	01010413          	addi	s0,sp,16
    80003e38:	00813403          	ld	s0,8(sp)
    80003e3c:	01010113          	addi	sp,sp,16
    80003e40:	00008067          	ret

0000000080003e44 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80003e44:	fe010113          	addi	sp,sp,-32
    80003e48:	00113c23          	sd	ra,24(sp)
    80003e4c:	00813823          	sd	s0,16(sp)
    80003e50:	00913423          	sd	s1,8(sp)
    80003e54:	02010413          	addi	s0,sp,32
    80003e58:	00050493          	mv	s1,a0
    LOCK();
    80003e5c:	00100613          	li	a2,1
    80003e60:	00000593          	li	a1,0
    80003e64:	00006517          	auipc	a0,0x6
    80003e68:	77c50513          	addi	a0,a0,1916 # 8000a5e0 <lockPrint>
    80003e6c:	ffffd097          	auipc	ra,0xffffd
    80003e70:	5f4080e7          	jalr	1524(ra) # 80001460 <copy_and_swap>
    80003e74:	00050863          	beqz	a0,80003e84 <_Z11printStringPKc+0x40>
    80003e78:	ffffe097          	auipc	ra,0xffffe
    80003e7c:	814080e7          	jalr	-2028(ra) # 8000168c <_Z15thread_dispatchv>
    80003e80:	fddff06f          	j	80003e5c <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80003e84:	0004c503          	lbu	a0,0(s1)
    80003e88:	00050a63          	beqz	a0,80003e9c <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80003e8c:	ffffe097          	auipc	ra,0xffffe
    80003e90:	9ac080e7          	jalr	-1620(ra) # 80001838 <_Z4putcc>
        string++;
    80003e94:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80003e98:	fedff06f          	j	80003e84 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80003e9c:	00000613          	li	a2,0
    80003ea0:	00100593          	li	a1,1
    80003ea4:	00006517          	auipc	a0,0x6
    80003ea8:	73c50513          	addi	a0,a0,1852 # 8000a5e0 <lockPrint>
    80003eac:	ffffd097          	auipc	ra,0xffffd
    80003eb0:	5b4080e7          	jalr	1460(ra) # 80001460 <copy_and_swap>
    80003eb4:	fe0514e3          	bnez	a0,80003e9c <_Z11printStringPKc+0x58>
}
    80003eb8:	01813083          	ld	ra,24(sp)
    80003ebc:	01013403          	ld	s0,16(sp)
    80003ec0:	00813483          	ld	s1,8(sp)
    80003ec4:	02010113          	addi	sp,sp,32
    80003ec8:	00008067          	ret

0000000080003ecc <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80003ecc:	fd010113          	addi	sp,sp,-48
    80003ed0:	02113423          	sd	ra,40(sp)
    80003ed4:	02813023          	sd	s0,32(sp)
    80003ed8:	00913c23          	sd	s1,24(sp)
    80003edc:	01213823          	sd	s2,16(sp)
    80003ee0:	01313423          	sd	s3,8(sp)
    80003ee4:	01413023          	sd	s4,0(sp)
    80003ee8:	03010413          	addi	s0,sp,48
    80003eec:	00050993          	mv	s3,a0
    80003ef0:	00058a13          	mv	s4,a1
    LOCK();
    80003ef4:	00100613          	li	a2,1
    80003ef8:	00000593          	li	a1,0
    80003efc:	00006517          	auipc	a0,0x6
    80003f00:	6e450513          	addi	a0,a0,1764 # 8000a5e0 <lockPrint>
    80003f04:	ffffd097          	auipc	ra,0xffffd
    80003f08:	55c080e7          	jalr	1372(ra) # 80001460 <copy_and_swap>
    80003f0c:	00050863          	beqz	a0,80003f1c <_Z9getStringPci+0x50>
    80003f10:	ffffd097          	auipc	ra,0xffffd
    80003f14:	77c080e7          	jalr	1916(ra) # 8000168c <_Z15thread_dispatchv>
    80003f18:	fddff06f          	j	80003ef4 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80003f1c:	00000913          	li	s2,0
    80003f20:	00090493          	mv	s1,s2
    80003f24:	0019091b          	addiw	s2,s2,1
    80003f28:	03495a63          	bge	s2,s4,80003f5c <_Z9getStringPci+0x90>
        cc = getc();
    80003f2c:	ffffe097          	auipc	ra,0xffffe
    80003f30:	8d8080e7          	jalr	-1832(ra) # 80001804 <_Z4getcv>
        if(cc < 1)
    80003f34:	02050463          	beqz	a0,80003f5c <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80003f38:	009984b3          	add	s1,s3,s1
    80003f3c:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80003f40:	00a00793          	li	a5,10
    80003f44:	00f50a63          	beq	a0,a5,80003f58 <_Z9getStringPci+0x8c>
    80003f48:	00d00793          	li	a5,13
    80003f4c:	fcf51ae3          	bne	a0,a5,80003f20 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80003f50:	00090493          	mv	s1,s2
    80003f54:	0080006f          	j	80003f5c <_Z9getStringPci+0x90>
    80003f58:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80003f5c:	009984b3          	add	s1,s3,s1
    80003f60:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80003f64:	00000613          	li	a2,0
    80003f68:	00100593          	li	a1,1
    80003f6c:	00006517          	auipc	a0,0x6
    80003f70:	67450513          	addi	a0,a0,1652 # 8000a5e0 <lockPrint>
    80003f74:	ffffd097          	auipc	ra,0xffffd
    80003f78:	4ec080e7          	jalr	1260(ra) # 80001460 <copy_and_swap>
    80003f7c:	fe0514e3          	bnez	a0,80003f64 <_Z9getStringPci+0x98>
    return buf;
}
    80003f80:	00098513          	mv	a0,s3
    80003f84:	02813083          	ld	ra,40(sp)
    80003f88:	02013403          	ld	s0,32(sp)
    80003f8c:	01813483          	ld	s1,24(sp)
    80003f90:	01013903          	ld	s2,16(sp)
    80003f94:	00813983          	ld	s3,8(sp)
    80003f98:	00013a03          	ld	s4,0(sp)
    80003f9c:	03010113          	addi	sp,sp,48
    80003fa0:	00008067          	ret

0000000080003fa4 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80003fa4:	ff010113          	addi	sp,sp,-16
    80003fa8:	00813423          	sd	s0,8(sp)
    80003fac:	01010413          	addi	s0,sp,16
    80003fb0:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80003fb4:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80003fb8:	0006c603          	lbu	a2,0(a3)
    80003fbc:	fd06071b          	addiw	a4,a2,-48
    80003fc0:	0ff77713          	andi	a4,a4,255
    80003fc4:	00900793          	li	a5,9
    80003fc8:	02e7e063          	bltu	a5,a4,80003fe8 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80003fcc:	0025179b          	slliw	a5,a0,0x2
    80003fd0:	00a787bb          	addw	a5,a5,a0
    80003fd4:	0017979b          	slliw	a5,a5,0x1
    80003fd8:	00168693          	addi	a3,a3,1
    80003fdc:	00c787bb          	addw	a5,a5,a2
    80003fe0:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80003fe4:	fd5ff06f          	j	80003fb8 <_Z11stringToIntPKc+0x14>
    return n;
}
    80003fe8:	00813403          	ld	s0,8(sp)
    80003fec:	01010113          	addi	sp,sp,16
    80003ff0:	00008067          	ret

0000000080003ff4 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80003ff4:	fc010113          	addi	sp,sp,-64
    80003ff8:	02113c23          	sd	ra,56(sp)
    80003ffc:	02813823          	sd	s0,48(sp)
    80004000:	02913423          	sd	s1,40(sp)
    80004004:	03213023          	sd	s2,32(sp)
    80004008:	01313c23          	sd	s3,24(sp)
    8000400c:	04010413          	addi	s0,sp,64
    80004010:	00050493          	mv	s1,a0
    80004014:	00058913          	mv	s2,a1
    80004018:	00060993          	mv	s3,a2
    LOCK();
    8000401c:	00100613          	li	a2,1
    80004020:	00000593          	li	a1,0
    80004024:	00006517          	auipc	a0,0x6
    80004028:	5bc50513          	addi	a0,a0,1468 # 8000a5e0 <lockPrint>
    8000402c:	ffffd097          	auipc	ra,0xffffd
    80004030:	434080e7          	jalr	1076(ra) # 80001460 <copy_and_swap>
    80004034:	00050863          	beqz	a0,80004044 <_Z8printIntiii+0x50>
    80004038:	ffffd097          	auipc	ra,0xffffd
    8000403c:	654080e7          	jalr	1620(ra) # 8000168c <_Z15thread_dispatchv>
    80004040:	fddff06f          	j	8000401c <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80004044:	00098463          	beqz	s3,8000404c <_Z8printIntiii+0x58>
    80004048:	0804c463          	bltz	s1,800040d0 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    8000404c:	0004851b          	sext.w	a0,s1
    neg = 0;
    80004050:	00000593          	li	a1,0
    }

    i = 0;
    80004054:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80004058:	0009079b          	sext.w	a5,s2
    8000405c:	0325773b          	remuw	a4,a0,s2
    80004060:	00048613          	mv	a2,s1
    80004064:	0014849b          	addiw	s1,s1,1
    80004068:	02071693          	slli	a3,a4,0x20
    8000406c:	0206d693          	srli	a3,a3,0x20
    80004070:	00006717          	auipc	a4,0x6
    80004074:	4a870713          	addi	a4,a4,1192 # 8000a518 <digits>
    80004078:	00d70733          	add	a4,a4,a3
    8000407c:	00074683          	lbu	a3,0(a4)
    80004080:	fd040713          	addi	a4,s0,-48
    80004084:	00c70733          	add	a4,a4,a2
    80004088:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    8000408c:	0005071b          	sext.w	a4,a0
    80004090:	0325553b          	divuw	a0,a0,s2
    80004094:	fcf772e3          	bgeu	a4,a5,80004058 <_Z8printIntiii+0x64>
    if(neg)
    80004098:	00058c63          	beqz	a1,800040b0 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    8000409c:	fd040793          	addi	a5,s0,-48
    800040a0:	009784b3          	add	s1,a5,s1
    800040a4:	02d00793          	li	a5,45
    800040a8:	fef48823          	sb	a5,-16(s1)
    800040ac:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    800040b0:	fff4849b          	addiw	s1,s1,-1
    800040b4:	0204c463          	bltz	s1,800040dc <_Z8printIntiii+0xe8>
        putc(buf[i]);
    800040b8:	fd040793          	addi	a5,s0,-48
    800040bc:	009787b3          	add	a5,a5,s1
    800040c0:	ff07c503          	lbu	a0,-16(a5)
    800040c4:	ffffd097          	auipc	ra,0xffffd
    800040c8:	774080e7          	jalr	1908(ra) # 80001838 <_Z4putcc>
    800040cc:	fe5ff06f          	j	800040b0 <_Z8printIntiii+0xbc>
        x = -xx;
    800040d0:	4090053b          	negw	a0,s1
        neg = 1;
    800040d4:	00100593          	li	a1,1
        x = -xx;
    800040d8:	f7dff06f          	j	80004054 <_Z8printIntiii+0x60>

    UNLOCK();
    800040dc:	00000613          	li	a2,0
    800040e0:	00100593          	li	a1,1
    800040e4:	00006517          	auipc	a0,0x6
    800040e8:	4fc50513          	addi	a0,a0,1276 # 8000a5e0 <lockPrint>
    800040ec:	ffffd097          	auipc	ra,0xffffd
    800040f0:	374080e7          	jalr	884(ra) # 80001460 <copy_and_swap>
    800040f4:	fe0514e3          	bnez	a0,800040dc <_Z8printIntiii+0xe8>
    800040f8:	03813083          	ld	ra,56(sp)
    800040fc:	03013403          	ld	s0,48(sp)
    80004100:	02813483          	ld	s1,40(sp)
    80004104:	02013903          	ld	s2,32(sp)
    80004108:	01813983          	ld	s3,24(sp)
    8000410c:	04010113          	addi	sp,sp,64
    80004110:	00008067          	ret

0000000080004114 <_ZN9BufferCPPC1Ei>:
#include "../h/buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80004114:	fd010113          	addi	sp,sp,-48
    80004118:	02113423          	sd	ra,40(sp)
    8000411c:	02813023          	sd	s0,32(sp)
    80004120:	00913c23          	sd	s1,24(sp)
    80004124:	01213823          	sd	s2,16(sp)
    80004128:	01313423          	sd	s3,8(sp)
    8000412c:	03010413          	addi	s0,sp,48
    80004130:	00050493          	mv	s1,a0
    80004134:	00058913          	mv	s2,a1
    80004138:	0015879b          	addiw	a5,a1,1
    8000413c:	0007851b          	sext.w	a0,a5
    80004140:	00f4a023          	sw	a5,0(s1)
    80004144:	0004a823          	sw	zero,16(s1)
    80004148:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    8000414c:	00251513          	slli	a0,a0,0x2
    80004150:	ffffd097          	auipc	ra,0xffffd
    80004154:	37c080e7          	jalr	892(ra) # 800014cc <_Z9mem_allocm>
    80004158:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    8000415c:	01000513          	li	a0,16
    80004160:	00000097          	auipc	ra,0x0
    80004164:	7a8080e7          	jalr	1960(ra) # 80004908 <_Znwm>
    80004168:	00050993          	mv	s3,a0
    8000416c:	00000593          	li	a1,0
    80004170:	ffffe097          	auipc	ra,0xffffe
    80004174:	058080e7          	jalr	88(ra) # 800021c8 <_ZN9SemaphoreC1Ej>
    80004178:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    8000417c:	01000513          	li	a0,16
    80004180:	00000097          	auipc	ra,0x0
    80004184:	788080e7          	jalr	1928(ra) # 80004908 <_Znwm>
    80004188:	00050993          	mv	s3,a0
    8000418c:	00090593          	mv	a1,s2
    80004190:	ffffe097          	auipc	ra,0xffffe
    80004194:	038080e7          	jalr	56(ra) # 800021c8 <_ZN9SemaphoreC1Ej>
    80004198:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    8000419c:	01000513          	li	a0,16
    800041a0:	00000097          	auipc	ra,0x0
    800041a4:	768080e7          	jalr	1896(ra) # 80004908 <_Znwm>
    800041a8:	00050913          	mv	s2,a0
    800041ac:	00100593          	li	a1,1
    800041b0:	ffffe097          	auipc	ra,0xffffe
    800041b4:	018080e7          	jalr	24(ra) # 800021c8 <_ZN9SemaphoreC1Ej>
    800041b8:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    800041bc:	01000513          	li	a0,16
    800041c0:	00000097          	auipc	ra,0x0
    800041c4:	748080e7          	jalr	1864(ra) # 80004908 <_Znwm>
    800041c8:	00050913          	mv	s2,a0
    800041cc:	00100593          	li	a1,1
    800041d0:	ffffe097          	auipc	ra,0xffffe
    800041d4:	ff8080e7          	jalr	-8(ra) # 800021c8 <_ZN9SemaphoreC1Ej>
    800041d8:	0324b823          	sd	s2,48(s1)
}
    800041dc:	02813083          	ld	ra,40(sp)
    800041e0:	02013403          	ld	s0,32(sp)
    800041e4:	01813483          	ld	s1,24(sp)
    800041e8:	01013903          	ld	s2,16(sp)
    800041ec:	00813983          	ld	s3,8(sp)
    800041f0:	03010113          	addi	sp,sp,48
    800041f4:	00008067          	ret
    800041f8:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    800041fc:	00098513          	mv	a0,s3
    80004200:	00000097          	auipc	ra,0x0
    80004204:	758080e7          	jalr	1880(ra) # 80004958 <_ZdlPv>
    80004208:	00048513          	mv	a0,s1
    8000420c:	00007097          	auipc	ra,0x7
    80004210:	4dc080e7          	jalr	1244(ra) # 8000b6e8 <_Unwind_Resume>
    80004214:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80004218:	00098513          	mv	a0,s3
    8000421c:	00000097          	auipc	ra,0x0
    80004220:	73c080e7          	jalr	1852(ra) # 80004958 <_ZdlPv>
    80004224:	00048513          	mv	a0,s1
    80004228:	00007097          	auipc	ra,0x7
    8000422c:	4c0080e7          	jalr	1216(ra) # 8000b6e8 <_Unwind_Resume>
    80004230:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80004234:	00090513          	mv	a0,s2
    80004238:	00000097          	auipc	ra,0x0
    8000423c:	720080e7          	jalr	1824(ra) # 80004958 <_ZdlPv>
    80004240:	00048513          	mv	a0,s1
    80004244:	00007097          	auipc	ra,0x7
    80004248:	4a4080e7          	jalr	1188(ra) # 8000b6e8 <_Unwind_Resume>
    8000424c:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80004250:	00090513          	mv	a0,s2
    80004254:	00000097          	auipc	ra,0x0
    80004258:	704080e7          	jalr	1796(ra) # 80004958 <_ZdlPv>
    8000425c:	00048513          	mv	a0,s1
    80004260:	00007097          	auipc	ra,0x7
    80004264:	488080e7          	jalr	1160(ra) # 8000b6e8 <_Unwind_Resume>

0000000080004268 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80004268:	fe010113          	addi	sp,sp,-32
    8000426c:	00113c23          	sd	ra,24(sp)
    80004270:	00813823          	sd	s0,16(sp)
    80004274:	00913423          	sd	s1,8(sp)
    80004278:	01213023          	sd	s2,0(sp)
    8000427c:	02010413          	addi	s0,sp,32
    80004280:	00050493          	mv	s1,a0
    80004284:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80004288:	01853503          	ld	a0,24(a0)
    8000428c:	ffffe097          	auipc	ra,0xffffe
    80004290:	f74080e7          	jalr	-140(ra) # 80002200 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80004294:	0304b503          	ld	a0,48(s1)
    80004298:	ffffe097          	auipc	ra,0xffffe
    8000429c:	f68080e7          	jalr	-152(ra) # 80002200 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    800042a0:	0084b783          	ld	a5,8(s1)
    800042a4:	0144a703          	lw	a4,20(s1)
    800042a8:	00271713          	slli	a4,a4,0x2
    800042ac:	00e787b3          	add	a5,a5,a4
    800042b0:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800042b4:	0144a783          	lw	a5,20(s1)
    800042b8:	0017879b          	addiw	a5,a5,1
    800042bc:	0004a703          	lw	a4,0(s1)
    800042c0:	02e7e7bb          	remw	a5,a5,a4
    800042c4:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    800042c8:	0304b503          	ld	a0,48(s1)
    800042cc:	ffffe097          	auipc	ra,0xffffe
    800042d0:	f60080e7          	jalr	-160(ra) # 8000222c <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    800042d4:	0204b503          	ld	a0,32(s1)
    800042d8:	ffffe097          	auipc	ra,0xffffe
    800042dc:	f54080e7          	jalr	-172(ra) # 8000222c <_ZN9Semaphore6signalEv>

}
    800042e0:	01813083          	ld	ra,24(sp)
    800042e4:	01013403          	ld	s0,16(sp)
    800042e8:	00813483          	ld	s1,8(sp)
    800042ec:	00013903          	ld	s2,0(sp)
    800042f0:	02010113          	addi	sp,sp,32
    800042f4:	00008067          	ret

00000000800042f8 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    800042f8:	fe010113          	addi	sp,sp,-32
    800042fc:	00113c23          	sd	ra,24(sp)
    80004300:	00813823          	sd	s0,16(sp)
    80004304:	00913423          	sd	s1,8(sp)
    80004308:	01213023          	sd	s2,0(sp)
    8000430c:	02010413          	addi	s0,sp,32
    80004310:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80004314:	02053503          	ld	a0,32(a0)
    80004318:	ffffe097          	auipc	ra,0xffffe
    8000431c:	ee8080e7          	jalr	-280(ra) # 80002200 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80004320:	0284b503          	ld	a0,40(s1)
    80004324:	ffffe097          	auipc	ra,0xffffe
    80004328:	edc080e7          	jalr	-292(ra) # 80002200 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    8000432c:	0084b703          	ld	a4,8(s1)
    80004330:	0104a783          	lw	a5,16(s1)
    80004334:	00279693          	slli	a3,a5,0x2
    80004338:	00d70733          	add	a4,a4,a3
    8000433c:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80004340:	0017879b          	addiw	a5,a5,1
    80004344:	0004a703          	lw	a4,0(s1)
    80004348:	02e7e7bb          	remw	a5,a5,a4
    8000434c:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80004350:	0284b503          	ld	a0,40(s1)
    80004354:	ffffe097          	auipc	ra,0xffffe
    80004358:	ed8080e7          	jalr	-296(ra) # 8000222c <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    8000435c:	0184b503          	ld	a0,24(s1)
    80004360:	ffffe097          	auipc	ra,0xffffe
    80004364:	ecc080e7          	jalr	-308(ra) # 8000222c <_ZN9Semaphore6signalEv>

    return ret;
}
    80004368:	00090513          	mv	a0,s2
    8000436c:	01813083          	ld	ra,24(sp)
    80004370:	01013403          	ld	s0,16(sp)
    80004374:	00813483          	ld	s1,8(sp)
    80004378:	00013903          	ld	s2,0(sp)
    8000437c:	02010113          	addi	sp,sp,32
    80004380:	00008067          	ret

0000000080004384 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80004384:	fe010113          	addi	sp,sp,-32
    80004388:	00113c23          	sd	ra,24(sp)
    8000438c:	00813823          	sd	s0,16(sp)
    80004390:	00913423          	sd	s1,8(sp)
    80004394:	01213023          	sd	s2,0(sp)
    80004398:	02010413          	addi	s0,sp,32
    8000439c:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    800043a0:	02853503          	ld	a0,40(a0)
    800043a4:	ffffe097          	auipc	ra,0xffffe
    800043a8:	e5c080e7          	jalr	-420(ra) # 80002200 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    800043ac:	0304b503          	ld	a0,48(s1)
    800043b0:	ffffe097          	auipc	ra,0xffffe
    800043b4:	e50080e7          	jalr	-432(ra) # 80002200 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    800043b8:	0144a783          	lw	a5,20(s1)
    800043bc:	0104a903          	lw	s2,16(s1)
    800043c0:	0327ce63          	blt	a5,s2,800043fc <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    800043c4:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    800043c8:	0304b503          	ld	a0,48(s1)
    800043cc:	ffffe097          	auipc	ra,0xffffe
    800043d0:	e60080e7          	jalr	-416(ra) # 8000222c <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    800043d4:	0284b503          	ld	a0,40(s1)
    800043d8:	ffffe097          	auipc	ra,0xffffe
    800043dc:	e54080e7          	jalr	-428(ra) # 8000222c <_ZN9Semaphore6signalEv>

    return ret;
}
    800043e0:	00090513          	mv	a0,s2
    800043e4:	01813083          	ld	ra,24(sp)
    800043e8:	01013403          	ld	s0,16(sp)
    800043ec:	00813483          	ld	s1,8(sp)
    800043f0:	00013903          	ld	s2,0(sp)
    800043f4:	02010113          	addi	sp,sp,32
    800043f8:	00008067          	ret
        ret = cap - head + tail;
    800043fc:	0004a703          	lw	a4,0(s1)
    80004400:	4127093b          	subw	s2,a4,s2
    80004404:	00f9093b          	addw	s2,s2,a5
    80004408:	fc1ff06f          	j	800043c8 <_ZN9BufferCPP6getCntEv+0x44>

000000008000440c <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    8000440c:	fe010113          	addi	sp,sp,-32
    80004410:	00113c23          	sd	ra,24(sp)
    80004414:	00813823          	sd	s0,16(sp)
    80004418:	00913423          	sd	s1,8(sp)
    8000441c:	02010413          	addi	s0,sp,32
    80004420:	00050493          	mv	s1,a0
    Console::putc('\n');
    80004424:	00a00513          	li	a0,10
    80004428:	00000097          	auipc	ra,0x0
    8000442c:	32c080e7          	jalr	812(ra) # 80004754 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80004430:	00004517          	auipc	a0,0x4
    80004434:	dd050513          	addi	a0,a0,-560 # 80008200 <CONSOLE_STATUS+0x1f0>
    80004438:	00000097          	auipc	ra,0x0
    8000443c:	a0c080e7          	jalr	-1524(ra) # 80003e44 <_Z11printStringPKc>
    while (getCnt()) {
    80004440:	00048513          	mv	a0,s1
    80004444:	00000097          	auipc	ra,0x0
    80004448:	f40080e7          	jalr	-192(ra) # 80004384 <_ZN9BufferCPP6getCntEv>
    8000444c:	02050c63          	beqz	a0,80004484 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80004450:	0084b783          	ld	a5,8(s1)
    80004454:	0104a703          	lw	a4,16(s1)
    80004458:	00271713          	slli	a4,a4,0x2
    8000445c:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80004460:	0007c503          	lbu	a0,0(a5)
    80004464:	00000097          	auipc	ra,0x0
    80004468:	2f0080e7          	jalr	752(ra) # 80004754 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    8000446c:	0104a783          	lw	a5,16(s1)
    80004470:	0017879b          	addiw	a5,a5,1
    80004474:	0004a703          	lw	a4,0(s1)
    80004478:	02e7e7bb          	remw	a5,a5,a4
    8000447c:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80004480:	fc1ff06f          	j	80004440 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80004484:	02100513          	li	a0,33
    80004488:	00000097          	auipc	ra,0x0
    8000448c:	2cc080e7          	jalr	716(ra) # 80004754 <_ZN7Console4putcEc>
    Console::putc('\n');
    80004490:	00a00513          	li	a0,10
    80004494:	00000097          	auipc	ra,0x0
    80004498:	2c0080e7          	jalr	704(ra) # 80004754 <_ZN7Console4putcEc>
    mem_free(buffer);
    8000449c:	0084b503          	ld	a0,8(s1)
    800044a0:	ffffd097          	auipc	ra,0xffffd
    800044a4:	080080e7          	jalr	128(ra) # 80001520 <_Z8mem_freePv>
    delete itemAvailable;
    800044a8:	0204b503          	ld	a0,32(s1)
    800044ac:	00050863          	beqz	a0,800044bc <_ZN9BufferCPPD1Ev+0xb0>
    800044b0:	00053783          	ld	a5,0(a0)
    800044b4:	0087b783          	ld	a5,8(a5)
    800044b8:	000780e7          	jalr	a5
    delete spaceAvailable;
    800044bc:	0184b503          	ld	a0,24(s1)
    800044c0:	00050863          	beqz	a0,800044d0 <_ZN9BufferCPPD1Ev+0xc4>
    800044c4:	00053783          	ld	a5,0(a0)
    800044c8:	0087b783          	ld	a5,8(a5)
    800044cc:	000780e7          	jalr	a5
    delete mutexTail;
    800044d0:	0304b503          	ld	a0,48(s1)
    800044d4:	00050863          	beqz	a0,800044e4 <_ZN9BufferCPPD1Ev+0xd8>
    800044d8:	00053783          	ld	a5,0(a0)
    800044dc:	0087b783          	ld	a5,8(a5)
    800044e0:	000780e7          	jalr	a5
    delete mutexHead;
    800044e4:	0284b503          	ld	a0,40(s1)
    800044e8:	00050863          	beqz	a0,800044f8 <_ZN9BufferCPPD1Ev+0xec>
    800044ec:	00053783          	ld	a5,0(a0)
    800044f0:	0087b783          	ld	a5,8(a5)
    800044f4:	000780e7          	jalr	a5
}
    800044f8:	01813083          	ld	ra,24(sp)
    800044fc:	01013403          	ld	s0,16(sp)
    80004500:	00813483          	ld	s1,8(sp)
    80004504:	02010113          	addi	sp,sp,32
    80004508:	00008067          	ret

000000008000450c <_Z8userMainv>:
#include "../h/ConsumerProducer_CPP_API_test.hpp"
#include "../h/System_Mode_test.hpp"

#endif

void userMain() {
    8000450c:	fe010113          	addi	sp,sp,-32
    80004510:	00113c23          	sd	ra,24(sp)
    80004514:	00813823          	sd	s0,16(sp)
    80004518:	00913423          	sd	s1,8(sp)
    8000451c:	01213023          	sd	s2,0(sp)
    80004520:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80004524:	00004517          	auipc	a0,0x4
    80004528:	cf450513          	addi	a0,a0,-780 # 80008218 <CONSOLE_STATUS+0x208>
    8000452c:	00000097          	auipc	ra,0x0
    80004530:	918080e7          	jalr	-1768(ra) # 80003e44 <_Z11printStringPKc>
    int test = getc() - '0';
    80004534:	ffffd097          	auipc	ra,0xffffd
    80004538:	2d0080e7          	jalr	720(ra) # 80001804 <_Z4getcv>
    8000453c:	00050913          	mv	s2,a0
    80004540:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    80004544:	ffffd097          	auipc	ra,0xffffd
    80004548:	2c0080e7          	jalr	704(ra) # 80001804 <_Z4getcv>
            printString("Nije navedeno da je zadatak 3 implementiran\n");
            return;
        }
    }

    if (test >= 5 && test <= 6) {
    8000454c:	fcb9091b          	addiw	s2,s2,-53
    80004550:	00100793          	li	a5,1
    80004554:	0327f463          	bgeu	a5,s2,8000457c <_Z8userMainv+0x70>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80004558:	00700793          	li	a5,7
    8000455c:	0e97e263          	bltu	a5,s1,80004640 <_Z8userMainv+0x134>
    80004560:	00249493          	slli	s1,s1,0x2
    80004564:	00004717          	auipc	a4,0x4
    80004568:	ecc70713          	addi	a4,a4,-308 # 80008430 <CONSOLE_STATUS+0x420>
    8000456c:	00e484b3          	add	s1,s1,a4
    80004570:	0004a783          	lw	a5,0(s1)
    80004574:	00e787b3          	add	a5,a5,a4
    80004578:	00078067          	jr	a5
            printString("Nije navedeno da je zadatak 4 implementiran\n");
    8000457c:	00004517          	auipc	a0,0x4
    80004580:	cbc50513          	addi	a0,a0,-836 # 80008238 <CONSOLE_STATUS+0x228>
    80004584:	00000097          	auipc	ra,0x0
    80004588:	8c0080e7          	jalr	-1856(ra) # 80003e44 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    8000458c:	01813083          	ld	ra,24(sp)
    80004590:	01013403          	ld	s0,16(sp)
    80004594:	00813483          	ld	s1,8(sp)
    80004598:	00013903          	ld	s2,0(sp)
    8000459c:	02010113          	addi	sp,sp,32
    800045a0:	00008067          	ret
            Threads_C_API_test();
    800045a4:	fffff097          	auipc	ra,0xfffff
    800045a8:	d38080e7          	jalr	-712(ra) # 800032dc <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    800045ac:	00004517          	auipc	a0,0x4
    800045b0:	cbc50513          	addi	a0,a0,-836 # 80008268 <CONSOLE_STATUS+0x258>
    800045b4:	00000097          	auipc	ra,0x0
    800045b8:	890080e7          	jalr	-1904(ra) # 80003e44 <_Z11printStringPKc>
            break;
    800045bc:	fd1ff06f          	j	8000458c <_Z8userMainv+0x80>
            Threads_CPP_API_test();
    800045c0:	ffffe097          	auipc	ra,0xffffe
    800045c4:	380080e7          	jalr	896(ra) # 80002940 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    800045c8:	00004517          	auipc	a0,0x4
    800045cc:	ce050513          	addi	a0,a0,-800 # 800082a8 <CONSOLE_STATUS+0x298>
    800045d0:	00000097          	auipc	ra,0x0
    800045d4:	874080e7          	jalr	-1932(ra) # 80003e44 <_Z11printStringPKc>
            break;
    800045d8:	fb5ff06f          	j	8000458c <_Z8userMainv+0x80>
            producerConsumer_C_API();
    800045dc:	ffffd097          	auipc	ra,0xffffd
    800045e0:	4b8080e7          	jalr	1208(ra) # 80001a94 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    800045e4:	00004517          	auipc	a0,0x4
    800045e8:	d0450513          	addi	a0,a0,-764 # 800082e8 <CONSOLE_STATUS+0x2d8>
    800045ec:	00000097          	auipc	ra,0x0
    800045f0:	858080e7          	jalr	-1960(ra) # 80003e44 <_Z11printStringPKc>
            break;
    800045f4:	f99ff06f          	j	8000458c <_Z8userMainv+0x80>
            producerConsumer_CPP_Sync_API();
    800045f8:	fffff097          	auipc	ra,0xfffff
    800045fc:	028080e7          	jalr	40(ra) # 80003620 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80004600:	00004517          	auipc	a0,0x4
    80004604:	d3850513          	addi	a0,a0,-712 # 80008338 <CONSOLE_STATUS+0x328>
    80004608:	00000097          	auipc	ra,0x0
    8000460c:	83c080e7          	jalr	-1988(ra) # 80003e44 <_Z11printStringPKc>
            break;
    80004610:	f7dff06f          	j	8000458c <_Z8userMainv+0x80>
            System_Mode_test();
    80004614:	00001097          	auipc	ra,0x1
    80004618:	fdc080e7          	jalr	-36(ra) # 800055f0 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    8000461c:	00004517          	auipc	a0,0x4
    80004620:	d7450513          	addi	a0,a0,-652 # 80008390 <CONSOLE_STATUS+0x380>
    80004624:	00000097          	auipc	ra,0x0
    80004628:	820080e7          	jalr	-2016(ra) # 80003e44 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    8000462c:	00004517          	auipc	a0,0x4
    80004630:	d8450513          	addi	a0,a0,-636 # 800083b0 <CONSOLE_STATUS+0x3a0>
    80004634:	00000097          	auipc	ra,0x0
    80004638:	810080e7          	jalr	-2032(ra) # 80003e44 <_Z11printStringPKc>
            break;
    8000463c:	f51ff06f          	j	8000458c <_Z8userMainv+0x80>
            printString("Niste uneli odgovarajuci broj za test\n");
    80004640:	00004517          	auipc	a0,0x4
    80004644:	dc850513          	addi	a0,a0,-568 # 80008408 <CONSOLE_STATUS+0x3f8>
    80004648:	fffff097          	auipc	ra,0xfffff
    8000464c:	7fc080e7          	jalr	2044(ra) # 80003e44 <_Z11printStringPKc>
    80004650:	f3dff06f          	j	8000458c <_Z8userMainv+0x80>

0000000080004654 <_Z41__static_initialization_and_destruction_0ii>:
    return readyProcessQueue.removeFirst();
}

void Scheduler::put(_thread *pcb) {
    readyProcessQueue.addLast(pcb);
    80004654:	ff010113          	addi	sp,sp,-16
    80004658:	00813423          	sd	s0,8(sp)
    8000465c:	01010413          	addi	s0,sp,16
    80004660:	00100793          	li	a5,1
    80004664:	00f50863          	beq	a0,a5,80004674 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80004668:	00813403          	ld	s0,8(sp)
    8000466c:	01010113          	addi	sp,sp,16
    80004670:	00008067          	ret
    80004674:	000107b7          	lui	a5,0x10
    80004678:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    8000467c:	fef596e3          	bne	a1,a5,80004668 <_Z41__static_initialization_and_destruction_0ii+0x14>
    };

    Elem *head, *tail;

public:
    List() : head(0), tail(0) {}
    80004680:	00006797          	auipc	a5,0x6
    80004684:	f6878793          	addi	a5,a5,-152 # 8000a5e8 <_ZN9Scheduler17readyProcessQueueE>
    80004688:	0007b023          	sd	zero,0(a5)
    8000468c:	0007b423          	sd	zero,8(a5)
    80004690:	fd9ff06f          	j	80004668 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080004694 <_ZN9Scheduler3getEv>:
_thread *Scheduler::get() {
    80004694:	ff010113          	addi	sp,sp,-16
    80004698:	00113423          	sd	ra,8(sp)
    8000469c:	00813023          	sd	s0,0(sp)
    800046a0:	01010413          	addi	s0,sp,16
    return readyProcessQueue.removeFirst();
    800046a4:	00006517          	auipc	a0,0x6
    800046a8:	f4450513          	addi	a0,a0,-188 # 8000a5e8 <_ZN9Scheduler17readyProcessQueueE>
    800046ac:	ffffe097          	auipc	ra,0xffffe
    800046b0:	c78080e7          	jalr	-904(ra) # 80002324 <_ZN4List11removeFirstEv>
}
    800046b4:	00813083          	ld	ra,8(sp)
    800046b8:	00013403          	ld	s0,0(sp)
    800046bc:	01010113          	addi	sp,sp,16
    800046c0:	00008067          	ret

00000000800046c4 <_ZN9Scheduler3putEP7_thread>:
void Scheduler::put(_thread *pcb) {
    800046c4:	ff010113          	addi	sp,sp,-16
    800046c8:	00113423          	sd	ra,8(sp)
    800046cc:	00813023          	sd	s0,0(sp)
    800046d0:	01010413          	addi	s0,sp,16
    800046d4:	00050593          	mv	a1,a0
    readyProcessQueue.addLast(pcb);
    800046d8:	00006517          	auipc	a0,0x6
    800046dc:	f1050513          	addi	a0,a0,-240 # 8000a5e8 <_ZN9Scheduler17readyProcessQueueE>
    800046e0:	ffffe097          	auipc	ra,0xffffe
    800046e4:	bdc080e7          	jalr	-1060(ra) # 800022bc <_ZN4List7addLastEP7_thread>
    800046e8:	00813083          	ld	ra,8(sp)
    800046ec:	00013403          	ld	s0,0(sp)
    800046f0:	01010113          	addi	sp,sp,16
    800046f4:	00008067          	ret

00000000800046f8 <_GLOBAL__sub_I__ZN9Scheduler17readyProcessQueueE>:
    800046f8:	ff010113          	addi	sp,sp,-16
    800046fc:	00113423          	sd	ra,8(sp)
    80004700:	00813023          	sd	s0,0(sp)
    80004704:	01010413          	addi	s0,sp,16
    80004708:	000105b7          	lui	a1,0x10
    8000470c:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80004710:	00100513          	li	a0,1
    80004714:	00000097          	auipc	ra,0x0
    80004718:	f40080e7          	jalr	-192(ra) # 80004654 <_Z41__static_initialization_and_destruction_0ii>
    8000471c:	00813083          	ld	ra,8(sp)
    80004720:	00013403          	ld	s0,0(sp)
    80004724:	01010113          	addi	sp,sp,16
    80004728:	00008067          	ret

000000008000472c <_ZN7Console4getcEv>:
//

#include "../h/syscall_cpp.hpp"
#include "../lib/console.h"

char Console::getc() {
    8000472c:	ff010113          	addi	sp,sp,-16
    80004730:	00113423          	sd	ra,8(sp)
    80004734:	00813023          	sd	s0,0(sp)
    80004738:	01010413          	addi	s0,sp,16
    return __getc();
    8000473c:	00003097          	auipc	ra,0x3
    80004740:	6ec080e7          	jalr	1772(ra) # 80007e28 <__getc>
}
    80004744:	00813083          	ld	ra,8(sp)
    80004748:	00013403          	ld	s0,0(sp)
    8000474c:	01010113          	addi	sp,sp,16
    80004750:	00008067          	ret

0000000080004754 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80004754:	ff010113          	addi	sp,sp,-16
    80004758:	00113423          	sd	ra,8(sp)
    8000475c:	00813023          	sd	s0,0(sp)
    80004760:	01010413          	addi	s0,sp,16
    __putc(c);
    80004764:	00003097          	auipc	ra,0x3
    80004768:	688080e7          	jalr	1672(ra) # 80007dec <__putc>
    8000476c:	00813083          	ld	ra,8(sp)
    80004770:	00013403          	ld	s0,0(sp)
    80004774:	01010113          	addi	sp,sp,16
    80004778:	00008067          	ret

000000008000477c <_Z14wraperUserMainPv>:
//
//}

void userMain();

void wraperUserMain(void *){
    8000477c:	ff010113          	addi	sp,sp,-16
    80004780:	00113423          	sd	ra,8(sp)
    80004784:	00813023          	sd	s0,0(sp)
    80004788:	01010413          	addi	s0,sp,16
//    Riscv::mc_sstatus(Riscv::SSTATUS_SPP);
//    uint64 adr = (uint64)(&userMain);
//    __asm__ volatile("csrw sepc, %0" : : "r" (adr));
//    __asm__ volatile("sret");
    userMain();
    8000478c:	00000097          	auipc	ra,0x0
    80004790:	d80080e7          	jalr	-640(ra) # 8000450c <_Z8userMainv>
    ended = true;
    80004794:	00100793          	li	a5,1
    80004798:	00006717          	auipc	a4,0x6
    8000479c:	e6f70023          	sb	a5,-416(a4) # 8000a5f8 <ended>
    thread_dispatch();
    800047a0:	ffffd097          	auipc	ra,0xffffd
    800047a4:	eec080e7          	jalr	-276(ra) # 8000168c <_Z15thread_dispatchv>
}
    800047a8:	00813083          	ld	ra,8(sp)
    800047ac:	00013403          	ld	s0,0(sp)
    800047b0:	01010113          	addi	sp,sp,16
    800047b4:	00008067          	ret

00000000800047b8 <main>:

int main() {
    800047b8:	fe010113          	addi	sp,sp,-32
    800047bc:	00113c23          	sd	ra,24(sp)
    800047c0:	00813823          	sd	s0,16(sp)
    800047c4:	00913423          	sd	s1,8(sp)
    800047c8:	01213023          	sd	s2,0(sp)
    800047cc:	02010413          	addi	s0,sp,32

    MemoryAllocator::mem_init();
    800047d0:	00001097          	auipc	ra,0x1
    800047d4:	f1c080e7          	jalr	-228(ra) # 800056ec <_ZN15MemoryAllocator8mem_initEv>
    Riscv::init_stvec((uint64) (&vector_table) | 0x01);
    800047d8:	00006517          	auipc	a0,0x6
    800047dc:	d7853503          	ld	a0,-648(a0) # 8000a550 <_GLOBAL_OFFSET_TABLE_+0x20>
    800047e0:	00156513          	ori	a0,a0,1
    800047e4:	0005051b          	sext.w	a0,a0
    800047e8:	00000097          	auipc	ra,0x0
    800047ec:	4e0080e7          	jalr	1248(ra) # 80004cc8 <_ZN5Riscv10init_stvecEj>
    _thread *mainT = _thread::createProcess(nullptr, nullptr);
    800047f0:	00000593          	li	a1,0
    800047f4:	00000513          	li	a0,0
    800047f8:	ffffe097          	auipc	ra,0xffffe
    800047fc:	824080e7          	jalr	-2012(ra) # 8000201c <_ZN7_thread13createProcessEPFvPvES0_>
    80004800:	00050493          	mv	s1,a0

    _thread::running = mainT;
    80004804:	00006797          	auipc	a5,0x6
    80004808:	d3c7b783          	ld	a5,-708(a5) # 8000a540 <_GLOBAL_OFFSET_TABLE_+0x10>
    8000480c:	00a7b023          	sd	a0,0(a5)
//    thread_dispatch();
//
//    sem_close(s1);
//    sem_close(s2);

    _thread *user = _thread::createProcess(wraperUserMain, nullptr);
    80004810:	00000593          	li	a1,0
    80004814:	00000517          	auipc	a0,0x0
    80004818:	f6850513          	addi	a0,a0,-152 # 8000477c <_Z14wraperUserMainPv>
    8000481c:	ffffe097          	auipc	ra,0xffffe
    80004820:	800080e7          	jalr	-2048(ra) # 8000201c <_ZN7_thread13createProcessEPFvPvES0_>
    80004824:	00050913          	mv	s2,a0
    user->start();
    80004828:	ffffd097          	auipc	ra,0xffffd
    8000482c:	53c080e7          	jalr	1340(ra) # 80001d64 <_ZN7_thread5startEv>

//    while(!ended) {
//        thread_dispatch();
//    }

    thread_join(user);
    80004830:	00090513          	mv	a0,s2
    80004834:	ffffd097          	auipc	ra,0xffffd
    80004838:	e84080e7          	jalr	-380(ra) # 800016b8 <_Z11thread_joinP7_thread>

    Riscv::restoreSupervisor();
    8000483c:	00000097          	auipc	ra,0x0
    80004840:	194080e7          	jalr	404(ra) # 800049d0 <_ZN5Riscv17restoreSupervisorEv>

    delete user;
    80004844:	02090063          	beqz	s2,80004864 <main+0xac>
    80004848:	01093503          	ld	a0,16(s2)
    8000484c:	00050663          	beqz	a0,80004858 <main+0xa0>
    80004850:	00000097          	auipc	ra,0x0
    80004854:	130080e7          	jalr	304(ra) # 80004980 <_ZdaPv>
    80004858:	00090513          	mv	a0,s2
    8000485c:	ffffd097          	auipc	ra,0xffffd
    80004860:	6d0080e7          	jalr	1744(ra) # 80001f2c <_ZN7_threaddlEPv>

//    delete t2;

//    delete b;

    delete mainT;
    80004864:	02048063          	beqz	s1,80004884 <main+0xcc>
    80004868:	0104b503          	ld	a0,16(s1)
    8000486c:	00050663          	beqz	a0,80004878 <main+0xc0>
    80004870:	00000097          	auipc	ra,0x0
    80004874:	110080e7          	jalr	272(ra) # 80004980 <_ZdaPv>
    80004878:	00048513          	mv	a0,s1
    8000487c:	ffffd097          	auipc	ra,0xffffd
    80004880:	6b0080e7          	jalr	1712(ra) # 80001f2c <_ZN7_threaddlEPv>

    return 1;
}
    80004884:	00100513          	li	a0,1
    80004888:	01813083          	ld	ra,24(sp)
    8000488c:	01013403          	ld	s0,16(sp)
    80004890:	00813483          	ld	s1,8(sp)
    80004894:	00013903          	ld	s2,0(sp)
    80004898:	02010113          	addi	sp,sp,32
    8000489c:	00008067          	ret

00000000800048a0 <_Z9tryToJoinP7MemDesc>:
//

#include "../h/MemDesc.hpp"

// Preuzeto sa kolokvijuma septembar 2015. zadatak 2.
int tryToJoin(MemDesc* node) {
    800048a0:	ff010113          	addi	sp,sp,-16
    800048a4:	00813423          	sd	s0,8(sp)
    800048a8:	01010413          	addi	s0,sp,16
    // if node doesn't exist return
    if (!node) return 0;
    800048ac:	04050663          	beqz	a0,800048f8 <_Z9tryToJoinP7MemDesc+0x58>
    // if next exists and its address is the same as node + node-> size, delete next, increase size of node
    if (node->next && (char*)node+node->size == (char*)(node->next)) {
    800048b0:	00853783          	ld	a5,8(a0)
    800048b4:	04078663          	beqz	a5,80004900 <_Z9tryToJoinP7MemDesc+0x60>
    800048b8:	01053703          	ld	a4,16(a0)
    800048bc:	00e506b3          	add	a3,a0,a4
    800048c0:	00d78a63          	beq	a5,a3,800048d4 <_Z9tryToJoinP7MemDesc+0x34>
        node->next = node->next->next;
        if (node->next) node->next->prev = node;
        return 1;
    }
    else {
        return 0;
    800048c4:	00000513          	li	a0,0
    }
    800048c8:	00813403          	ld	s0,8(sp)
    800048cc:	01010113          	addi	sp,sp,16
    800048d0:	00008067          	ret
        node->size += node->next->size;
    800048d4:	0107b683          	ld	a3,16(a5)
    800048d8:	00d70733          	add	a4,a4,a3
    800048dc:	00e53823          	sd	a4,16(a0)
        node->next = node->next->next;
    800048e0:	0087b783          	ld	a5,8(a5)
    800048e4:	00f53423          	sd	a5,8(a0)
        if (node->next) node->next->prev = node;
    800048e8:	00078463          	beqz	a5,800048f0 <_Z9tryToJoinP7MemDesc+0x50>
    800048ec:	00a7b023          	sd	a0,0(a5)
        return 1;
    800048f0:	00100513          	li	a0,1
    800048f4:	fd5ff06f          	j	800048c8 <_Z9tryToJoinP7MemDesc+0x28>
    if (!node) return 0;
    800048f8:	00000513          	li	a0,0
    800048fc:	fcdff06f          	j	800048c8 <_Z9tryToJoinP7MemDesc+0x28>
        return 0;
    80004900:	00000513          	li	a0,0
    80004904:	fc5ff06f          	j	800048c8 <_Z9tryToJoinP7MemDesc+0x28>

0000000080004908 <_Znwm>:
// Preuzeto sa snimka iz vezbi 7.
//

#include "../h/syscall_c.hpp"

void *operator new(size_t size) {
    80004908:	ff010113          	addi	sp,sp,-16
    8000490c:	00113423          	sd	ra,8(sp)
    80004910:	00813023          	sd	s0,0(sp)
    80004914:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80004918:	ffffd097          	auipc	ra,0xffffd
    8000491c:	bb4080e7          	jalr	-1100(ra) # 800014cc <_Z9mem_allocm>
}
    80004920:	00813083          	ld	ra,8(sp)
    80004924:	00013403          	ld	s0,0(sp)
    80004928:	01010113          	addi	sp,sp,16
    8000492c:	00008067          	ret

0000000080004930 <_Znam>:

void *operator new[](size_t size) {
    80004930:	ff010113          	addi	sp,sp,-16
    80004934:	00113423          	sd	ra,8(sp)
    80004938:	00813023          	sd	s0,0(sp)
    8000493c:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80004940:	ffffd097          	auipc	ra,0xffffd
    80004944:	b8c080e7          	jalr	-1140(ra) # 800014cc <_Z9mem_allocm>
}
    80004948:	00813083          	ld	ra,8(sp)
    8000494c:	00013403          	ld	s0,0(sp)
    80004950:	01010113          	addi	sp,sp,16
    80004954:	00008067          	ret

0000000080004958 <_ZdlPv>:

void operator delete(void *p) noexcept {
    80004958:	ff010113          	addi	sp,sp,-16
    8000495c:	00113423          	sd	ra,8(sp)
    80004960:	00813023          	sd	s0,0(sp)
    80004964:	01010413          	addi	s0,sp,16
    mem_free(p);
    80004968:	ffffd097          	auipc	ra,0xffffd
    8000496c:	bb8080e7          	jalr	-1096(ra) # 80001520 <_Z8mem_freePv>
}
    80004970:	00813083          	ld	ra,8(sp)
    80004974:	00013403          	ld	s0,0(sp)
    80004978:	01010113          	addi	sp,sp,16
    8000497c:	00008067          	ret

0000000080004980 <_ZdaPv>:

void operator delete[](void *p) noexcept {
    80004980:	ff010113          	addi	sp,sp,-16
    80004984:	00113423          	sd	ra,8(sp)
    80004988:	00813023          	sd	s0,0(sp)
    8000498c:	01010413          	addi	s0,sp,16
    mem_free(p);
    80004990:	ffffd097          	auipc	ra,0xffffd
    80004994:	b90080e7          	jalr	-1136(ra) # 80001520 <_Z8mem_freePv>
    80004998:	00813083          	ld	ra,8(sp)
    8000499c:	00013403          	ld	s0,0(sp)
    800049a0:	01010113          	addi	sp,sp,16
    800049a4:	00008067          	ret

00000000800049a8 <_ZN5Riscv10popSppSpieEv>:
#include "../h/MemoryAllocator.hpp"
#include "../h/syscall_c.hpp"
#include "../h/_thread.hpp"
#include "../h/_sem.hpp"

void Riscv::popSppSpie() {
    800049a8:	ff010113          	addi	sp,sp,-16
    800049ac:	00813423          	sd	s0,8(sp)
    800049b0:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
}

inline void Riscv::mc_sstatus(uint64 mask)
{
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    800049b4:	10000793          	li	a5,256
    800049b8:	1007b073          	csrc	sstatus,a5
    mc_sstatus(SSTATUS_SPP);
//    ms_sstatus(SSTATUS_SIE);
    __asm__ volatile ("csrw sepc, ra");
    800049bc:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    800049c0:	10200073          	sret
}
    800049c4:	00813403          	ld	s0,8(sp)
    800049c8:	01010113          	addi	sp,sp,16
    800049cc:	00008067          	ret

00000000800049d0 <_ZN5Riscv17restoreSupervisorEv>:

void Riscv::restoreSupervisor() {
    800049d0:	ff010113          	addi	sp,sp,-16
    800049d4:	00113423          	sd	ra,8(sp)
    800049d8:	00813023          	sd	s0,0(sp)
    800049dc:	01010413          	addi	s0,sp,16
    abiInvoker(SYSTEM_MODE_CHANGE);
    800049e0:	05000513          	li	a0,80
    800049e4:	ffffd097          	auipc	ra,0xffffd
    800049e8:	ab0080e7          	jalr	-1360(ra) # 80001494 <_Z10abiInvokeriz>
}
    800049ec:	00813083          	ld	ra,8(sp)
    800049f0:	00013403          	ld	s0,0(sp)
    800049f4:	01010113          	addi	sp,sp,16
    800049f8:	00008067          	ret

00000000800049fc <_ZN5Riscv20handleSupervisorTrapEv>:

void Riscv::handleSupervisorTrap() {
    800049fc:	fb010113          	addi	sp,sp,-80
    80004a00:	04113423          	sd	ra,72(sp)
    80004a04:	04813023          	sd	s0,64(sp)
    80004a08:	02913c23          	sd	s1,56(sp)
    80004a0c:	03213823          	sd	s2,48(sp)
    80004a10:	03313423          	sd	s3,40(sp)
    80004a14:	05010413          	addi	s0,sp,80
    uint64 abiCode = 0;
    uint64 a1 = 0;
    uint64 a2 = 0;
    uint64 a3 = 0;
    uint64 a4 = 0;
    __asm__ volatile ("mv %0, a0":"=r" (abiCode));
    80004a18:	00050793          	mv	a5,a0
    __asm__ volatile ("mv %0, a1":"=r" (a1));
    80004a1c:	00058493          	mv	s1,a1
    __asm__ volatile ("mv %0, a2":"=r" (a2));
    80004a20:	00060513          	mv	a0,a2
    __asm__ volatile ("mv %0, a3":"=r" (a3));
    80004a24:	00068593          	mv	a1,a3
    __asm__ volatile ("mv %0, a4":"=r" (a4));
    80004a28:	00070713          	mv	a4,a4
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80004a2c:	14202773          	csrr	a4,scause
    80004a30:	fae43823          	sd	a4,-80(s0)
    return scause;
    80004a34:	fb043703          	ld	a4,-80(s0)
    volatile uint64 scauseVar = r_scause();
    80004a38:	fce43423          	sd	a4,-56(s0)
    if (scauseVar == 0x0000000000000008UL || scauseVar == 0x0000000000000009UL) {
    80004a3c:	fc843683          	ld	a3,-56(s0)
    80004a40:	00800713          	li	a4,8
    80004a44:	06e68c63          	beq	a3,a4,80004abc <_ZN5Riscv20handleSupervisorTrapEv+0xc0>
    80004a48:	fc843683          	ld	a3,-56(s0)
    80004a4c:	00900713          	li	a4,9
    80004a50:	06e68663          	beq	a3,a4,80004abc <_ZN5Riscv20handleSupervisorTrapEv+0xc0>
                return;
            }
        }
        w_sstatus(sstatus);
        w_sepc(sepc);
    } else if (scauseVar == 0x0000000000000002UL){
    80004a54:	fc843703          	ld	a4,-56(s0)
    80004a58:	00200793          	li	a5,2
    80004a5c:	1ef70863          	beq	a4,a5,80004c4c <_ZN5Riscv20handleSupervisorTrapEv+0x250>

        *((unsigned int*)0x100000) = 0x5555;

    } else {
        // unexpecter trap
        printString("\n");
    80004a60:	00004517          	auipc	a0,0x4
    80004a64:	92850513          	addi	a0,a0,-1752 # 80008388 <CONSOLE_STATUS+0x378>
    80004a68:	fffff097          	auipc	ra,0xfffff
    80004a6c:	3dc080e7          	jalr	988(ra) # 80003e44 <_Z11printStringPKc>
        printString("scause = ");
    80004a70:	00004517          	auipc	a0,0x4
    80004a74:	9e050513          	addi	a0,a0,-1568 # 80008450 <CONSOLE_STATUS+0x440>
    80004a78:	fffff097          	auipc	ra,0xfffff
    80004a7c:	3cc080e7          	jalr	972(ra) # 80003e44 <_Z11printStringPKc>
        printInt(scauseVar);
    80004a80:	fc843503          	ld	a0,-56(s0)
    80004a84:	00000613          	li	a2,0
    80004a88:	00a00593          	li	a1,10
    80004a8c:	0005051b          	sext.w	a0,a0
    80004a90:	fffff097          	auipc	ra,0xfffff
    80004a94:	564080e7          	jalr	1380(ra) # 80003ff4 <_Z8printIntiii>
        printString("\n");
    80004a98:	00004517          	auipc	a0,0x4
    80004a9c:	8f050513          	addi	a0,a0,-1808 # 80008388 <CONSOLE_STATUS+0x378>
    80004aa0:	fffff097          	auipc	ra,0xfffff
    80004aa4:	3a4080e7          	jalr	932(ra) # 80003e44 <_Z11printStringPKc>

        *((unsigned int*)0x100000) = 0x5555;
    80004aa8:	00100737          	lui	a4,0x100
    80004aac:	000057b7          	lui	a5,0x5
    80004ab0:	5557879b          	addiw	a5,a5,1365
    80004ab4:	00f72023          	sw	a5,0(a4) # 100000 <_entry-0x7ff00000>
    80004ab8:	05c0006f          	j	80004b14 <_ZN5Riscv20handleSupervisorTrapEv+0x118>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80004abc:	14102773          	csrr	a4,sepc
    80004ac0:	fce43023          	sd	a4,-64(s0)
    return sepc;
    80004ac4:	fc043703          	ld	a4,-64(s0)
        uint64 sepc = r_sepc() + 4;
    80004ac8:	00470913          	addi	s2,a4,4
}

inline uint64 Riscv::r_sstatus()
{
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80004acc:	10002773          	csrr	a4,sstatus
    80004ad0:	fae43c23          	sd	a4,-72(s0)
    return sstatus;
    80004ad4:	fb843983          	ld	s3,-72(s0)
        switch (abiCode) {
    80004ad8:	05000713          	li	a4,80
    80004adc:	02f76863          	bltu	a4,a5,80004b0c <_ZN5Riscv20handleSupervisorTrapEv+0x110>
    80004ae0:	00279793          	slli	a5,a5,0x2
    80004ae4:	00004717          	auipc	a4,0x4
    80004ae8:	9a470713          	addi	a4,a4,-1628 # 80008488 <CONSOLE_STATUS+0x478>
    80004aec:	00e787b3          	add	a5,a5,a4
    80004af0:	0007a783          	lw	a5,0(a5) # 5000 <_entry-0x7fffb000>
    80004af4:	00e787b3          	add	a5,a5,a4
    80004af8:	00078067          	jr	a5
                MemoryAllocator::mem_alloc(blks * MEM_BLOCK_SIZE);
    80004afc:	00649513          	slli	a0,s1,0x6
    80004b00:	00001097          	auipc	ra,0x1
    80004b04:	c44080e7          	jalr	-956(ra) # 80005744 <_ZN15MemoryAllocator9mem_allocEm>
                __asm__ volatile("sd a0, 10 * 8(fp)");
    80004b08:	04a43823          	sd	a0,80(s0)
}

inline void Riscv::w_sstatus(uint64 sstatus)
{
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80004b0c:	10099073          	csrw	sstatus,s3
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80004b10:	14191073          	csrw	sepc,s2
    }
}
    80004b14:	04813083          	ld	ra,72(sp)
    80004b18:	04013403          	ld	s0,64(sp)
    80004b1c:	03813483          	ld	s1,56(sp)
    80004b20:	03013903          	ld	s2,48(sp)
    80004b24:	02813983          	ld	s3,40(sp)
    80004b28:	05010113          	addi	sp,sp,80
    80004b2c:	00008067          	ret
                MemoryAllocator::mem_free(ptr);
    80004b30:	00048513          	mv	a0,s1
    80004b34:	00001097          	auipc	ra,0x1
    80004b38:	d74080e7          	jalr	-652(ra) # 800058a8 <_ZN15MemoryAllocator8mem_freeEPv>
                __asm__ volatile("sd a0, 10 * 8(fp)");
    80004b3c:	04a43823          	sd	a0,80(s0)
                break;
    80004b40:	fcdff06f          	j	80004b0c <_ZN5Riscv20handleSupervisorTrapEv+0x110>
                *handle = _thread::createProcess(body, arg);
    80004b44:	ffffd097          	auipc	ra,0xffffd
    80004b48:	4d8080e7          	jalr	1240(ra) # 8000201c <_ZN7_thread13createProcessEPFvPvES0_>
    80004b4c:	00a4b023          	sd	a0,0(s1)
                if (!(*handle)) {
    80004b50:	00050e63          	beqz	a0,80004b6c <_ZN5Riscv20handleSupervisorTrapEv+0x170>
                    __asm__ volatile("mv a0, zero");
    80004b54:	00000513          	li	a0,0
                    (*handle)->start();
    80004b58:	0004b503          	ld	a0,0(s1)
    80004b5c:	ffffd097          	auipc	ra,0xffffd
    80004b60:	208080e7          	jalr	520(ra) # 80001d64 <_ZN7_thread5startEv>
                __asm__ volatile("sd a0, 10 * 8(fp)");
    80004b64:	04a43823          	sd	a0,80(s0)
                break;
    80004b68:	fa5ff06f          	j	80004b0c <_ZN5Riscv20handleSupervisorTrapEv+0x110>
                    __asm__ volatile("li a0, -1");
    80004b6c:	fff00513          	li	a0,-1
    80004b70:	ff5ff06f          	j	80004b64 <_ZN5Riscv20handleSupervisorTrapEv+0x168>
                _thread::dispatch();
    80004b74:	ffffd097          	auipc	ra,0xffffd
    80004b78:	2b4080e7          	jalr	692(ra) # 80001e28 <_ZN7_thread8dispatchEv>
                break;
    80004b7c:	f91ff06f          	j	80004b0c <_ZN5Riscv20handleSupervisorTrapEv+0x110>
                _thread::running->join(handle);
    80004b80:	00048513          	mv	a0,s1
    80004b84:	ffffd097          	auipc	ra,0xffffd
    80004b88:	58c080e7          	jalr	1420(ra) # 80002110 <_ZN7_thread4joinEPS_>
                break;
    80004b8c:	f81ff06f          	j	80004b0c <_ZN5Riscv20handleSupervisorTrapEv+0x110>
                handle->start();
    80004b90:	00048513          	mv	a0,s1
    80004b94:	ffffd097          	auipc	ra,0xffffd
    80004b98:	1d0080e7          	jalr	464(ra) # 80001d64 <_ZN7_thread5startEv>
                break;
    80004b9c:	f71ff06f          	j	80004b0c <_ZN5Riscv20handleSupervisorTrapEv+0x110>
                *handle = _thread::createProcess(body, arg);
    80004ba0:	ffffd097          	auipc	ra,0xffffd
    80004ba4:	47c080e7          	jalr	1148(ra) # 8000201c <_ZN7_thread13createProcessEPFvPvES0_>
    80004ba8:	00a4b023          	sd	a0,0(s1)
                if (!(*handle)) {
    80004bac:	00050863          	beqz	a0,80004bbc <_ZN5Riscv20handleSupervisorTrapEv+0x1c0>
                    __asm__ volatile("mv a0, zero");
    80004bb0:	00000513          	li	a0,0
                __asm__ volatile("sd a0, 10 * 8(fp)");
    80004bb4:	04a43823          	sd	a0,80(s0)
                break;
    80004bb8:	f55ff06f          	j	80004b0c <_ZN5Riscv20handleSupervisorTrapEv+0x110>
                    __asm__ volatile("li a0, -1");
    80004bbc:	fff00513          	li	a0,-1
    80004bc0:	ff5ff06f          	j	80004bb4 <_ZN5Riscv20handleSupervisorTrapEv+0x1b8>
                *handle = _sem::open(init);
    80004bc4:	0005051b          	sext.w	a0,a0
    80004bc8:	00000097          	auipc	ra,0x0
    80004bcc:	3e0080e7          	jalr	992(ra) # 80004fa8 <_ZN4_sem4openEj>
    80004bd0:	00a4b023          	sd	a0,0(s1)
                if (!(*handle)) {
    80004bd4:	00050863          	beqz	a0,80004be4 <_ZN5Riscv20handleSupervisorTrapEv+0x1e8>
                    __asm__ volatile("mv a0, zero");
    80004bd8:	00000513          	li	a0,0
                __asm__ volatile("sd a0, 10 * 8(fp)");
    80004bdc:	04a43823          	sd	a0,80(s0)
                break;
    80004be0:	f2dff06f          	j	80004b0c <_ZN5Riscv20handleSupervisorTrapEv+0x110>
                    __asm__ volatile("li a0, -1");
    80004be4:	fff00513          	li	a0,-1
    80004be8:	ff5ff06f          	j	80004bdc <_ZN5Riscv20handleSupervisorTrapEv+0x1e0>
                handle->close();
    80004bec:	00048513          	mv	a0,s1
    80004bf0:	00000097          	auipc	ra,0x0
    80004bf4:	47c080e7          	jalr	1148(ra) # 8000506c <_ZN4_sem5closeEv>
                break;
    80004bf8:	f15ff06f          	j	80004b0c <_ZN5Riscv20handleSupervisorTrapEv+0x110>
                handle->wait();
    80004bfc:	00048513          	mv	a0,s1
    80004c00:	00000097          	auipc	ra,0x0
    80004c04:	1f0080e7          	jalr	496(ra) # 80004df0 <_ZN4_sem4waitEv>
                break;
    80004c08:	f05ff06f          	j	80004b0c <_ZN5Riscv20handleSupervisorTrapEv+0x110>
                handle->signal();
    80004c0c:	00048513          	mv	a0,s1
    80004c10:	00000097          	auipc	ra,0x0
    80004c14:	264080e7          	jalr	612(ra) # 80004e74 <_ZN4_sem6signalEv>
                break;
    80004c18:	ef5ff06f          	j	80004b0c <_ZN5Riscv20handleSupervisorTrapEv+0x110>
                __getc();
    80004c1c:	00003097          	auipc	ra,0x3
    80004c20:	20c080e7          	jalr	524(ra) # 80007e28 <__getc>
                __asm__ volatile("sd a0, 10 * 8(fp)");
    80004c24:	04a43823          	sd	a0,80(s0)
                break;
    80004c28:	ee5ff06f          	j	80004b0c <_ZN5Riscv20handleSupervisorTrapEv+0x110>
                __putc(c);
    80004c2c:	0ff4f513          	andi	a0,s1,255
    80004c30:	00003097          	auipc	ra,0x3
    80004c34:	1bc080e7          	jalr	444(ra) # 80007dec <__putc>
                break;
    80004c38:	ed5ff06f          	j	80004b0c <_ZN5Riscv20handleSupervisorTrapEv+0x110>
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80004c3c:	10000793          	li	a5,256
    80004c40:	1007a073          	csrs	sstatus,a5
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80004c44:	14191073          	csrw	sepc,s2
                return;
    80004c48:	ecdff06f          	j	80004b14 <_ZN5Riscv20handleSupervisorTrapEv+0x118>
        printString("\n");
    80004c4c:	00003517          	auipc	a0,0x3
    80004c50:	73c50513          	addi	a0,a0,1852 # 80008388 <CONSOLE_STATUS+0x378>
    80004c54:	fffff097          	auipc	ra,0xfffff
    80004c58:	1f0080e7          	jalr	496(ra) # 80003e44 <_Z11printStringPKc>
        printString("scause = ");
    80004c5c:	00003517          	auipc	a0,0x3
    80004c60:	7f450513          	addi	a0,a0,2036 # 80008450 <CONSOLE_STATUS+0x440>
    80004c64:	fffff097          	auipc	ra,0xfffff
    80004c68:	1e0080e7          	jalr	480(ra) # 80003e44 <_Z11printStringPKc>
        printInt(scauseVar);
    80004c6c:	fc843503          	ld	a0,-56(s0)
    80004c70:	00000613          	li	a2,0
    80004c74:	00a00593          	li	a1,10
    80004c78:	0005051b          	sext.w	a0,a0
    80004c7c:	fffff097          	auipc	ra,0xfffff
    80004c80:	378080e7          	jalr	888(ra) # 80003ff4 <_Z8printIntiii>
        printString("\n");
    80004c84:	00003517          	auipc	a0,0x3
    80004c88:	70450513          	addi	a0,a0,1796 # 80008388 <CONSOLE_STATUS+0x378>
    80004c8c:	fffff097          	auipc	ra,0xfffff
    80004c90:	1b8080e7          	jalr	440(ra) # 80003e44 <_Z11printStringPKc>
        printString("illegal instruction\n");
    80004c94:	00003517          	auipc	a0,0x3
    80004c98:	7cc50513          	addi	a0,a0,1996 # 80008460 <CONSOLE_STATUS+0x450>
    80004c9c:	fffff097          	auipc	ra,0xfffff
    80004ca0:	1a8080e7          	jalr	424(ra) # 80003e44 <_Z11printStringPKc>
        printString("shuting down\n");
    80004ca4:	00003517          	auipc	a0,0x3
    80004ca8:	7d450513          	addi	a0,a0,2004 # 80008478 <CONSOLE_STATUS+0x468>
    80004cac:	fffff097          	auipc	ra,0xfffff
    80004cb0:	198080e7          	jalr	408(ra) # 80003e44 <_Z11printStringPKc>
        *((unsigned int*)0x100000) = 0x5555;
    80004cb4:	00100737          	lui	a4,0x100
    80004cb8:	000057b7          	lui	a5,0x5
    80004cbc:	5557879b          	addiw	a5,a5,1365
    80004cc0:	00f72023          	sw	a5,0(a4) # 100000 <_entry-0x7ff00000>
    80004cc4:	e51ff06f          	j	80004b14 <_ZN5Riscv20handleSupervisorTrapEv+0x118>

0000000080004cc8 <_ZN5Riscv10init_stvecEj>:

void Riscv::init_stvec(uint32 vector) {
    80004cc8:	ff010113          	addi	sp,sp,-16
    80004ccc:	00813423          	sd	s0,8(sp)
    80004cd0:	01010413          	addi	s0,sp,16
    w_stvec(vector);
    80004cd4:	02051513          	slli	a0,a0,0x20
    80004cd8:	02055513          	srli	a0,a0,0x20
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    80004cdc:	10551073          	csrw	stvec,a0
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80004ce0:	00200793          	li	a5,2
    80004ce4:	1007a073          	csrs	sstatus,a5
    ms_sstatus(SSTATUS_SIE);
}
    80004ce8:	00813403          	ld	s0,8(sp)
    80004cec:	01010113          	addi	sp,sp,16
    80004cf0:	00008067          	ret

0000000080004cf4 <_ZN5Riscv15handleTimerTrapEv>:

void Riscv::handleTimerTrap() {
    80004cf4:	fd010113          	addi	sp,sp,-48
    80004cf8:	02113423          	sd	ra,40(sp)
    80004cfc:	02813023          	sd	s0,32(sp)
    80004d00:	03010413          	addi	s0,sp,48
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80004d04:	142027f3          	csrr	a5,scause
    80004d08:	fcf43c23          	sd	a5,-40(s0)
    return scause;
    80004d0c:	fd843503          	ld	a0,-40(s0)
    uint64 scauseVar = r_scause();
    if (scauseVar == 0x8000000000000001UL) {
    80004d10:	fff00793          	li	a5,-1
    80004d14:	03f79793          	slli	a5,a5,0x3f
    80004d18:	00178793          	addi	a5,a5,1 # 5001 <_entry-0x7fffafff>
    80004d1c:	04f51063          	bne	a0,a5,80004d5c <_ZN5Riscv15handleTimerTrapEv+0x68>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80004d20:	141027f3          	csrr	a5,sepc
    80004d24:	fef43423          	sd	a5,-24(s0)
    return sepc;
    80004d28:	fe843783          	ld	a5,-24(s0)
        // timer
        uint64 sepc = r_sepc() + 4;
    80004d2c:	00478793          	addi	a5,a5,4
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80004d30:	10002773          	csrr	a4,sstatus
    80004d34:	fee43023          	sd	a4,-32(s0)
    return sstatus;
    80004d38:	fe043703          	ld	a4,-32(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80004d3c:	10071073          	csrw	sstatus,a4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80004d40:	14179073          	csrw	sepc,a5
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    80004d44:	00200793          	li	a5,2
    80004d48:	1447b073          	csrc	sip,a5
    } else {
        // unexpecter trap
        printInt(scauseVar);
        printString("\n");
    }
}
    80004d4c:	02813083          	ld	ra,40(sp)
    80004d50:	02013403          	ld	s0,32(sp)
    80004d54:	03010113          	addi	sp,sp,48
    80004d58:	00008067          	ret
        printInt(scauseVar);
    80004d5c:	00000613          	li	a2,0
    80004d60:	00a00593          	li	a1,10
    80004d64:	0005051b          	sext.w	a0,a0
    80004d68:	fffff097          	auipc	ra,0xfffff
    80004d6c:	28c080e7          	jalr	652(ra) # 80003ff4 <_Z8printIntiii>
        printString("\n");
    80004d70:	00003517          	auipc	a0,0x3
    80004d74:	61850513          	addi	a0,a0,1560 # 80008388 <CONSOLE_STATUS+0x378>
    80004d78:	fffff097          	auipc	ra,0xfffff
    80004d7c:	0cc080e7          	jalr	204(ra) # 80003e44 <_Z11printStringPKc>
}
    80004d80:	fcdff06f          	j	80004d4c <_ZN5Riscv15handleTimerTrapEv+0x58>

0000000080004d84 <_ZN5Riscv17handleConsoleTrapEv>:

void Riscv::handleConsoleTrap() {
    80004d84:	fe010113          	addi	sp,sp,-32
    80004d88:	00113c23          	sd	ra,24(sp)
    80004d8c:	00813823          	sd	s0,16(sp)
    80004d90:	02010413          	addi	s0,sp,32
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80004d94:	142027f3          	csrr	a5,scause
    80004d98:	fef43423          	sd	a5,-24(s0)
    return scause;
    80004d9c:	fe843503          	ld	a0,-24(s0)
    uint64 scauseVar = r_scause();
    if (scauseVar == 0x8000000000000009UL) {
    80004da0:	fff00793          	li	a5,-1
    80004da4:	03f79793          	slli	a5,a5,0x3f
    80004da8:	00978793          	addi	a5,a5,9
    80004dac:	02f50c63          	beq	a0,a5,80004de4 <_ZN5Riscv17handleConsoleTrapEv+0x60>
        // console
        console_handler();
    } else {
        // unexpecter trap
        printInt(scauseVar);
    80004db0:	00000613          	li	a2,0
    80004db4:	00a00593          	li	a1,10
    80004db8:	0005051b          	sext.w	a0,a0
    80004dbc:	fffff097          	auipc	ra,0xfffff
    80004dc0:	238080e7          	jalr	568(ra) # 80003ff4 <_Z8printIntiii>
        printString("\n");
    80004dc4:	00003517          	auipc	a0,0x3
    80004dc8:	5c450513          	addi	a0,a0,1476 # 80008388 <CONSOLE_STATUS+0x378>
    80004dcc:	fffff097          	auipc	ra,0xfffff
    80004dd0:	078080e7          	jalr	120(ra) # 80003e44 <_Z11printStringPKc>
    }
    80004dd4:	01813083          	ld	ra,24(sp)
    80004dd8:	01013403          	ld	s0,16(sp)
    80004ddc:	02010113          	addi	sp,sp,32
    80004de0:	00008067          	ret
        console_handler();
    80004de4:	00003097          	auipc	ra,0x3
    80004de8:	07c080e7          	jalr	124(ra) # 80007e60 <console_handler>
    80004dec:	fe9ff06f          	j	80004dd4 <_ZN5Riscv17handleConsoleTrapEv+0x50>

0000000080004df0 <_ZN4_sem4waitEv>:
    delete this;
    return 0;
}

int _sem::wait() {
    if (--this->val < 0) {
    80004df0:	00052783          	lw	a5,0(a0)
    80004df4:	fff7879b          	addiw	a5,a5,-1
    80004df8:	00f52023          	sw	a5,0(a0)
    80004dfc:	02079713          	slli	a4,a5,0x20
    80004e00:	00074663          	bltz	a4,80004e0c <_ZN4_sem4waitEv+0x1c>
        _thread::running->setBlocked(true);
        this->blocked->addLast(_thread::running);
        _thread::running->dispatch();
    }
    return 0;
}
    80004e04:	00000513          	li	a0,0
    80004e08:	00008067          	ret
int _sem::wait() {
    80004e0c:	fe010113          	addi	sp,sp,-32
    80004e10:	00113c23          	sd	ra,24(sp)
    80004e14:	00813823          	sd	s0,16(sp)
    80004e18:	00913423          	sd	s1,8(sp)
    80004e1c:	01213023          	sd	s2,0(sp)
    80004e20:	02010413          	addi	s0,sp,32
    80004e24:	00050493          	mv	s1,a0
        _thread::running->setBlocked(true);
    80004e28:	00005917          	auipc	s2,0x5
    80004e2c:	71893903          	ld	s2,1816(s2) # 8000a540 <_GLOBAL_OFFSET_TABLE_+0x10>
    80004e30:	00100593          	li	a1,1
    80004e34:	00093503          	ld	a0,0(s2)
    80004e38:	ffffd097          	auipc	ra,0xffffd
    80004e3c:	2a0080e7          	jalr	672(ra) # 800020d8 <_ZN7_thread10setBlockedEb>
        this->blocked->addLast(_thread::running);
    80004e40:	00093583          	ld	a1,0(s2)
    80004e44:	0084b503          	ld	a0,8(s1)
    80004e48:	ffffd097          	auipc	ra,0xffffd
    80004e4c:	474080e7          	jalr	1140(ra) # 800022bc <_ZN4List7addLastEP7_thread>
        _thread::running->dispatch();
    80004e50:	ffffd097          	auipc	ra,0xffffd
    80004e54:	fd8080e7          	jalr	-40(ra) # 80001e28 <_ZN7_thread8dispatchEv>
}
    80004e58:	00000513          	li	a0,0
    80004e5c:	01813083          	ld	ra,24(sp)
    80004e60:	01013403          	ld	s0,16(sp)
    80004e64:	00813483          	ld	s1,8(sp)
    80004e68:	00013903          	ld	s2,0(sp)
    80004e6c:	02010113          	addi	sp,sp,32
    80004e70:	00008067          	ret

0000000080004e74 <_ZN4_sem6signalEv>:

int _sem::signal() {
    if (++this->val <= 0) {
    80004e74:	00052783          	lw	a5,0(a0)
    80004e78:	0017879b          	addiw	a5,a5,1
    80004e7c:	0007871b          	sext.w	a4,a5
    80004e80:	00f52023          	sw	a5,0(a0)
    80004e84:	00e05663          	blez	a4,80004e90 <_ZN4_sem6signalEv+0x1c>
            t->setBlocked(false);
            Scheduler::put(t);
        }
    }
    return 0;
}
    80004e88:	00000513          	li	a0,0
    80004e8c:	00008067          	ret
int _sem::signal() {
    80004e90:	fe010113          	addi	sp,sp,-32
    80004e94:	00113c23          	sd	ra,24(sp)
    80004e98:	00813823          	sd	s0,16(sp)
    80004e9c:	00913423          	sd	s1,8(sp)
    80004ea0:	02010413          	addi	s0,sp,32
        _thread* t = this->blocked->removeFirst();
    80004ea4:	00853503          	ld	a0,8(a0)
    80004ea8:	ffffd097          	auipc	ra,0xffffd
    80004eac:	47c080e7          	jalr	1148(ra) # 80002324 <_ZN4List11removeFirstEv>
    80004eb0:	00050493          	mv	s1,a0
        if (t) {
    80004eb4:	00050e63          	beqz	a0,80004ed0 <_ZN4_sem6signalEv+0x5c>
            t->setBlocked(false);
    80004eb8:	00000593          	li	a1,0
    80004ebc:	ffffd097          	auipc	ra,0xffffd
    80004ec0:	21c080e7          	jalr	540(ra) # 800020d8 <_ZN7_thread10setBlockedEb>
            Scheduler::put(t);
    80004ec4:	00048513          	mv	a0,s1
    80004ec8:	fffff097          	auipc	ra,0xfffff
    80004ecc:	7fc080e7          	jalr	2044(ra) # 800046c4 <_ZN9Scheduler3putEP7_thread>
}
    80004ed0:	00000513          	li	a0,0
    80004ed4:	01813083          	ld	ra,24(sp)
    80004ed8:	01013403          	ld	s0,16(sp)
    80004edc:	00813483          	ld	s1,8(sp)
    80004ee0:	02010113          	addi	sp,sp,32
    80004ee4:	00008067          	ret

0000000080004ee8 <_ZN4_semC1Ej>:

_sem::_sem(unsigned int init) {
    80004ee8:	fe010113          	addi	sp,sp,-32
    80004eec:	00113c23          	sd	ra,24(sp)
    80004ef0:	00813823          	sd	s0,16(sp)
    80004ef4:	00913423          	sd	s1,8(sp)
    80004ef8:	02010413          	addi	s0,sp,32
    80004efc:	00050493          	mv	s1,a0
    this->val = init;
    80004f00:	00b52023          	sw	a1,0(a0)
    this->blocked = (List*) (MemoryAllocator::mem_alloc(sizeof(List)));
    80004f04:	01000513          	li	a0,16
    80004f08:	00001097          	auipc	ra,0x1
    80004f0c:	83c080e7          	jalr	-1988(ra) # 80005744 <_ZN15MemoryAllocator9mem_allocEm>
    80004f10:	00a4b423          	sd	a0,8(s1)
    this->blocked->init();
    80004f14:	ffffd097          	auipc	ra,0xffffd
    80004f18:	530080e7          	jalr	1328(ra) # 80002444 <_ZN4List4initEv>
}
    80004f1c:	01813083          	ld	ra,24(sp)
    80004f20:	01013403          	ld	s0,16(sp)
    80004f24:	00813483          	ld	s1,8(sp)
    80004f28:	02010113          	addi	sp,sp,32
    80004f2c:	00008067          	ret

0000000080004f30 <_ZN4_semnwEm>:

void *_sem::operator new(size_t size) {
    80004f30:	ff010113          	addi	sp,sp,-16
    80004f34:	00113423          	sd	ra,8(sp)
    80004f38:	00813023          	sd	s0,0(sp)
    80004f3c:	01010413          	addi	s0,sp,16
    return MemoryAllocator::mem_alloc(size);
    80004f40:	00001097          	auipc	ra,0x1
    80004f44:	804080e7          	jalr	-2044(ra) # 80005744 <_ZN15MemoryAllocator9mem_allocEm>
}
    80004f48:	00813083          	ld	ra,8(sp)
    80004f4c:	00013403          	ld	s0,0(sp)
    80004f50:	01010113          	addi	sp,sp,16
    80004f54:	00008067          	ret

0000000080004f58 <_ZN4_semnaEm>:

void *_sem::operator new[](size_t size) {
    80004f58:	ff010113          	addi	sp,sp,-16
    80004f5c:	00113423          	sd	ra,8(sp)
    80004f60:	00813023          	sd	s0,0(sp)
    80004f64:	01010413          	addi	s0,sp,16
    return MemoryAllocator::mem_alloc(size);
    80004f68:	00000097          	auipc	ra,0x0
    80004f6c:	7dc080e7          	jalr	2012(ra) # 80005744 <_ZN15MemoryAllocator9mem_allocEm>
}
    80004f70:	00813083          	ld	ra,8(sp)
    80004f74:	00013403          	ld	s0,0(sp)
    80004f78:	01010113          	addi	sp,sp,16
    80004f7c:	00008067          	ret

0000000080004f80 <_ZN4_semdlEPv>:

void _sem::operator delete(void *ptr) {
    80004f80:	ff010113          	addi	sp,sp,-16
    80004f84:	00113423          	sd	ra,8(sp)
    80004f88:	00813023          	sd	s0,0(sp)
    80004f8c:	01010413          	addi	s0,sp,16
    MemoryAllocator::mem_free(ptr);
    80004f90:	00001097          	auipc	ra,0x1
    80004f94:	918080e7          	jalr	-1768(ra) # 800058a8 <_ZN15MemoryAllocator8mem_freeEPv>
}
    80004f98:	00813083          	ld	ra,8(sp)
    80004f9c:	00013403          	ld	s0,0(sp)
    80004fa0:	01010113          	addi	sp,sp,16
    80004fa4:	00008067          	ret

0000000080004fa8 <_ZN4_sem4openEj>:
_sem *_sem::open(unsigned int init) {
    80004fa8:	fe010113          	addi	sp,sp,-32
    80004fac:	00113c23          	sd	ra,24(sp)
    80004fb0:	00813823          	sd	s0,16(sp)
    80004fb4:	00913423          	sd	s1,8(sp)
    80004fb8:	01213023          	sd	s2,0(sp)
    80004fbc:	02010413          	addi	s0,sp,32
    80004fc0:	00050913          	mv	s2,a0
    return new _sem(init);
    80004fc4:	01000513          	li	a0,16
    80004fc8:	00000097          	auipc	ra,0x0
    80004fcc:	f68080e7          	jalr	-152(ra) # 80004f30 <_ZN4_semnwEm>
    80004fd0:	00050493          	mv	s1,a0
    80004fd4:	00090593          	mv	a1,s2
    80004fd8:	00000097          	auipc	ra,0x0
    80004fdc:	f10080e7          	jalr	-240(ra) # 80004ee8 <_ZN4_semC1Ej>
    80004fe0:	0200006f          	j	80005000 <_ZN4_sem4openEj+0x58>
    80004fe4:	00050913          	mv	s2,a0
    80004fe8:	00048513          	mv	a0,s1
    80004fec:	00000097          	auipc	ra,0x0
    80004ff0:	f94080e7          	jalr	-108(ra) # 80004f80 <_ZN4_semdlEPv>
    80004ff4:	00090513          	mv	a0,s2
    80004ff8:	00006097          	auipc	ra,0x6
    80004ffc:	6f0080e7          	jalr	1776(ra) # 8000b6e8 <_Unwind_Resume>
}
    80005000:	00048513          	mv	a0,s1
    80005004:	01813083          	ld	ra,24(sp)
    80005008:	01013403          	ld	s0,16(sp)
    8000500c:	00813483          	ld	s1,8(sp)
    80005010:	00013903          	ld	s2,0(sp)
    80005014:	02010113          	addi	sp,sp,32
    80005018:	00008067          	ret

000000008000501c <_ZN4_semdaEPv>:

void _sem::operator delete[](void *ptr) {
    8000501c:	ff010113          	addi	sp,sp,-16
    80005020:	00113423          	sd	ra,8(sp)
    80005024:	00813023          	sd	s0,0(sp)
    80005028:	01010413          	addi	s0,sp,16
    MemoryAllocator::mem_free(ptr);
    8000502c:	00001097          	auipc	ra,0x1
    80005030:	87c080e7          	jalr	-1924(ra) # 800058a8 <_ZN15MemoryAllocator8mem_freeEPv>
}
    80005034:	00813083          	ld	ra,8(sp)
    80005038:	00013403          	ld	s0,0(sp)
    8000503c:	01010113          	addi	sp,sp,16
    80005040:	00008067          	ret

0000000080005044 <_ZN4_semD1Ev>:

_sem::~_sem() {
    80005044:	ff010113          	addi	sp,sp,-16
    80005048:	00113423          	sd	ra,8(sp)
    8000504c:	00813023          	sd	s0,0(sp)
    80005050:	01010413          	addi	s0,sp,16
    MemoryAllocator::mem_free(this);
    80005054:	00001097          	auipc	ra,0x1
    80005058:	854080e7          	jalr	-1964(ra) # 800058a8 <_ZN15MemoryAllocator8mem_freeEPv>
}
    8000505c:	00813083          	ld	ra,8(sp)
    80005060:	00013403          	ld	s0,0(sp)
    80005064:	01010113          	addi	sp,sp,16
    80005068:	00008067          	ret

000000008000506c <_ZN4_sem5closeEv>:
int _sem::close() {
    8000506c:	fe010113          	addi	sp,sp,-32
    80005070:	00113c23          	sd	ra,24(sp)
    80005074:	00813823          	sd	s0,16(sp)
    80005078:	00913423          	sd	s1,8(sp)
    8000507c:	01213023          	sd	s2,0(sp)
    80005080:	02010413          	addi	s0,sp,32
    80005084:	00050913          	mv	s2,a0
    _thread* t = this->blocked->removeFirst();
    80005088:	00853503          	ld	a0,8(a0)
    8000508c:	ffffd097          	auipc	ra,0xffffd
    80005090:	298080e7          	jalr	664(ra) # 80002324 <_ZN4List11removeFirstEv>
    80005094:	00050493          	mv	s1,a0
    while(t) {
    80005098:	02048a63          	beqz	s1,800050cc <_ZN4_sem5closeEv+0x60>
        t->setBlocked(false);
    8000509c:	00000593          	li	a1,0
    800050a0:	00048513          	mv	a0,s1
    800050a4:	ffffd097          	auipc	ra,0xffffd
    800050a8:	034080e7          	jalr	52(ra) # 800020d8 <_ZN7_thread10setBlockedEb>
        Scheduler::put(t);
    800050ac:	00048513          	mv	a0,s1
    800050b0:	fffff097          	auipc	ra,0xfffff
    800050b4:	614080e7          	jalr	1556(ra) # 800046c4 <_ZN9Scheduler3putEP7_thread>
        t = this->blocked->removeFirst();
    800050b8:	00893503          	ld	a0,8(s2)
    800050bc:	ffffd097          	auipc	ra,0xffffd
    800050c0:	268080e7          	jalr	616(ra) # 80002324 <_ZN4List11removeFirstEv>
    800050c4:	00050493          	mv	s1,a0
    while(t) {
    800050c8:	fd1ff06f          	j	80005098 <_ZN4_sem5closeEv+0x2c>
    MemoryAllocator::mem_free(this->blocked);
    800050cc:	00893503          	ld	a0,8(s2)
    800050d0:	00000097          	auipc	ra,0x0
    800050d4:	7d8080e7          	jalr	2008(ra) # 800058a8 <_ZN15MemoryAllocator8mem_freeEPv>
    delete this;
    800050d8:	00090513          	mv	a0,s2
    800050dc:	00000097          	auipc	ra,0x0
    800050e0:	f68080e7          	jalr	-152(ra) # 80005044 <_ZN4_semD1Ev>
    800050e4:	00090513          	mv	a0,s2
    800050e8:	00000097          	auipc	ra,0x0
    800050ec:	e98080e7          	jalr	-360(ra) # 80004f80 <_ZN4_semdlEPv>
}
    800050f0:	00000513          	li	a0,0
    800050f4:	01813083          	ld	ra,24(sp)
    800050f8:	01013403          	ld	s0,16(sp)
    800050fc:	00813483          	ld	s1,8(sp)
    80005100:	00013903          	ld	s2,0(sp)
    80005104:	02010113          	addi	sp,sp,32
    80005108:	00008067          	ret

000000008000510c <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    8000510c:	fe010113          	addi	sp,sp,-32
    80005110:	00113c23          	sd	ra,24(sp)
    80005114:	00813823          	sd	s0,16(sp)
    80005118:	00913423          	sd	s1,8(sp)
    8000511c:	01213023          	sd	s2,0(sp)
    80005120:	02010413          	addi	s0,sp,32
    80005124:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80005128:	00100793          	li	a5,1
    8000512c:	02a7f863          	bgeu	a5,a0,8000515c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80005130:	00a00793          	li	a5,10
    80005134:	02f577b3          	remu	a5,a0,a5
    80005138:	02078e63          	beqz	a5,80005174 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    8000513c:	fff48513          	addi	a0,s1,-1
    80005140:	00000097          	auipc	ra,0x0
    80005144:	fcc080e7          	jalr	-52(ra) # 8000510c <_ZL9fibonaccim>
    80005148:	00050913          	mv	s2,a0
    8000514c:	ffe48513          	addi	a0,s1,-2
    80005150:	00000097          	auipc	ra,0x0
    80005154:	fbc080e7          	jalr	-68(ra) # 8000510c <_ZL9fibonaccim>
    80005158:	00a90533          	add	a0,s2,a0
}
    8000515c:	01813083          	ld	ra,24(sp)
    80005160:	01013403          	ld	s0,16(sp)
    80005164:	00813483          	ld	s1,8(sp)
    80005168:	00013903          	ld	s2,0(sp)
    8000516c:	02010113          	addi	sp,sp,32
    80005170:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80005174:	ffffc097          	auipc	ra,0xffffc
    80005178:	518080e7          	jalr	1304(ra) # 8000168c <_Z15thread_dispatchv>
    8000517c:	fc1ff06f          	j	8000513c <_ZL9fibonaccim+0x30>

0000000080005180 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80005180:	fe010113          	addi	sp,sp,-32
    80005184:	00113c23          	sd	ra,24(sp)
    80005188:	00813823          	sd	s0,16(sp)
    8000518c:	00913423          	sd	s1,8(sp)
    80005190:	01213023          	sd	s2,0(sp)
    80005194:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80005198:	00a00493          	li	s1,10
    8000519c:	0400006f          	j	800051dc <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800051a0:	00003517          	auipc	a0,0x3
    800051a4:	fc850513          	addi	a0,a0,-56 # 80008168 <CONSOLE_STATUS+0x158>
    800051a8:	fffff097          	auipc	ra,0xfffff
    800051ac:	c9c080e7          	jalr	-868(ra) # 80003e44 <_Z11printStringPKc>
    800051b0:	00000613          	li	a2,0
    800051b4:	00a00593          	li	a1,10
    800051b8:	00048513          	mv	a0,s1
    800051bc:	fffff097          	auipc	ra,0xfffff
    800051c0:	e38080e7          	jalr	-456(ra) # 80003ff4 <_Z8printIntiii>
    800051c4:	00003517          	auipc	a0,0x3
    800051c8:	1c450513          	addi	a0,a0,452 # 80008388 <CONSOLE_STATUS+0x378>
    800051cc:	fffff097          	auipc	ra,0xfffff
    800051d0:	c78080e7          	jalr	-904(ra) # 80003e44 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800051d4:	0014849b          	addiw	s1,s1,1
    800051d8:	0ff4f493          	andi	s1,s1,255
    800051dc:	00c00793          	li	a5,12
    800051e0:	fc97f0e3          	bgeu	a5,s1,800051a0 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800051e4:	00003517          	auipc	a0,0x3
    800051e8:	f8c50513          	addi	a0,a0,-116 # 80008170 <CONSOLE_STATUS+0x160>
    800051ec:	fffff097          	auipc	ra,0xfffff
    800051f0:	c58080e7          	jalr	-936(ra) # 80003e44 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800051f4:	00500313          	li	t1,5
    thread_dispatch();
    800051f8:	ffffc097          	auipc	ra,0xffffc
    800051fc:	494080e7          	jalr	1172(ra) # 8000168c <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80005200:	01000513          	li	a0,16
    80005204:	00000097          	auipc	ra,0x0
    80005208:	f08080e7          	jalr	-248(ra) # 8000510c <_ZL9fibonaccim>
    8000520c:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80005210:	00003517          	auipc	a0,0x3
    80005214:	f7050513          	addi	a0,a0,-144 # 80008180 <CONSOLE_STATUS+0x170>
    80005218:	fffff097          	auipc	ra,0xfffff
    8000521c:	c2c080e7          	jalr	-980(ra) # 80003e44 <_Z11printStringPKc>
    80005220:	00000613          	li	a2,0
    80005224:	00a00593          	li	a1,10
    80005228:	0009051b          	sext.w	a0,s2
    8000522c:	fffff097          	auipc	ra,0xfffff
    80005230:	dc8080e7          	jalr	-568(ra) # 80003ff4 <_Z8printIntiii>
    80005234:	00003517          	auipc	a0,0x3
    80005238:	15450513          	addi	a0,a0,340 # 80008388 <CONSOLE_STATUS+0x378>
    8000523c:	fffff097          	auipc	ra,0xfffff
    80005240:	c08080e7          	jalr	-1016(ra) # 80003e44 <_Z11printStringPKc>
    80005244:	0400006f          	j	80005284 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005248:	00003517          	auipc	a0,0x3
    8000524c:	f2050513          	addi	a0,a0,-224 # 80008168 <CONSOLE_STATUS+0x158>
    80005250:	fffff097          	auipc	ra,0xfffff
    80005254:	bf4080e7          	jalr	-1036(ra) # 80003e44 <_Z11printStringPKc>
    80005258:	00000613          	li	a2,0
    8000525c:	00a00593          	li	a1,10
    80005260:	00048513          	mv	a0,s1
    80005264:	fffff097          	auipc	ra,0xfffff
    80005268:	d90080e7          	jalr	-624(ra) # 80003ff4 <_Z8printIntiii>
    8000526c:	00003517          	auipc	a0,0x3
    80005270:	11c50513          	addi	a0,a0,284 # 80008388 <CONSOLE_STATUS+0x378>
    80005274:	fffff097          	auipc	ra,0xfffff
    80005278:	bd0080e7          	jalr	-1072(ra) # 80003e44 <_Z11printStringPKc>
    for (; i < 16; i++) {
    8000527c:	0014849b          	addiw	s1,s1,1
    80005280:	0ff4f493          	andi	s1,s1,255
    80005284:	00f00793          	li	a5,15
    80005288:	fc97f0e3          	bgeu	a5,s1,80005248 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    8000528c:	00003517          	auipc	a0,0x3
    80005290:	f0450513          	addi	a0,a0,-252 # 80008190 <CONSOLE_STATUS+0x180>
    80005294:	fffff097          	auipc	ra,0xfffff
    80005298:	bb0080e7          	jalr	-1104(ra) # 80003e44 <_Z11printStringPKc>
    finishedD = true;
    8000529c:	00100793          	li	a5,1
    800052a0:	00005717          	auipc	a4,0x5
    800052a4:	34f70ca3          	sb	a5,857(a4) # 8000a5f9 <_ZL9finishedD>
    thread_dispatch();
    800052a8:	ffffc097          	auipc	ra,0xffffc
    800052ac:	3e4080e7          	jalr	996(ra) # 8000168c <_Z15thread_dispatchv>
}
    800052b0:	01813083          	ld	ra,24(sp)
    800052b4:	01013403          	ld	s0,16(sp)
    800052b8:	00813483          	ld	s1,8(sp)
    800052bc:	00013903          	ld	s2,0(sp)
    800052c0:	02010113          	addi	sp,sp,32
    800052c4:	00008067          	ret

00000000800052c8 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800052c8:	fe010113          	addi	sp,sp,-32
    800052cc:	00113c23          	sd	ra,24(sp)
    800052d0:	00813823          	sd	s0,16(sp)
    800052d4:	00913423          	sd	s1,8(sp)
    800052d8:	01213023          	sd	s2,0(sp)
    800052dc:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800052e0:	00000493          	li	s1,0
    800052e4:	0400006f          	j	80005324 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800052e8:	00003517          	auipc	a0,0x3
    800052ec:	e5050513          	addi	a0,a0,-432 # 80008138 <CONSOLE_STATUS+0x128>
    800052f0:	fffff097          	auipc	ra,0xfffff
    800052f4:	b54080e7          	jalr	-1196(ra) # 80003e44 <_Z11printStringPKc>
    800052f8:	00000613          	li	a2,0
    800052fc:	00a00593          	li	a1,10
    80005300:	00048513          	mv	a0,s1
    80005304:	fffff097          	auipc	ra,0xfffff
    80005308:	cf0080e7          	jalr	-784(ra) # 80003ff4 <_Z8printIntiii>
    8000530c:	00003517          	auipc	a0,0x3
    80005310:	07c50513          	addi	a0,a0,124 # 80008388 <CONSOLE_STATUS+0x378>
    80005314:	fffff097          	auipc	ra,0xfffff
    80005318:	b30080e7          	jalr	-1232(ra) # 80003e44 <_Z11printStringPKc>
    for (; i < 3; i++) {
    8000531c:	0014849b          	addiw	s1,s1,1
    80005320:	0ff4f493          	andi	s1,s1,255
    80005324:	00200793          	li	a5,2
    80005328:	fc97f0e3          	bgeu	a5,s1,800052e8 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    8000532c:	00003517          	auipc	a0,0x3
    80005330:	e1450513          	addi	a0,a0,-492 # 80008140 <CONSOLE_STATUS+0x130>
    80005334:	fffff097          	auipc	ra,0xfffff
    80005338:	b10080e7          	jalr	-1264(ra) # 80003e44 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    8000533c:	00700313          	li	t1,7
    thread_dispatch();
    80005340:	ffffc097          	auipc	ra,0xffffc
    80005344:	34c080e7          	jalr	844(ra) # 8000168c <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80005348:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    8000534c:	00003517          	auipc	a0,0x3
    80005350:	e0450513          	addi	a0,a0,-508 # 80008150 <CONSOLE_STATUS+0x140>
    80005354:	fffff097          	auipc	ra,0xfffff
    80005358:	af0080e7          	jalr	-1296(ra) # 80003e44 <_Z11printStringPKc>
    8000535c:	00000613          	li	a2,0
    80005360:	00a00593          	li	a1,10
    80005364:	0009051b          	sext.w	a0,s2
    80005368:	fffff097          	auipc	ra,0xfffff
    8000536c:	c8c080e7          	jalr	-884(ra) # 80003ff4 <_Z8printIntiii>
    80005370:	00003517          	auipc	a0,0x3
    80005374:	01850513          	addi	a0,a0,24 # 80008388 <CONSOLE_STATUS+0x378>
    80005378:	fffff097          	auipc	ra,0xfffff
    8000537c:	acc080e7          	jalr	-1332(ra) # 80003e44 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80005380:	00c00513          	li	a0,12
    80005384:	00000097          	auipc	ra,0x0
    80005388:	d88080e7          	jalr	-632(ra) # 8000510c <_ZL9fibonaccim>
    8000538c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80005390:	00003517          	auipc	a0,0x3
    80005394:	dc850513          	addi	a0,a0,-568 # 80008158 <CONSOLE_STATUS+0x148>
    80005398:	fffff097          	auipc	ra,0xfffff
    8000539c:	aac080e7          	jalr	-1364(ra) # 80003e44 <_Z11printStringPKc>
    800053a0:	00000613          	li	a2,0
    800053a4:	00a00593          	li	a1,10
    800053a8:	0009051b          	sext.w	a0,s2
    800053ac:	fffff097          	auipc	ra,0xfffff
    800053b0:	c48080e7          	jalr	-952(ra) # 80003ff4 <_Z8printIntiii>
    800053b4:	00003517          	auipc	a0,0x3
    800053b8:	fd450513          	addi	a0,a0,-44 # 80008388 <CONSOLE_STATUS+0x378>
    800053bc:	fffff097          	auipc	ra,0xfffff
    800053c0:	a88080e7          	jalr	-1400(ra) # 80003e44 <_Z11printStringPKc>
    800053c4:	0400006f          	j	80005404 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800053c8:	00003517          	auipc	a0,0x3
    800053cc:	d7050513          	addi	a0,a0,-656 # 80008138 <CONSOLE_STATUS+0x128>
    800053d0:	fffff097          	auipc	ra,0xfffff
    800053d4:	a74080e7          	jalr	-1420(ra) # 80003e44 <_Z11printStringPKc>
    800053d8:	00000613          	li	a2,0
    800053dc:	00a00593          	li	a1,10
    800053e0:	00048513          	mv	a0,s1
    800053e4:	fffff097          	auipc	ra,0xfffff
    800053e8:	c10080e7          	jalr	-1008(ra) # 80003ff4 <_Z8printIntiii>
    800053ec:	00003517          	auipc	a0,0x3
    800053f0:	f9c50513          	addi	a0,a0,-100 # 80008388 <CONSOLE_STATUS+0x378>
    800053f4:	fffff097          	auipc	ra,0xfffff
    800053f8:	a50080e7          	jalr	-1456(ra) # 80003e44 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800053fc:	0014849b          	addiw	s1,s1,1
    80005400:	0ff4f493          	andi	s1,s1,255
    80005404:	00500793          	li	a5,5
    80005408:	fc97f0e3          	bgeu	a5,s1,800053c8 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    8000540c:	00003517          	auipc	a0,0x3
    80005410:	d0450513          	addi	a0,a0,-764 # 80008110 <CONSOLE_STATUS+0x100>
    80005414:	fffff097          	auipc	ra,0xfffff
    80005418:	a30080e7          	jalr	-1488(ra) # 80003e44 <_Z11printStringPKc>
    finishedC = true;
    8000541c:	00100793          	li	a5,1
    80005420:	00005717          	auipc	a4,0x5
    80005424:	1cf70d23          	sb	a5,474(a4) # 8000a5fa <_ZL9finishedC>
    thread_dispatch();
    80005428:	ffffc097          	auipc	ra,0xffffc
    8000542c:	264080e7          	jalr	612(ra) # 8000168c <_Z15thread_dispatchv>
}
    80005430:	01813083          	ld	ra,24(sp)
    80005434:	01013403          	ld	s0,16(sp)
    80005438:	00813483          	ld	s1,8(sp)
    8000543c:	00013903          	ld	s2,0(sp)
    80005440:	02010113          	addi	sp,sp,32
    80005444:	00008067          	ret

0000000080005448 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80005448:	fe010113          	addi	sp,sp,-32
    8000544c:	00113c23          	sd	ra,24(sp)
    80005450:	00813823          	sd	s0,16(sp)
    80005454:	00913423          	sd	s1,8(sp)
    80005458:	01213023          	sd	s2,0(sp)
    8000545c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80005460:	00000913          	li	s2,0
    80005464:	03c0006f          	j	800054a0 <_ZL11workerBodyBPv+0x58>
            thread_dispatch();
    80005468:	ffffc097          	auipc	ra,0xffffc
    8000546c:	224080e7          	jalr	548(ra) # 8000168c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10; j++) {
    80005470:	00148493          	addi	s1,s1,1
    80005474:	00900793          	li	a5,9
    80005478:	0097ee63          	bltu	a5,s1,80005494 <_ZL11workerBodyBPv+0x4c>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    8000547c:	00000713          	li	a4,0
    80005480:	000077b7          	lui	a5,0x7
    80005484:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005488:	fee7e0e3          	bltu	a5,a4,80005468 <_ZL11workerBodyBPv+0x20>
    8000548c:	00170713          	addi	a4,a4,1
    80005490:	ff1ff06f          	j	80005480 <_ZL11workerBodyBPv+0x38>
        if (i == 10) {
    80005494:	00a00793          	li	a5,10
    80005498:	04f90663          	beq	s2,a5,800054e4 <_ZL11workerBodyBPv+0x9c>
    for (uint64 i = 0; i < 16; i++) {
    8000549c:	00190913          	addi	s2,s2,1
    800054a0:	00f00793          	li	a5,15
    800054a4:	0527e463          	bltu	a5,s2,800054ec <_ZL11workerBodyBPv+0xa4>
        printString("B: i="); printInt(i); printString("\n");
    800054a8:	00003517          	auipc	a0,0x3
    800054ac:	c7850513          	addi	a0,a0,-904 # 80008120 <CONSOLE_STATUS+0x110>
    800054b0:	fffff097          	auipc	ra,0xfffff
    800054b4:	994080e7          	jalr	-1644(ra) # 80003e44 <_Z11printStringPKc>
    800054b8:	00000613          	li	a2,0
    800054bc:	00a00593          	li	a1,10
    800054c0:	0009051b          	sext.w	a0,s2
    800054c4:	fffff097          	auipc	ra,0xfffff
    800054c8:	b30080e7          	jalr	-1232(ra) # 80003ff4 <_Z8printIntiii>
    800054cc:	00003517          	auipc	a0,0x3
    800054d0:	ebc50513          	addi	a0,a0,-324 # 80008388 <CONSOLE_STATUS+0x378>
    800054d4:	fffff097          	auipc	ra,0xfffff
    800054d8:	970080e7          	jalr	-1680(ra) # 80003e44 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10; j++) {
    800054dc:	00000493          	li	s1,0
    800054e0:	f95ff06f          	j	80005474 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    800054e4:	14102ff3          	csrr	t6,sepc
    800054e8:	fb5ff06f          	j	8000549c <_ZL11workerBodyBPv+0x54>
    printString("B finished!\n");
    800054ec:	00003517          	auipc	a0,0x3
    800054f0:	c3c50513          	addi	a0,a0,-964 # 80008128 <CONSOLE_STATUS+0x118>
    800054f4:	fffff097          	auipc	ra,0xfffff
    800054f8:	950080e7          	jalr	-1712(ra) # 80003e44 <_Z11printStringPKc>
    finishedB = true;
    800054fc:	00100793          	li	a5,1
    80005500:	00005717          	auipc	a4,0x5
    80005504:	0ef70da3          	sb	a5,251(a4) # 8000a5fb <_ZL9finishedB>
    thread_dispatch();
    80005508:	ffffc097          	auipc	ra,0xffffc
    8000550c:	184080e7          	jalr	388(ra) # 8000168c <_Z15thread_dispatchv>
}
    80005510:	01813083          	ld	ra,24(sp)
    80005514:	01013403          	ld	s0,16(sp)
    80005518:	00813483          	ld	s1,8(sp)
    8000551c:	00013903          	ld	s2,0(sp)
    80005520:	02010113          	addi	sp,sp,32
    80005524:	00008067          	ret

0000000080005528 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80005528:	fe010113          	addi	sp,sp,-32
    8000552c:	00113c23          	sd	ra,24(sp)
    80005530:	00813823          	sd	s0,16(sp)
    80005534:	00913423          	sd	s1,8(sp)
    80005538:	01213023          	sd	s2,0(sp)
    8000553c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80005540:	00000913          	li	s2,0
    80005544:	0340006f          	j	80005578 <_ZL11workerBodyAPv+0x50>
            thread_dispatch();
    80005548:	ffffc097          	auipc	ra,0xffffc
    8000554c:	144080e7          	jalr	324(ra) # 8000168c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10; j++) {
    80005550:	00148493          	addi	s1,s1,1
    80005554:	00900793          	li	a5,9
    80005558:	0097ee63          	bltu	a5,s1,80005574 <_ZL11workerBodyAPv+0x4c>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    8000555c:	00000713          	li	a4,0
    80005560:	000077b7          	lui	a5,0x7
    80005564:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005568:	fee7e0e3          	bltu	a5,a4,80005548 <_ZL11workerBodyAPv+0x20>
    8000556c:	00170713          	addi	a4,a4,1
    80005570:	ff1ff06f          	j	80005560 <_ZL11workerBodyAPv+0x38>
    for (uint64 i = 0; i < 10; i++) {
    80005574:	00190913          	addi	s2,s2,1
    80005578:	00900793          	li	a5,9
    8000557c:	0527e063          	bltu	a5,s2,800055bc <_ZL11workerBodyAPv+0x94>
        printString("A: i="); printInt(i); printString("\n");
    80005580:	00003517          	auipc	a0,0x3
    80005584:	b8850513          	addi	a0,a0,-1144 # 80008108 <CONSOLE_STATUS+0xf8>
    80005588:	fffff097          	auipc	ra,0xfffff
    8000558c:	8bc080e7          	jalr	-1860(ra) # 80003e44 <_Z11printStringPKc>
    80005590:	00000613          	li	a2,0
    80005594:	00a00593          	li	a1,10
    80005598:	0009051b          	sext.w	a0,s2
    8000559c:	fffff097          	auipc	ra,0xfffff
    800055a0:	a58080e7          	jalr	-1448(ra) # 80003ff4 <_Z8printIntiii>
    800055a4:	00003517          	auipc	a0,0x3
    800055a8:	de450513          	addi	a0,a0,-540 # 80008388 <CONSOLE_STATUS+0x378>
    800055ac:	fffff097          	auipc	ra,0xfffff
    800055b0:	898080e7          	jalr	-1896(ra) # 80003e44 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10; j++) {
    800055b4:	00000493          	li	s1,0
    800055b8:	f9dff06f          	j	80005554 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    800055bc:	00003517          	auipc	a0,0x3
    800055c0:	b5450513          	addi	a0,a0,-1196 # 80008110 <CONSOLE_STATUS+0x100>
    800055c4:	fffff097          	auipc	ra,0xfffff
    800055c8:	880080e7          	jalr	-1920(ra) # 80003e44 <_Z11printStringPKc>
    finishedA = true;
    800055cc:	00100793          	li	a5,1
    800055d0:	00005717          	auipc	a4,0x5
    800055d4:	02f70623          	sb	a5,44(a4) # 8000a5fc <_ZL9finishedA>
}
    800055d8:	01813083          	ld	ra,24(sp)
    800055dc:	01013403          	ld	s0,16(sp)
    800055e0:	00813483          	ld	s1,8(sp)
    800055e4:	00013903          	ld	s2,0(sp)
    800055e8:	02010113          	addi	sp,sp,32
    800055ec:	00008067          	ret

00000000800055f0 <_Z16System_Mode_testv>:


void System_Mode_test() {
    800055f0:	fd010113          	addi	sp,sp,-48
    800055f4:	02113423          	sd	ra,40(sp)
    800055f8:	02813023          	sd	s0,32(sp)
    800055fc:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80005600:	00000613          	li	a2,0
    80005604:	00000597          	auipc	a1,0x0
    80005608:	f2458593          	addi	a1,a1,-220 # 80005528 <_ZL11workerBodyAPv>
    8000560c:	fd040513          	addi	a0,s0,-48
    80005610:	ffffc097          	auipc	ra,0xffffc
    80005614:	f54080e7          	jalr	-172(ra) # 80001564 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadA created\n");
    80005618:	00003517          	auipc	a0,0x3
    8000561c:	b8850513          	addi	a0,a0,-1144 # 800081a0 <CONSOLE_STATUS+0x190>
    80005620:	fffff097          	auipc	ra,0xfffff
    80005624:	824080e7          	jalr	-2012(ra) # 80003e44 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80005628:	00000613          	li	a2,0
    8000562c:	00000597          	auipc	a1,0x0
    80005630:	e1c58593          	addi	a1,a1,-484 # 80005448 <_ZL11workerBodyBPv>
    80005634:	fd840513          	addi	a0,s0,-40
    80005638:	ffffc097          	auipc	ra,0xffffc
    8000563c:	f2c080e7          	jalr	-212(ra) # 80001564 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadB created\n");
    80005640:	00003517          	auipc	a0,0x3
    80005644:	b7850513          	addi	a0,a0,-1160 # 800081b8 <CONSOLE_STATUS+0x1a8>
    80005648:	ffffe097          	auipc	ra,0xffffe
    8000564c:	7fc080e7          	jalr	2044(ra) # 80003e44 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80005650:	00000613          	li	a2,0
    80005654:	00000597          	auipc	a1,0x0
    80005658:	c7458593          	addi	a1,a1,-908 # 800052c8 <_ZL11workerBodyCPv>
    8000565c:	fe040513          	addi	a0,s0,-32
    80005660:	ffffc097          	auipc	ra,0xffffc
    80005664:	f04080e7          	jalr	-252(ra) # 80001564 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadC created\n");
    80005668:	00003517          	auipc	a0,0x3
    8000566c:	b6850513          	addi	a0,a0,-1176 # 800081d0 <CONSOLE_STATUS+0x1c0>
    80005670:	ffffe097          	auipc	ra,0xffffe
    80005674:	7d4080e7          	jalr	2004(ra) # 80003e44 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80005678:	00000613          	li	a2,0
    8000567c:	00000597          	auipc	a1,0x0
    80005680:	b0458593          	addi	a1,a1,-1276 # 80005180 <_ZL11workerBodyDPv>
    80005684:	fe840513          	addi	a0,s0,-24
    80005688:	ffffc097          	auipc	ra,0xffffc
    8000568c:	edc080e7          	jalr	-292(ra) # 80001564 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadD created\n");
    80005690:	00003517          	auipc	a0,0x3
    80005694:	b5850513          	addi	a0,a0,-1192 # 800081e8 <CONSOLE_STATUS+0x1d8>
    80005698:	ffffe097          	auipc	ra,0xffffe
    8000569c:	7ac080e7          	jalr	1964(ra) # 80003e44 <_Z11printStringPKc>
    800056a0:	00c0006f          	j	800056ac <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    800056a4:	ffffc097          	auipc	ra,0xffffc
    800056a8:	fe8080e7          	jalr	-24(ra) # 8000168c <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800056ac:	00005797          	auipc	a5,0x5
    800056b0:	f507c783          	lbu	a5,-176(a5) # 8000a5fc <_ZL9finishedA>
    800056b4:	fe0788e3          	beqz	a5,800056a4 <_Z16System_Mode_testv+0xb4>
    800056b8:	00005797          	auipc	a5,0x5
    800056bc:	f437c783          	lbu	a5,-189(a5) # 8000a5fb <_ZL9finishedB>
    800056c0:	fe0782e3          	beqz	a5,800056a4 <_Z16System_Mode_testv+0xb4>
    800056c4:	00005797          	auipc	a5,0x5
    800056c8:	f367c783          	lbu	a5,-202(a5) # 8000a5fa <_ZL9finishedC>
    800056cc:	fc078ce3          	beqz	a5,800056a4 <_Z16System_Mode_testv+0xb4>
    800056d0:	00005797          	auipc	a5,0x5
    800056d4:	f297c783          	lbu	a5,-215(a5) # 8000a5f9 <_ZL9finishedD>
    800056d8:	fc0786e3          	beqz	a5,800056a4 <_Z16System_Mode_testv+0xb4>
    }

}
    800056dc:	02813083          	ld	ra,40(sp)
    800056e0:	02013403          	ld	s0,32(sp)
    800056e4:	03010113          	addi	sp,sp,48
    800056e8:	00008067          	ret

00000000800056ec <_ZN15MemoryAllocator8mem_initEv>:

MemDesc* MemoryAllocator::free_head;
MemDesc* MemoryAllocator::allocated_head;
int MemoryAllocator::counter = 0;

void MemoryAllocator::mem_init() {
    800056ec:	ff010113          	addi	sp,sp,-16
    800056f0:	00813423          	sd	s0,8(sp)
    800056f4:	01010413          	addi	s0,sp,16
    free_head = (MemDesc*) HEAP_START_ADDR;
    800056f8:	00005697          	auipc	a3,0x5
    800056fc:	e406b683          	ld	a3,-448(a3) # 8000a538 <_GLOBAL_OFFSET_TABLE_+0x8>
    80005700:	0006b703          	ld	a4,0(a3)
    80005704:	00005797          	auipc	a5,0x5
    80005708:	efc78793          	addi	a5,a5,-260 # 8000a600 <_ZN15MemoryAllocator9free_headE>
    8000570c:	00e7b023          	sd	a4,0(a5)
    free_head->prev = nullptr;
    80005710:	00073023          	sd	zero,0(a4)
    free_head->next = nullptr;
    80005714:	0007b703          	ld	a4,0(a5)
    80005718:	00073423          	sd	zero,8(a4)
    size_t sz = ((char*) HEAP_END_ADDR - (char*) HEAP_START_ADDR - 1);
    8000571c:	00005797          	auipc	a5,0x5
    80005720:	e3c7b783          	ld	a5,-452(a5) # 8000a558 <_GLOBAL_OFFSET_TABLE_+0x28>
    80005724:	0007b783          	ld	a5,0(a5)
    80005728:	0006b683          	ld	a3,0(a3)
    8000572c:	40d787b3          	sub	a5,a5,a3
    80005730:	fff78793          	addi	a5,a5,-1
//    if (sz % MEM_BLOCK_SIZE != 0) sz = (sz / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE; // align to MEM_BLOCK_SIZE (not needed)
    free_head->size = sz;
    80005734:	00f73823          	sd	a5,16(a4)
}
    80005738:	00813403          	ld	s0,8(sp)
    8000573c:	01010113          	addi	sp,sp,16
    80005740:	00008067          	ret

0000000080005744 <_ZN15MemoryAllocator9mem_allocEm>:

// Preuzeto sa kolokvijuma april 2014. zadatak 2.
void *MemoryAllocator::mem_alloc(size_t sz) {
    80005744:	ff010113          	addi	sp,sp,-16
    80005748:	00813423          	sd	s0,8(sp)
    8000574c:	01010413          	addi	s0,sp,16
    80005750:	00050793          	mv	a5,a0
    if (!free_head) return nullptr;
    80005754:	00005517          	auipc	a0,0x5
    80005758:	eac53503          	ld	a0,-340(a0) # 8000a600 <_ZN15MemoryAllocator9free_headE>
    8000575c:	12050c63          	beqz	a0,80005894 <_ZN15MemoryAllocator9mem_allocEm+0x150>

    sz += sizeof(MemDesc);
    80005760:	01878793          	addi	a5,a5,24
    // align to MEM_BLOCK_SIZE
    if (sz % MEM_BLOCK_SIZE != 0) sz = ((sz / MEM_BLOCK_SIZE) + 1) * MEM_BLOCK_SIZE;
    80005764:	03f7f713          	andi	a4,a5,63
    80005768:	00070863          	beqz	a4,80005778 <_ZN15MemoryAllocator9mem_allocEm+0x34>
    8000576c:	0067d793          	srli	a5,a5,0x6
    80005770:	00178793          	addi	a5,a5,1
    80005774:	00679793          	slli	a5,a5,0x6

    // remove from free_head list
    MemDesc* cur = free_head;
    for(; cur != 0; cur = cur->next){
    80005778:	08050863          	beqz	a0,80005808 <_ZN15MemoryAllocator9mem_allocEm+0xc4>
        if (cur->size < sz) continue;
    8000577c:	01053703          	ld	a4,16(a0)
    80005780:	02f76a63          	bltu	a4,a5,800057b4 <_ZN15MemoryAllocator9mem_allocEm+0x70>
        if (cur->size - sz <= sizeof(MemDesc)) {
    80005784:	40f70733          	sub	a4,a4,a5
    80005788:	01800693          	li	a3,24
    8000578c:	04e6e063          	bltu	a3,a4,800057cc <_ZN15MemoryAllocator9mem_allocEm+0x88>
            if (cur->prev) cur->prev->next = cur->next;
    80005790:	00053783          	ld	a5,0(a0)
    80005794:	02078463          	beqz	a5,800057bc <_ZN15MemoryAllocator9mem_allocEm+0x78>
    80005798:	00853703          	ld	a4,8(a0)
    8000579c:	00e7b423          	sd	a4,8(a5)
            else free_head = cur->next;
            if (cur->next) cur->next->prev = cur->prev;
    800057a0:	00853783          	ld	a5,8(a0)
    800057a4:	06078263          	beqz	a5,80005808 <_ZN15MemoryAllocator9mem_allocEm+0xc4>
    800057a8:	00053703          	ld	a4,0(a0)
    800057ac:	00e7b023          	sd	a4,0(a5)
    800057b0:	0580006f          	j	80005808 <_ZN15MemoryAllocator9mem_allocEm+0xc4>
    for(; cur != 0; cur = cur->next){
    800057b4:	00853503          	ld	a0,8(a0)
    800057b8:	fc1ff06f          	j	80005778 <_ZN15MemoryAllocator9mem_allocEm+0x34>
            else free_head = cur->next;
    800057bc:	00853783          	ld	a5,8(a0)
    800057c0:	00005717          	auipc	a4,0x5
    800057c4:	e4f73023          	sd	a5,-448(a4) # 8000a600 <_ZN15MemoryAllocator9free_headE>
    800057c8:	fd9ff06f          	j	800057a0 <_ZN15MemoryAllocator9mem_allocEm+0x5c>
            break;
        }
        else {
            MemDesc* newNode = (MemDesc*) ((char*)cur + sz);
    800057cc:	00f50733          	add	a4,a0,a5
            if (cur->prev) cur->prev->next = newNode;
    800057d0:	00053683          	ld	a3,0(a0)
    800057d4:	06068e63          	beqz	a3,80005850 <_ZN15MemoryAllocator9mem_allocEm+0x10c>
    800057d8:	00e6b423          	sd	a4,8(a3)
            else free_head = newNode;
            if (cur->next) cur->next->prev = newNode;
    800057dc:	00853683          	ld	a3,8(a0)
    800057e0:	00068463          	beqz	a3,800057e8 <_ZN15MemoryAllocator9mem_allocEm+0xa4>
    800057e4:	00e6b023          	sd	a4,0(a3)
            newNode->prev = cur->prev;
    800057e8:	00053683          	ld	a3,0(a0)
    800057ec:	00d73023          	sd	a3,0(a4)
            newNode->next = cur->next;
    800057f0:	00853683          	ld	a3,8(a0)
    800057f4:	00d73423          	sd	a3,8(a4)
            newNode->size = cur->size - sz;
    800057f8:	01053683          	ld	a3,16(a0)
    800057fc:	40f686b3          	sub	a3,a3,a5
    80005800:	00d73823          	sd	a3,16(a4)

            cur->size = sz;
    80005804:	00f53823          	sd	a5,16(a0)
        }
    }

    // insert in allocated_head list
    MemDesc* node = cur;
    if (!node) return nullptr;
    80005808:	08050663          	beqz	a0,80005894 <_ZN15MemoryAllocator9mem_allocEm+0x150>
    if (!allocated_head || ((char*)node < (char*)allocated_head))
    8000580c:	00005797          	auipc	a5,0x5
    80005810:	dfc7b783          	ld	a5,-516(a5) # 8000a608 <_ZN15MemoryAllocator14allocated_headE>
    80005814:	08078663          	beqz	a5,800058a0 <_ZN15MemoryAllocator9mem_allocEm+0x15c>
    80005818:	04f56263          	bltu	a0,a5,8000585c <_ZN15MemoryAllocator9mem_allocEm+0x118>
        cur = nullptr; // insert as the first
    else {
        for(cur = allocated_head; cur->next != nullptr && (char*)node > (char*)(cur->next);
    8000581c:	00078713          	mv	a4,a5
    80005820:	0087b783          	ld	a5,8(a5)
    80005824:	00078463          	beqz	a5,8000582c <_ZN15MemoryAllocator9mem_allocEm+0xe8>
    80005828:	fea7eae3          	bltu	a5,a0,8000581c <_ZN15MemoryAllocator9mem_allocEm+0xd8>
        cur = cur->next);
    }

    // insert after current
    node->prev = cur;
    8000582c:	00e53023          	sd	a4,0(a0)
    if (cur != nullptr) {
    80005830:	02070863          	beqz	a4,80005860 <_ZN15MemoryAllocator9mem_allocEm+0x11c>
        node->next = cur->next;
    80005834:	00873783          	ld	a5,8(a4)
    80005838:	00f53423          	sd	a5,8(a0)
        if (cur->next != nullptr) {
    8000583c:	00873783          	ld	a5,8(a4)
    80005840:	00078463          	beqz	a5,80005848 <_ZN15MemoryAllocator9mem_allocEm+0x104>
            cur->next->prev = node;
    80005844:	00a7b023          	sd	a0,0(a5)
        }
        cur->next = node;
    80005848:	00a73423          	sd	a0,8(a4)
    8000584c:	0300006f          	j	8000587c <_ZN15MemoryAllocator9mem_allocEm+0x138>
            else free_head = newNode;
    80005850:	00005697          	auipc	a3,0x5
    80005854:	dae6b823          	sd	a4,-592(a3) # 8000a600 <_ZN15MemoryAllocator9free_headE>
    80005858:	f85ff06f          	j	800057dc <_ZN15MemoryAllocator9mem_allocEm+0x98>
    node->prev = cur;
    8000585c:	00053023          	sd	zero,0(a0)
    } else {
        node->next = allocated_head;
    80005860:	00005797          	auipc	a5,0x5
    80005864:	da87b783          	ld	a5,-600(a5) # 8000a608 <_ZN15MemoryAllocator14allocated_headE>
    80005868:	00f53423          	sd	a5,8(a0)
        if (allocated_head != nullptr) {
    8000586c:	00078463          	beqz	a5,80005874 <_ZN15MemoryAllocator9mem_allocEm+0x130>
            allocated_head->prev = node;
    80005870:	00a7b023          	sd	a0,0(a5)
        }
        allocated_head = node;
    80005874:	00005797          	auipc	a5,0x5
    80005878:	d8a7ba23          	sd	a0,-620(a5) # 8000a608 <_ZN15MemoryAllocator14allocated_headE>
//    if (cur) node->next = cur->next;
//    else node->next = allocated_head;
//    if (node->next) node->next->prev = node;
//    if (cur) cur->next = node;
//    else allocated_head = node;
    counter++;
    8000587c:	00005717          	auipc	a4,0x5
    80005880:	d8470713          	addi	a4,a4,-636 # 8000a600 <_ZN15MemoryAllocator9free_headE>
    80005884:	01072783          	lw	a5,16(a4)
    80005888:	0017879b          	addiw	a5,a5,1
    8000588c:	00f72823          	sw	a5,16(a4)
    return (void*) ((char*) node + sizeof(MemDesc));
    80005890:	01850513          	addi	a0,a0,24
}
    80005894:	00813403          	ld	s0,8(sp)
    80005898:	01010113          	addi	sp,sp,16
    8000589c:	00008067          	ret
    node->prev = cur;
    800058a0:	00053023          	sd	zero,0(a0)
    if (cur != nullptr) {
    800058a4:	fbdff06f          	j	80005860 <_ZN15MemoryAllocator9mem_allocEm+0x11c>

00000000800058a8 <_ZN15MemoryAllocator8mem_freeEPv>:

// Preuzeto sa kolokvijuma septembar 2015. zadatak 2.
int MemoryAllocator::mem_free(void *ptr) {
    if (!ptr || !allocated_head) return -1;
    800058a8:	14050263          	beqz	a0,800059ec <_ZN15MemoryAllocator8mem_freeEPv+0x144>
    800058ac:	00050713          	mv	a4,a0
    800058b0:	00005697          	auipc	a3,0x5
    800058b4:	d586b683          	ld	a3,-680(a3) # 8000a608 <_ZN15MemoryAllocator14allocated_headE>
    800058b8:	12068e63          	beqz	a3,800059f4 <_ZN15MemoryAllocator8mem_freeEPv+0x14c>
    ptr = (char*) ptr - sizeof(MemDesc);
    800058bc:	fe850513          	addi	a0,a0,-24
    MemDesc* cur;

    // find ptr in allocated memory and remove it
    for(cur = allocated_head; cur != (MemDesc*) ptr && cur != nullptr; cur=cur->next);
    800058c0:	00068793          	mv	a5,a3
    800058c4:	00a78863          	beq	a5,a0,800058d4 <_ZN15MemoryAllocator8mem_freeEPv+0x2c>
    800058c8:	00078663          	beqz	a5,800058d4 <_ZN15MemoryAllocator8mem_freeEPv+0x2c>
    800058cc:	0087b783          	ld	a5,8(a5)
    800058d0:	ff5ff06f          	j	800058c4 <_ZN15MemoryAllocator8mem_freeEPv+0x1c>

    if (cur) {
    800058d4:	12078463          	beqz	a5,800059fc <_ZN15MemoryAllocator8mem_freeEPv+0x154>
int MemoryAllocator::mem_free(void *ptr) {
    800058d8:	fe010113          	addi	sp,sp,-32
    800058dc:	00113c23          	sd	ra,24(sp)
    800058e0:	00813823          	sd	s0,16(sp)
    800058e4:	00913423          	sd	s1,8(sp)
    800058e8:	02010413          	addi	s0,sp,32
        // ptr found, delete ptr from list
        if (cur == allocated_head) {
    800058ec:	04f68a63          	beq	a3,a5,80005940 <_ZN15MemoryAllocator8mem_freeEPv+0x98>
            if (cur->next) cur->next->prev = nullptr;
            cur = cur->next;
            allocated_head = cur;
        }
        else if (!cur->next) {
    800058f0:	0087b683          	ld	a3,8(a5)
    800058f4:	06068463          	beqz	a3,8000595c <_ZN15MemoryAllocator8mem_freeEPv+0xb4>
            cur->prev->next = nullptr;
        }
        else {
            cur->next->prev = cur->prev;
    800058f8:	0007b603          	ld	a2,0(a5)
    800058fc:	00c6b023          	sd	a2,0(a3)
            cur->prev->next = cur->next;
    80005900:	0087b783          	ld	a5,8(a5)
    80005904:	00f63423          	sd	a5,8(a2)
        // ptr not found
        return -1;
    }

    // insert node in free memory
    if (!free_head || ((char*)ptr < (char*)free_head))
    80005908:	00005497          	auipc	s1,0x5
    8000590c:	cf84b483          	ld	s1,-776(s1) # 8000a600 <_ZN15MemoryAllocator9free_headE>
    80005910:	0c048063          	beqz	s1,800059d0 <_ZN15MemoryAllocator8mem_freeEPv+0x128>
    80005914:	04956a63          	bltu	a0,s1,80005968 <_ZN15MemoryAllocator8mem_freeEPv+0xc0>
        cur = nullptr; // insert as the first
    else {
        for(cur = free_head; cur->next != nullptr && (char*)ptr > (char*)(cur->next);
    80005918:	00048793          	mv	a5,s1
    8000591c:	0084b483          	ld	s1,8(s1)
    80005920:	00048463          	beqz	s1,80005928 <_ZN15MemoryAllocator8mem_freeEPv+0x80>
    80005924:	fea4eae3          	bltu	s1,a0,80005918 <_ZN15MemoryAllocator8mem_freeEPv+0x70>
        cur = cur->next);
    }

    // insert after current
    MemDesc* newNode = (MemDesc*) ptr;
    newNode->prev = cur;
    80005928:	fef73423          	sd	a5,-24(a4)
    if (cur) newNode->next = cur->next;
    8000592c:	0a078663          	beqz	a5,800059d8 <_ZN15MemoryAllocator8mem_freeEPv+0x130>
    80005930:	0087b683          	ld	a3,8(a5)
    80005934:	fed73823          	sd	a3,-16(a4)
    80005938:	00078493          	mv	s1,a5
    8000593c:	0400006f          	j	8000597c <_ZN15MemoryAllocator8mem_freeEPv+0xd4>
            if (cur->next) cur->next->prev = nullptr;
    80005940:	0087b683          	ld	a3,8(a5)
    80005944:	00068463          	beqz	a3,8000594c <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
    80005948:	0006b023          	sd	zero,0(a3)
            cur = cur->next;
    8000594c:	0087b783          	ld	a5,8(a5)
            allocated_head = cur;
    80005950:	00005697          	auipc	a3,0x5
    80005954:	caf6bc23          	sd	a5,-840(a3) # 8000a608 <_ZN15MemoryAllocator14allocated_headE>
    80005958:	fb1ff06f          	j	80005908 <_ZN15MemoryAllocator8mem_freeEPv+0x60>
            cur->prev->next = nullptr;
    8000595c:	0007b783          	ld	a5,0(a5)
    80005960:	0007b423          	sd	zero,8(a5)
    80005964:	fa5ff06f          	j	80005908 <_ZN15MemoryAllocator8mem_freeEPv+0x60>
    newNode->prev = cur;
    80005968:	fe073423          	sd	zero,-24(a4)
        cur = nullptr; // insert as the first
    8000596c:	00000493          	li	s1,0
    else newNode->next = free_head;
    80005970:	00005797          	auipc	a5,0x5
    80005974:	c907b783          	ld	a5,-880(a5) # 8000a600 <_ZN15MemoryAllocator9free_headE>
    80005978:	fef73823          	sd	a5,-16(a4)
    if (newNode->next) newNode->next->prev = newNode;
    8000597c:	ff073783          	ld	a5,-16(a4)
    80005980:	00078463          	beqz	a5,80005988 <_ZN15MemoryAllocator8mem_freeEPv+0xe0>
    80005984:	00a7b023          	sd	a0,0(a5)
    if (cur) cur->next = newNode;
    80005988:	04048c63          	beqz	s1,800059e0 <_ZN15MemoryAllocator8mem_freeEPv+0x138>
    8000598c:	00a4b423          	sd	a0,8(s1)
    else free_head = newNode;


    // try to merge two segments
    tryToJoin(newNode);
    80005990:	fffff097          	auipc	ra,0xfffff
    80005994:	f10080e7          	jalr	-240(ra) # 800048a0 <_Z9tryToJoinP7MemDesc>
    tryToJoin(cur);
    80005998:	00048513          	mv	a0,s1
    8000599c:	fffff097          	auipc	ra,0xfffff
    800059a0:	f04080e7          	jalr	-252(ra) # 800048a0 <_Z9tryToJoinP7MemDesc>
    counter--;
    800059a4:	00005717          	auipc	a4,0x5
    800059a8:	c5c70713          	addi	a4,a4,-932 # 8000a600 <_ZN15MemoryAllocator9free_headE>
    800059ac:	01072783          	lw	a5,16(a4)
    800059b0:	fff7879b          	addiw	a5,a5,-1
    800059b4:	00f72823          	sw	a5,16(a4)
    return 0;
    800059b8:	00000513          	li	a0,0
    800059bc:	01813083          	ld	ra,24(sp)
    800059c0:	01013403          	ld	s0,16(sp)
    800059c4:	00813483          	ld	s1,8(sp)
    800059c8:	02010113          	addi	sp,sp,32
    800059cc:	00008067          	ret
    newNode->prev = cur;
    800059d0:	fe073423          	sd	zero,-24(a4)
    if (cur) newNode->next = cur->next;
    800059d4:	f9dff06f          	j	80005970 <_ZN15MemoryAllocator8mem_freeEPv+0xc8>
    800059d8:	00078493          	mv	s1,a5
    800059dc:	f95ff06f          	j	80005970 <_ZN15MemoryAllocator8mem_freeEPv+0xc8>
    else free_head = newNode;
    800059e0:	00005797          	auipc	a5,0x5
    800059e4:	c2a7b023          	sd	a0,-992(a5) # 8000a600 <_ZN15MemoryAllocator9free_headE>
    800059e8:	fa9ff06f          	j	80005990 <_ZN15MemoryAllocator8mem_freeEPv+0xe8>
    if (!ptr || !allocated_head) return -1;
    800059ec:	fff00513          	li	a0,-1
    800059f0:	00008067          	ret
    800059f4:	fff00513          	li	a0,-1
    800059f8:	00008067          	ret
        return -1;
    800059fc:	fff00513          	li	a0,-1
    80005a00:	00008067          	ret

0000000080005a04 <_ZN6BufferC1Ei>:
#include "../h/buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80005a04:	fe010113          	addi	sp,sp,-32
    80005a08:	00113c23          	sd	ra,24(sp)
    80005a0c:	00813823          	sd	s0,16(sp)
    80005a10:	00913423          	sd	s1,8(sp)
    80005a14:	01213023          	sd	s2,0(sp)
    80005a18:	02010413          	addi	s0,sp,32
    80005a1c:	00050493          	mv	s1,a0
    80005a20:	00058913          	mv	s2,a1
    80005a24:	0015879b          	addiw	a5,a1,1
    80005a28:	0007851b          	sext.w	a0,a5
    80005a2c:	00f4a023          	sw	a5,0(s1)
    80005a30:	0004a823          	sw	zero,16(s1)
    80005a34:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80005a38:	00251513          	slli	a0,a0,0x2
    80005a3c:	ffffc097          	auipc	ra,0xffffc
    80005a40:	a90080e7          	jalr	-1392(ra) # 800014cc <_Z9mem_allocm>
    80005a44:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80005a48:	00000593          	li	a1,0
    80005a4c:	02048513          	addi	a0,s1,32
    80005a50:	ffffc097          	auipc	ra,0xffffc
    80005a54:	ca0080e7          	jalr	-864(ra) # 800016f0 <_Z8sem_openPP4_semj>
    sem_open(&spaceAvailable, _cap);
    80005a58:	00090593          	mv	a1,s2
    80005a5c:	01848513          	addi	a0,s1,24
    80005a60:	ffffc097          	auipc	ra,0xffffc
    80005a64:	c90080e7          	jalr	-880(ra) # 800016f0 <_Z8sem_openPP4_semj>
    sem_open(&mutexHead, 1);
    80005a68:	00100593          	li	a1,1
    80005a6c:	02848513          	addi	a0,s1,40
    80005a70:	ffffc097          	auipc	ra,0xffffc
    80005a74:	c80080e7          	jalr	-896(ra) # 800016f0 <_Z8sem_openPP4_semj>
    sem_open(&mutexTail, 1);
    80005a78:	00100593          	li	a1,1
    80005a7c:	03048513          	addi	a0,s1,48
    80005a80:	ffffc097          	auipc	ra,0xffffc
    80005a84:	c70080e7          	jalr	-912(ra) # 800016f0 <_Z8sem_openPP4_semj>
}
    80005a88:	01813083          	ld	ra,24(sp)
    80005a8c:	01013403          	ld	s0,16(sp)
    80005a90:	00813483          	ld	s1,8(sp)
    80005a94:	00013903          	ld	s2,0(sp)
    80005a98:	02010113          	addi	sp,sp,32
    80005a9c:	00008067          	ret

0000000080005aa0 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80005aa0:	fe010113          	addi	sp,sp,-32
    80005aa4:	00113c23          	sd	ra,24(sp)
    80005aa8:	00813823          	sd	s0,16(sp)
    80005aac:	00913423          	sd	s1,8(sp)
    80005ab0:	01213023          	sd	s2,0(sp)
    80005ab4:	02010413          	addi	s0,sp,32
    80005ab8:	00050493          	mv	s1,a0
    80005abc:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80005ac0:	01853503          	ld	a0,24(a0)
    80005ac4:	ffffc097          	auipc	ra,0xffffc
    80005ac8:	cb8080e7          	jalr	-840(ra) # 8000177c <_Z8sem_waitP4_sem>

    sem_wait(mutexTail);
    80005acc:	0304b503          	ld	a0,48(s1)
    80005ad0:	ffffc097          	auipc	ra,0xffffc
    80005ad4:	cac080e7          	jalr	-852(ra) # 8000177c <_Z8sem_waitP4_sem>
    buffer[tail] = val;
    80005ad8:	0084b783          	ld	a5,8(s1)
    80005adc:	0144a703          	lw	a4,20(s1)
    80005ae0:	00271713          	slli	a4,a4,0x2
    80005ae4:	00e787b3          	add	a5,a5,a4
    80005ae8:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80005aec:	0144a783          	lw	a5,20(s1)
    80005af0:	0017879b          	addiw	a5,a5,1
    80005af4:	0004a703          	lw	a4,0(s1)
    80005af8:	02e7e7bb          	remw	a5,a5,a4
    80005afc:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80005b00:	0304b503          	ld	a0,48(s1)
    80005b04:	ffffc097          	auipc	ra,0xffffc
    80005b08:	cbc080e7          	jalr	-836(ra) # 800017c0 <_Z10sem_signalP4_sem>

    sem_signal(itemAvailable);
    80005b0c:	0204b503          	ld	a0,32(s1)
    80005b10:	ffffc097          	auipc	ra,0xffffc
    80005b14:	cb0080e7          	jalr	-848(ra) # 800017c0 <_Z10sem_signalP4_sem>

}
    80005b18:	01813083          	ld	ra,24(sp)
    80005b1c:	01013403          	ld	s0,16(sp)
    80005b20:	00813483          	ld	s1,8(sp)
    80005b24:	00013903          	ld	s2,0(sp)
    80005b28:	02010113          	addi	sp,sp,32
    80005b2c:	00008067          	ret

0000000080005b30 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80005b30:	fe010113          	addi	sp,sp,-32
    80005b34:	00113c23          	sd	ra,24(sp)
    80005b38:	00813823          	sd	s0,16(sp)
    80005b3c:	00913423          	sd	s1,8(sp)
    80005b40:	01213023          	sd	s2,0(sp)
    80005b44:	02010413          	addi	s0,sp,32
    80005b48:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80005b4c:	02053503          	ld	a0,32(a0)
    80005b50:	ffffc097          	auipc	ra,0xffffc
    80005b54:	c2c080e7          	jalr	-980(ra) # 8000177c <_Z8sem_waitP4_sem>

    sem_wait(mutexHead);
    80005b58:	0284b503          	ld	a0,40(s1)
    80005b5c:	ffffc097          	auipc	ra,0xffffc
    80005b60:	c20080e7          	jalr	-992(ra) # 8000177c <_Z8sem_waitP4_sem>

    int ret = buffer[head];
    80005b64:	0084b703          	ld	a4,8(s1)
    80005b68:	0104a783          	lw	a5,16(s1)
    80005b6c:	00279693          	slli	a3,a5,0x2
    80005b70:	00d70733          	add	a4,a4,a3
    80005b74:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80005b78:	0017879b          	addiw	a5,a5,1
    80005b7c:	0004a703          	lw	a4,0(s1)
    80005b80:	02e7e7bb          	remw	a5,a5,a4
    80005b84:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80005b88:	0284b503          	ld	a0,40(s1)
    80005b8c:	ffffc097          	auipc	ra,0xffffc
    80005b90:	c34080e7          	jalr	-972(ra) # 800017c0 <_Z10sem_signalP4_sem>

    sem_signal(spaceAvailable);
    80005b94:	0184b503          	ld	a0,24(s1)
    80005b98:	ffffc097          	auipc	ra,0xffffc
    80005b9c:	c28080e7          	jalr	-984(ra) # 800017c0 <_Z10sem_signalP4_sem>

    return ret;
}
    80005ba0:	00090513          	mv	a0,s2
    80005ba4:	01813083          	ld	ra,24(sp)
    80005ba8:	01013403          	ld	s0,16(sp)
    80005bac:	00813483          	ld	s1,8(sp)
    80005bb0:	00013903          	ld	s2,0(sp)
    80005bb4:	02010113          	addi	sp,sp,32
    80005bb8:	00008067          	ret

0000000080005bbc <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80005bbc:	fe010113          	addi	sp,sp,-32
    80005bc0:	00113c23          	sd	ra,24(sp)
    80005bc4:	00813823          	sd	s0,16(sp)
    80005bc8:	00913423          	sd	s1,8(sp)
    80005bcc:	01213023          	sd	s2,0(sp)
    80005bd0:	02010413          	addi	s0,sp,32
    80005bd4:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80005bd8:	02853503          	ld	a0,40(a0)
    80005bdc:	ffffc097          	auipc	ra,0xffffc
    80005be0:	ba0080e7          	jalr	-1120(ra) # 8000177c <_Z8sem_waitP4_sem>
    sem_wait(mutexTail);
    80005be4:	0304b503          	ld	a0,48(s1)
    80005be8:	ffffc097          	auipc	ra,0xffffc
    80005bec:	b94080e7          	jalr	-1132(ra) # 8000177c <_Z8sem_waitP4_sem>

    if (tail >= head) {
    80005bf0:	0144a783          	lw	a5,20(s1)
    80005bf4:	0104a903          	lw	s2,16(s1)
    80005bf8:	0327ce63          	blt	a5,s2,80005c34 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80005bfc:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80005c00:	0304b503          	ld	a0,48(s1)
    80005c04:	ffffc097          	auipc	ra,0xffffc
    80005c08:	bbc080e7          	jalr	-1092(ra) # 800017c0 <_Z10sem_signalP4_sem>
    sem_signal(mutexHead);
    80005c0c:	0284b503          	ld	a0,40(s1)
    80005c10:	ffffc097          	auipc	ra,0xffffc
    80005c14:	bb0080e7          	jalr	-1104(ra) # 800017c0 <_Z10sem_signalP4_sem>

    return ret;
}
    80005c18:	00090513          	mv	a0,s2
    80005c1c:	01813083          	ld	ra,24(sp)
    80005c20:	01013403          	ld	s0,16(sp)
    80005c24:	00813483          	ld	s1,8(sp)
    80005c28:	00013903          	ld	s2,0(sp)
    80005c2c:	02010113          	addi	sp,sp,32
    80005c30:	00008067          	ret
        ret = cap - head + tail;
    80005c34:	0004a703          	lw	a4,0(s1)
    80005c38:	4127093b          	subw	s2,a4,s2
    80005c3c:	00f9093b          	addw	s2,s2,a5
    80005c40:	fc1ff06f          	j	80005c00 <_ZN6Buffer6getCntEv+0x44>

0000000080005c44 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80005c44:	fe010113          	addi	sp,sp,-32
    80005c48:	00113c23          	sd	ra,24(sp)
    80005c4c:	00813823          	sd	s0,16(sp)
    80005c50:	00913423          	sd	s1,8(sp)
    80005c54:	02010413          	addi	s0,sp,32
    80005c58:	00050493          	mv	s1,a0
    putc('\n');
    80005c5c:	00a00513          	li	a0,10
    80005c60:	ffffc097          	auipc	ra,0xffffc
    80005c64:	bd8080e7          	jalr	-1064(ra) # 80001838 <_Z4putcc>
    printString("Buffer deleted!\n");
    80005c68:	00002517          	auipc	a0,0x2
    80005c6c:	59850513          	addi	a0,a0,1432 # 80008200 <CONSOLE_STATUS+0x1f0>
    80005c70:	ffffe097          	auipc	ra,0xffffe
    80005c74:	1d4080e7          	jalr	468(ra) # 80003e44 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80005c78:	00048513          	mv	a0,s1
    80005c7c:	00000097          	auipc	ra,0x0
    80005c80:	f40080e7          	jalr	-192(ra) # 80005bbc <_ZN6Buffer6getCntEv>
    80005c84:	02a05c63          	blez	a0,80005cbc <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80005c88:	0084b783          	ld	a5,8(s1)
    80005c8c:	0104a703          	lw	a4,16(s1)
    80005c90:	00271713          	slli	a4,a4,0x2
    80005c94:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80005c98:	0007c503          	lbu	a0,0(a5)
    80005c9c:	ffffc097          	auipc	ra,0xffffc
    80005ca0:	b9c080e7          	jalr	-1124(ra) # 80001838 <_Z4putcc>
        head = (head + 1) % cap;
    80005ca4:	0104a783          	lw	a5,16(s1)
    80005ca8:	0017879b          	addiw	a5,a5,1
    80005cac:	0004a703          	lw	a4,0(s1)
    80005cb0:	02e7e7bb          	remw	a5,a5,a4
    80005cb4:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80005cb8:	fc1ff06f          	j	80005c78 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80005cbc:	02100513          	li	a0,33
    80005cc0:	ffffc097          	auipc	ra,0xffffc
    80005cc4:	b78080e7          	jalr	-1160(ra) # 80001838 <_Z4putcc>
    putc('\n');
    80005cc8:	00a00513          	li	a0,10
    80005ccc:	ffffc097          	auipc	ra,0xffffc
    80005cd0:	b6c080e7          	jalr	-1172(ra) # 80001838 <_Z4putcc>
    mem_free(buffer);
    80005cd4:	0084b503          	ld	a0,8(s1)
    80005cd8:	ffffc097          	auipc	ra,0xffffc
    80005cdc:	848080e7          	jalr	-1976(ra) # 80001520 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80005ce0:	0204b503          	ld	a0,32(s1)
    80005ce4:	ffffc097          	auipc	ra,0xffffc
    80005ce8:	a54080e7          	jalr	-1452(ra) # 80001738 <_Z9sem_closeP4_sem>
    sem_close(spaceAvailable);
    80005cec:	0184b503          	ld	a0,24(s1)
    80005cf0:	ffffc097          	auipc	ra,0xffffc
    80005cf4:	a48080e7          	jalr	-1464(ra) # 80001738 <_Z9sem_closeP4_sem>
    sem_close(mutexTail);
    80005cf8:	0304b503          	ld	a0,48(s1)
    80005cfc:	ffffc097          	auipc	ra,0xffffc
    80005d00:	a3c080e7          	jalr	-1476(ra) # 80001738 <_Z9sem_closeP4_sem>
    sem_close(mutexHead);
    80005d04:	0284b503          	ld	a0,40(s1)
    80005d08:	ffffc097          	auipc	ra,0xffffc
    80005d0c:	a30080e7          	jalr	-1488(ra) # 80001738 <_Z9sem_closeP4_sem>
}
    80005d10:	01813083          	ld	ra,24(sp)
    80005d14:	01013403          	ld	s0,16(sp)
    80005d18:	00813483          	ld	s1,8(sp)
    80005d1c:	02010113          	addi	sp,sp,32
    80005d20:	00008067          	ret

0000000080005d24 <start>:
    80005d24:	ff010113          	addi	sp,sp,-16
    80005d28:	00813423          	sd	s0,8(sp)
    80005d2c:	01010413          	addi	s0,sp,16
    80005d30:	300027f3          	csrr	a5,mstatus
    80005d34:	ffffe737          	lui	a4,0xffffe
    80005d38:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff2f7f>
    80005d3c:	00e7f7b3          	and	a5,a5,a4
    80005d40:	00001737          	lui	a4,0x1
    80005d44:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80005d48:	00e7e7b3          	or	a5,a5,a4
    80005d4c:	30079073          	csrw	mstatus,a5
    80005d50:	00000797          	auipc	a5,0x0
    80005d54:	16078793          	addi	a5,a5,352 # 80005eb0 <system_main>
    80005d58:	34179073          	csrw	mepc,a5
    80005d5c:	00000793          	li	a5,0
    80005d60:	18079073          	csrw	satp,a5
    80005d64:	000107b7          	lui	a5,0x10
    80005d68:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80005d6c:	30279073          	csrw	medeleg,a5
    80005d70:	30379073          	csrw	mideleg,a5
    80005d74:	104027f3          	csrr	a5,sie
    80005d78:	2227e793          	ori	a5,a5,546
    80005d7c:	10479073          	csrw	sie,a5
    80005d80:	fff00793          	li	a5,-1
    80005d84:	00a7d793          	srli	a5,a5,0xa
    80005d88:	3b079073          	csrw	pmpaddr0,a5
    80005d8c:	00f00793          	li	a5,15
    80005d90:	3a079073          	csrw	pmpcfg0,a5
    80005d94:	f14027f3          	csrr	a5,mhartid
    80005d98:	0200c737          	lui	a4,0x200c
    80005d9c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80005da0:	0007869b          	sext.w	a3,a5
    80005da4:	00269713          	slli	a4,a3,0x2
    80005da8:	000f4637          	lui	a2,0xf4
    80005dac:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80005db0:	00d70733          	add	a4,a4,a3
    80005db4:	0037979b          	slliw	a5,a5,0x3
    80005db8:	020046b7          	lui	a3,0x2004
    80005dbc:	00d787b3          	add	a5,a5,a3
    80005dc0:	00c585b3          	add	a1,a1,a2
    80005dc4:	00371693          	slli	a3,a4,0x3
    80005dc8:	00005717          	auipc	a4,0x5
    80005dcc:	85870713          	addi	a4,a4,-1960 # 8000a620 <timer_scratch>
    80005dd0:	00b7b023          	sd	a1,0(a5)
    80005dd4:	00d70733          	add	a4,a4,a3
    80005dd8:	00f73c23          	sd	a5,24(a4)
    80005ddc:	02c73023          	sd	a2,32(a4)
    80005de0:	34071073          	csrw	mscratch,a4
    80005de4:	00000797          	auipc	a5,0x0
    80005de8:	6ec78793          	addi	a5,a5,1772 # 800064d0 <timervec>
    80005dec:	30579073          	csrw	mtvec,a5
    80005df0:	300027f3          	csrr	a5,mstatus
    80005df4:	0087e793          	ori	a5,a5,8
    80005df8:	30079073          	csrw	mstatus,a5
    80005dfc:	304027f3          	csrr	a5,mie
    80005e00:	0807e793          	ori	a5,a5,128
    80005e04:	30479073          	csrw	mie,a5
    80005e08:	f14027f3          	csrr	a5,mhartid
    80005e0c:	0007879b          	sext.w	a5,a5
    80005e10:	00078213          	mv	tp,a5
    80005e14:	30200073          	mret
    80005e18:	00813403          	ld	s0,8(sp)
    80005e1c:	01010113          	addi	sp,sp,16
    80005e20:	00008067          	ret

0000000080005e24 <timerinit>:
    80005e24:	ff010113          	addi	sp,sp,-16
    80005e28:	00813423          	sd	s0,8(sp)
    80005e2c:	01010413          	addi	s0,sp,16
    80005e30:	f14027f3          	csrr	a5,mhartid
    80005e34:	0200c737          	lui	a4,0x200c
    80005e38:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80005e3c:	0007869b          	sext.w	a3,a5
    80005e40:	00269713          	slli	a4,a3,0x2
    80005e44:	000f4637          	lui	a2,0xf4
    80005e48:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80005e4c:	00d70733          	add	a4,a4,a3
    80005e50:	0037979b          	slliw	a5,a5,0x3
    80005e54:	020046b7          	lui	a3,0x2004
    80005e58:	00d787b3          	add	a5,a5,a3
    80005e5c:	00c585b3          	add	a1,a1,a2
    80005e60:	00371693          	slli	a3,a4,0x3
    80005e64:	00004717          	auipc	a4,0x4
    80005e68:	7bc70713          	addi	a4,a4,1980 # 8000a620 <timer_scratch>
    80005e6c:	00b7b023          	sd	a1,0(a5)
    80005e70:	00d70733          	add	a4,a4,a3
    80005e74:	00f73c23          	sd	a5,24(a4)
    80005e78:	02c73023          	sd	a2,32(a4)
    80005e7c:	34071073          	csrw	mscratch,a4
    80005e80:	00000797          	auipc	a5,0x0
    80005e84:	65078793          	addi	a5,a5,1616 # 800064d0 <timervec>
    80005e88:	30579073          	csrw	mtvec,a5
    80005e8c:	300027f3          	csrr	a5,mstatus
    80005e90:	0087e793          	ori	a5,a5,8
    80005e94:	30079073          	csrw	mstatus,a5
    80005e98:	304027f3          	csrr	a5,mie
    80005e9c:	0807e793          	ori	a5,a5,128
    80005ea0:	30479073          	csrw	mie,a5
    80005ea4:	00813403          	ld	s0,8(sp)
    80005ea8:	01010113          	addi	sp,sp,16
    80005eac:	00008067          	ret

0000000080005eb0 <system_main>:
    80005eb0:	fe010113          	addi	sp,sp,-32
    80005eb4:	00813823          	sd	s0,16(sp)
    80005eb8:	00913423          	sd	s1,8(sp)
    80005ebc:	00113c23          	sd	ra,24(sp)
    80005ec0:	02010413          	addi	s0,sp,32
    80005ec4:	00000097          	auipc	ra,0x0
    80005ec8:	0c4080e7          	jalr	196(ra) # 80005f88 <cpuid>
    80005ecc:	00004497          	auipc	s1,0x4
    80005ed0:	6b448493          	addi	s1,s1,1716 # 8000a580 <started>
    80005ed4:	02050263          	beqz	a0,80005ef8 <system_main+0x48>
    80005ed8:	0004a783          	lw	a5,0(s1)
    80005edc:	0007879b          	sext.w	a5,a5
    80005ee0:	fe078ce3          	beqz	a5,80005ed8 <system_main+0x28>
    80005ee4:	0ff0000f          	fence
    80005ee8:	00002517          	auipc	a0,0x2
    80005eec:	71850513          	addi	a0,a0,1816 # 80008600 <CONSOLE_STATUS+0x5f0>
    80005ef0:	00001097          	auipc	ra,0x1
    80005ef4:	a7c080e7          	jalr	-1412(ra) # 8000696c <panic>
    80005ef8:	00001097          	auipc	ra,0x1
    80005efc:	9d0080e7          	jalr	-1584(ra) # 800068c8 <consoleinit>
    80005f00:	00001097          	auipc	ra,0x1
    80005f04:	15c080e7          	jalr	348(ra) # 8000705c <printfinit>
    80005f08:	00002517          	auipc	a0,0x2
    80005f0c:	48050513          	addi	a0,a0,1152 # 80008388 <CONSOLE_STATUS+0x378>
    80005f10:	00001097          	auipc	ra,0x1
    80005f14:	ab8080e7          	jalr	-1352(ra) # 800069c8 <__printf>
    80005f18:	00002517          	auipc	a0,0x2
    80005f1c:	6b850513          	addi	a0,a0,1720 # 800085d0 <CONSOLE_STATUS+0x5c0>
    80005f20:	00001097          	auipc	ra,0x1
    80005f24:	aa8080e7          	jalr	-1368(ra) # 800069c8 <__printf>
    80005f28:	00002517          	auipc	a0,0x2
    80005f2c:	46050513          	addi	a0,a0,1120 # 80008388 <CONSOLE_STATUS+0x378>
    80005f30:	00001097          	auipc	ra,0x1
    80005f34:	a98080e7          	jalr	-1384(ra) # 800069c8 <__printf>
    80005f38:	00001097          	auipc	ra,0x1
    80005f3c:	4b0080e7          	jalr	1200(ra) # 800073e8 <kinit>
    80005f40:	00000097          	auipc	ra,0x0
    80005f44:	148080e7          	jalr	328(ra) # 80006088 <trapinit>
    80005f48:	00000097          	auipc	ra,0x0
    80005f4c:	16c080e7          	jalr	364(ra) # 800060b4 <trapinithart>
    80005f50:	00000097          	auipc	ra,0x0
    80005f54:	5c0080e7          	jalr	1472(ra) # 80006510 <plicinit>
    80005f58:	00000097          	auipc	ra,0x0
    80005f5c:	5e0080e7          	jalr	1504(ra) # 80006538 <plicinithart>
    80005f60:	00000097          	auipc	ra,0x0
    80005f64:	078080e7          	jalr	120(ra) # 80005fd8 <userinit>
    80005f68:	0ff0000f          	fence
    80005f6c:	00100793          	li	a5,1
    80005f70:	00002517          	auipc	a0,0x2
    80005f74:	67850513          	addi	a0,a0,1656 # 800085e8 <CONSOLE_STATUS+0x5d8>
    80005f78:	00f4a023          	sw	a5,0(s1)
    80005f7c:	00001097          	auipc	ra,0x1
    80005f80:	a4c080e7          	jalr	-1460(ra) # 800069c8 <__printf>
    80005f84:	0000006f          	j	80005f84 <system_main+0xd4>

0000000080005f88 <cpuid>:
    80005f88:	ff010113          	addi	sp,sp,-16
    80005f8c:	00813423          	sd	s0,8(sp)
    80005f90:	01010413          	addi	s0,sp,16
    80005f94:	00020513          	mv	a0,tp
    80005f98:	00813403          	ld	s0,8(sp)
    80005f9c:	0005051b          	sext.w	a0,a0
    80005fa0:	01010113          	addi	sp,sp,16
    80005fa4:	00008067          	ret

0000000080005fa8 <mycpu>:
    80005fa8:	ff010113          	addi	sp,sp,-16
    80005fac:	00813423          	sd	s0,8(sp)
    80005fb0:	01010413          	addi	s0,sp,16
    80005fb4:	00020793          	mv	a5,tp
    80005fb8:	00813403          	ld	s0,8(sp)
    80005fbc:	0007879b          	sext.w	a5,a5
    80005fc0:	00779793          	slli	a5,a5,0x7
    80005fc4:	00005517          	auipc	a0,0x5
    80005fc8:	68c50513          	addi	a0,a0,1676 # 8000b650 <cpus>
    80005fcc:	00f50533          	add	a0,a0,a5
    80005fd0:	01010113          	addi	sp,sp,16
    80005fd4:	00008067          	ret

0000000080005fd8 <userinit>:
    80005fd8:	ff010113          	addi	sp,sp,-16
    80005fdc:	00813423          	sd	s0,8(sp)
    80005fe0:	01010413          	addi	s0,sp,16
    80005fe4:	00813403          	ld	s0,8(sp)
    80005fe8:	01010113          	addi	sp,sp,16
    80005fec:	ffffe317          	auipc	t1,0xffffe
    80005ff0:	7cc30067          	jr	1996(t1) # 800047b8 <main>

0000000080005ff4 <either_copyout>:
    80005ff4:	ff010113          	addi	sp,sp,-16
    80005ff8:	00813023          	sd	s0,0(sp)
    80005ffc:	00113423          	sd	ra,8(sp)
    80006000:	01010413          	addi	s0,sp,16
    80006004:	02051663          	bnez	a0,80006030 <either_copyout+0x3c>
    80006008:	00058513          	mv	a0,a1
    8000600c:	00060593          	mv	a1,a2
    80006010:	0006861b          	sext.w	a2,a3
    80006014:	00002097          	auipc	ra,0x2
    80006018:	c60080e7          	jalr	-928(ra) # 80007c74 <__memmove>
    8000601c:	00813083          	ld	ra,8(sp)
    80006020:	00013403          	ld	s0,0(sp)
    80006024:	00000513          	li	a0,0
    80006028:	01010113          	addi	sp,sp,16
    8000602c:	00008067          	ret
    80006030:	00002517          	auipc	a0,0x2
    80006034:	5f850513          	addi	a0,a0,1528 # 80008628 <CONSOLE_STATUS+0x618>
    80006038:	00001097          	auipc	ra,0x1
    8000603c:	934080e7          	jalr	-1740(ra) # 8000696c <panic>

0000000080006040 <either_copyin>:
    80006040:	ff010113          	addi	sp,sp,-16
    80006044:	00813023          	sd	s0,0(sp)
    80006048:	00113423          	sd	ra,8(sp)
    8000604c:	01010413          	addi	s0,sp,16
    80006050:	02059463          	bnez	a1,80006078 <either_copyin+0x38>
    80006054:	00060593          	mv	a1,a2
    80006058:	0006861b          	sext.w	a2,a3
    8000605c:	00002097          	auipc	ra,0x2
    80006060:	c18080e7          	jalr	-1000(ra) # 80007c74 <__memmove>
    80006064:	00813083          	ld	ra,8(sp)
    80006068:	00013403          	ld	s0,0(sp)
    8000606c:	00000513          	li	a0,0
    80006070:	01010113          	addi	sp,sp,16
    80006074:	00008067          	ret
    80006078:	00002517          	auipc	a0,0x2
    8000607c:	5d850513          	addi	a0,a0,1496 # 80008650 <CONSOLE_STATUS+0x640>
    80006080:	00001097          	auipc	ra,0x1
    80006084:	8ec080e7          	jalr	-1812(ra) # 8000696c <panic>

0000000080006088 <trapinit>:
    80006088:	ff010113          	addi	sp,sp,-16
    8000608c:	00813423          	sd	s0,8(sp)
    80006090:	01010413          	addi	s0,sp,16
    80006094:	00813403          	ld	s0,8(sp)
    80006098:	00002597          	auipc	a1,0x2
    8000609c:	5e058593          	addi	a1,a1,1504 # 80008678 <CONSOLE_STATUS+0x668>
    800060a0:	00005517          	auipc	a0,0x5
    800060a4:	63050513          	addi	a0,a0,1584 # 8000b6d0 <tickslock>
    800060a8:	01010113          	addi	sp,sp,16
    800060ac:	00001317          	auipc	t1,0x1
    800060b0:	5cc30067          	jr	1484(t1) # 80007678 <initlock>

00000000800060b4 <trapinithart>:
    800060b4:	ff010113          	addi	sp,sp,-16
    800060b8:	00813423          	sd	s0,8(sp)
    800060bc:	01010413          	addi	s0,sp,16
    800060c0:	00000797          	auipc	a5,0x0
    800060c4:	30078793          	addi	a5,a5,768 # 800063c0 <kernelvec>
    800060c8:	10579073          	csrw	stvec,a5
    800060cc:	00813403          	ld	s0,8(sp)
    800060d0:	01010113          	addi	sp,sp,16
    800060d4:	00008067          	ret

00000000800060d8 <usertrap>:
    800060d8:	ff010113          	addi	sp,sp,-16
    800060dc:	00813423          	sd	s0,8(sp)
    800060e0:	01010413          	addi	s0,sp,16
    800060e4:	00813403          	ld	s0,8(sp)
    800060e8:	01010113          	addi	sp,sp,16
    800060ec:	00008067          	ret

00000000800060f0 <usertrapret>:
    800060f0:	ff010113          	addi	sp,sp,-16
    800060f4:	00813423          	sd	s0,8(sp)
    800060f8:	01010413          	addi	s0,sp,16
    800060fc:	00813403          	ld	s0,8(sp)
    80006100:	01010113          	addi	sp,sp,16
    80006104:	00008067          	ret

0000000080006108 <kerneltrap>:
    80006108:	fe010113          	addi	sp,sp,-32
    8000610c:	00813823          	sd	s0,16(sp)
    80006110:	00113c23          	sd	ra,24(sp)
    80006114:	00913423          	sd	s1,8(sp)
    80006118:	02010413          	addi	s0,sp,32
    8000611c:	142025f3          	csrr	a1,scause
    80006120:	100027f3          	csrr	a5,sstatus
    80006124:	0027f793          	andi	a5,a5,2
    80006128:	10079c63          	bnez	a5,80006240 <kerneltrap+0x138>
    8000612c:	142027f3          	csrr	a5,scause
    80006130:	0207ce63          	bltz	a5,8000616c <kerneltrap+0x64>
    80006134:	00002517          	auipc	a0,0x2
    80006138:	58c50513          	addi	a0,a0,1420 # 800086c0 <CONSOLE_STATUS+0x6b0>
    8000613c:	00001097          	auipc	ra,0x1
    80006140:	88c080e7          	jalr	-1908(ra) # 800069c8 <__printf>
    80006144:	141025f3          	csrr	a1,sepc
    80006148:	14302673          	csrr	a2,stval
    8000614c:	00002517          	auipc	a0,0x2
    80006150:	58450513          	addi	a0,a0,1412 # 800086d0 <CONSOLE_STATUS+0x6c0>
    80006154:	00001097          	auipc	ra,0x1
    80006158:	874080e7          	jalr	-1932(ra) # 800069c8 <__printf>
    8000615c:	00002517          	auipc	a0,0x2
    80006160:	58c50513          	addi	a0,a0,1420 # 800086e8 <CONSOLE_STATUS+0x6d8>
    80006164:	00001097          	auipc	ra,0x1
    80006168:	808080e7          	jalr	-2040(ra) # 8000696c <panic>
    8000616c:	0ff7f713          	andi	a4,a5,255
    80006170:	00900693          	li	a3,9
    80006174:	04d70063          	beq	a4,a3,800061b4 <kerneltrap+0xac>
    80006178:	fff00713          	li	a4,-1
    8000617c:	03f71713          	slli	a4,a4,0x3f
    80006180:	00170713          	addi	a4,a4,1
    80006184:	fae798e3          	bne	a5,a4,80006134 <kerneltrap+0x2c>
    80006188:	00000097          	auipc	ra,0x0
    8000618c:	e00080e7          	jalr	-512(ra) # 80005f88 <cpuid>
    80006190:	06050663          	beqz	a0,800061fc <kerneltrap+0xf4>
    80006194:	144027f3          	csrr	a5,sip
    80006198:	ffd7f793          	andi	a5,a5,-3
    8000619c:	14479073          	csrw	sip,a5
    800061a0:	01813083          	ld	ra,24(sp)
    800061a4:	01013403          	ld	s0,16(sp)
    800061a8:	00813483          	ld	s1,8(sp)
    800061ac:	02010113          	addi	sp,sp,32
    800061b0:	00008067          	ret
    800061b4:	00000097          	auipc	ra,0x0
    800061b8:	3d0080e7          	jalr	976(ra) # 80006584 <plic_claim>
    800061bc:	00a00793          	li	a5,10
    800061c0:	00050493          	mv	s1,a0
    800061c4:	06f50863          	beq	a0,a5,80006234 <kerneltrap+0x12c>
    800061c8:	fc050ce3          	beqz	a0,800061a0 <kerneltrap+0x98>
    800061cc:	00050593          	mv	a1,a0
    800061d0:	00002517          	auipc	a0,0x2
    800061d4:	4d050513          	addi	a0,a0,1232 # 800086a0 <CONSOLE_STATUS+0x690>
    800061d8:	00000097          	auipc	ra,0x0
    800061dc:	7f0080e7          	jalr	2032(ra) # 800069c8 <__printf>
    800061e0:	01013403          	ld	s0,16(sp)
    800061e4:	01813083          	ld	ra,24(sp)
    800061e8:	00048513          	mv	a0,s1
    800061ec:	00813483          	ld	s1,8(sp)
    800061f0:	02010113          	addi	sp,sp,32
    800061f4:	00000317          	auipc	t1,0x0
    800061f8:	3c830067          	jr	968(t1) # 800065bc <plic_complete>
    800061fc:	00005517          	auipc	a0,0x5
    80006200:	4d450513          	addi	a0,a0,1236 # 8000b6d0 <tickslock>
    80006204:	00001097          	auipc	ra,0x1
    80006208:	498080e7          	jalr	1176(ra) # 8000769c <acquire>
    8000620c:	00004717          	auipc	a4,0x4
    80006210:	37870713          	addi	a4,a4,888 # 8000a584 <ticks>
    80006214:	00072783          	lw	a5,0(a4)
    80006218:	00005517          	auipc	a0,0x5
    8000621c:	4b850513          	addi	a0,a0,1208 # 8000b6d0 <tickslock>
    80006220:	0017879b          	addiw	a5,a5,1
    80006224:	00f72023          	sw	a5,0(a4)
    80006228:	00001097          	auipc	ra,0x1
    8000622c:	540080e7          	jalr	1344(ra) # 80007768 <release>
    80006230:	f65ff06f          	j	80006194 <kerneltrap+0x8c>
    80006234:	00001097          	auipc	ra,0x1
    80006238:	09c080e7          	jalr	156(ra) # 800072d0 <uartintr>
    8000623c:	fa5ff06f          	j	800061e0 <kerneltrap+0xd8>
    80006240:	00002517          	auipc	a0,0x2
    80006244:	44050513          	addi	a0,a0,1088 # 80008680 <CONSOLE_STATUS+0x670>
    80006248:	00000097          	auipc	ra,0x0
    8000624c:	724080e7          	jalr	1828(ra) # 8000696c <panic>

0000000080006250 <clockintr>:
    80006250:	fe010113          	addi	sp,sp,-32
    80006254:	00813823          	sd	s0,16(sp)
    80006258:	00913423          	sd	s1,8(sp)
    8000625c:	00113c23          	sd	ra,24(sp)
    80006260:	02010413          	addi	s0,sp,32
    80006264:	00005497          	auipc	s1,0x5
    80006268:	46c48493          	addi	s1,s1,1132 # 8000b6d0 <tickslock>
    8000626c:	00048513          	mv	a0,s1
    80006270:	00001097          	auipc	ra,0x1
    80006274:	42c080e7          	jalr	1068(ra) # 8000769c <acquire>
    80006278:	00004717          	auipc	a4,0x4
    8000627c:	30c70713          	addi	a4,a4,780 # 8000a584 <ticks>
    80006280:	00072783          	lw	a5,0(a4)
    80006284:	01013403          	ld	s0,16(sp)
    80006288:	01813083          	ld	ra,24(sp)
    8000628c:	00048513          	mv	a0,s1
    80006290:	0017879b          	addiw	a5,a5,1
    80006294:	00813483          	ld	s1,8(sp)
    80006298:	00f72023          	sw	a5,0(a4)
    8000629c:	02010113          	addi	sp,sp,32
    800062a0:	00001317          	auipc	t1,0x1
    800062a4:	4c830067          	jr	1224(t1) # 80007768 <release>

00000000800062a8 <devintr>:
    800062a8:	142027f3          	csrr	a5,scause
    800062ac:	00000513          	li	a0,0
    800062b0:	0007c463          	bltz	a5,800062b8 <devintr+0x10>
    800062b4:	00008067          	ret
    800062b8:	fe010113          	addi	sp,sp,-32
    800062bc:	00813823          	sd	s0,16(sp)
    800062c0:	00113c23          	sd	ra,24(sp)
    800062c4:	00913423          	sd	s1,8(sp)
    800062c8:	02010413          	addi	s0,sp,32
    800062cc:	0ff7f713          	andi	a4,a5,255
    800062d0:	00900693          	li	a3,9
    800062d4:	04d70c63          	beq	a4,a3,8000632c <devintr+0x84>
    800062d8:	fff00713          	li	a4,-1
    800062dc:	03f71713          	slli	a4,a4,0x3f
    800062e0:	00170713          	addi	a4,a4,1
    800062e4:	00e78c63          	beq	a5,a4,800062fc <devintr+0x54>
    800062e8:	01813083          	ld	ra,24(sp)
    800062ec:	01013403          	ld	s0,16(sp)
    800062f0:	00813483          	ld	s1,8(sp)
    800062f4:	02010113          	addi	sp,sp,32
    800062f8:	00008067          	ret
    800062fc:	00000097          	auipc	ra,0x0
    80006300:	c8c080e7          	jalr	-884(ra) # 80005f88 <cpuid>
    80006304:	06050663          	beqz	a0,80006370 <devintr+0xc8>
    80006308:	144027f3          	csrr	a5,sip
    8000630c:	ffd7f793          	andi	a5,a5,-3
    80006310:	14479073          	csrw	sip,a5
    80006314:	01813083          	ld	ra,24(sp)
    80006318:	01013403          	ld	s0,16(sp)
    8000631c:	00813483          	ld	s1,8(sp)
    80006320:	00200513          	li	a0,2
    80006324:	02010113          	addi	sp,sp,32
    80006328:	00008067          	ret
    8000632c:	00000097          	auipc	ra,0x0
    80006330:	258080e7          	jalr	600(ra) # 80006584 <plic_claim>
    80006334:	00a00793          	li	a5,10
    80006338:	00050493          	mv	s1,a0
    8000633c:	06f50663          	beq	a0,a5,800063a8 <devintr+0x100>
    80006340:	00100513          	li	a0,1
    80006344:	fa0482e3          	beqz	s1,800062e8 <devintr+0x40>
    80006348:	00048593          	mv	a1,s1
    8000634c:	00002517          	auipc	a0,0x2
    80006350:	35450513          	addi	a0,a0,852 # 800086a0 <CONSOLE_STATUS+0x690>
    80006354:	00000097          	auipc	ra,0x0
    80006358:	674080e7          	jalr	1652(ra) # 800069c8 <__printf>
    8000635c:	00048513          	mv	a0,s1
    80006360:	00000097          	auipc	ra,0x0
    80006364:	25c080e7          	jalr	604(ra) # 800065bc <plic_complete>
    80006368:	00100513          	li	a0,1
    8000636c:	f7dff06f          	j	800062e8 <devintr+0x40>
    80006370:	00005517          	auipc	a0,0x5
    80006374:	36050513          	addi	a0,a0,864 # 8000b6d0 <tickslock>
    80006378:	00001097          	auipc	ra,0x1
    8000637c:	324080e7          	jalr	804(ra) # 8000769c <acquire>
    80006380:	00004717          	auipc	a4,0x4
    80006384:	20470713          	addi	a4,a4,516 # 8000a584 <ticks>
    80006388:	00072783          	lw	a5,0(a4)
    8000638c:	00005517          	auipc	a0,0x5
    80006390:	34450513          	addi	a0,a0,836 # 8000b6d0 <tickslock>
    80006394:	0017879b          	addiw	a5,a5,1
    80006398:	00f72023          	sw	a5,0(a4)
    8000639c:	00001097          	auipc	ra,0x1
    800063a0:	3cc080e7          	jalr	972(ra) # 80007768 <release>
    800063a4:	f65ff06f          	j	80006308 <devintr+0x60>
    800063a8:	00001097          	auipc	ra,0x1
    800063ac:	f28080e7          	jalr	-216(ra) # 800072d0 <uartintr>
    800063b0:	fadff06f          	j	8000635c <devintr+0xb4>
	...

00000000800063c0 <kernelvec>:
    800063c0:	f0010113          	addi	sp,sp,-256
    800063c4:	00113023          	sd	ra,0(sp)
    800063c8:	00213423          	sd	sp,8(sp)
    800063cc:	00313823          	sd	gp,16(sp)
    800063d0:	00413c23          	sd	tp,24(sp)
    800063d4:	02513023          	sd	t0,32(sp)
    800063d8:	02613423          	sd	t1,40(sp)
    800063dc:	02713823          	sd	t2,48(sp)
    800063e0:	02813c23          	sd	s0,56(sp)
    800063e4:	04913023          	sd	s1,64(sp)
    800063e8:	04a13423          	sd	a0,72(sp)
    800063ec:	04b13823          	sd	a1,80(sp)
    800063f0:	04c13c23          	sd	a2,88(sp)
    800063f4:	06d13023          	sd	a3,96(sp)
    800063f8:	06e13423          	sd	a4,104(sp)
    800063fc:	06f13823          	sd	a5,112(sp)
    80006400:	07013c23          	sd	a6,120(sp)
    80006404:	09113023          	sd	a7,128(sp)
    80006408:	09213423          	sd	s2,136(sp)
    8000640c:	09313823          	sd	s3,144(sp)
    80006410:	09413c23          	sd	s4,152(sp)
    80006414:	0b513023          	sd	s5,160(sp)
    80006418:	0b613423          	sd	s6,168(sp)
    8000641c:	0b713823          	sd	s7,176(sp)
    80006420:	0b813c23          	sd	s8,184(sp)
    80006424:	0d913023          	sd	s9,192(sp)
    80006428:	0da13423          	sd	s10,200(sp)
    8000642c:	0db13823          	sd	s11,208(sp)
    80006430:	0dc13c23          	sd	t3,216(sp)
    80006434:	0fd13023          	sd	t4,224(sp)
    80006438:	0fe13423          	sd	t5,232(sp)
    8000643c:	0ff13823          	sd	t6,240(sp)
    80006440:	cc9ff0ef          	jal	ra,80006108 <kerneltrap>
    80006444:	00013083          	ld	ra,0(sp)
    80006448:	00813103          	ld	sp,8(sp)
    8000644c:	01013183          	ld	gp,16(sp)
    80006450:	02013283          	ld	t0,32(sp)
    80006454:	02813303          	ld	t1,40(sp)
    80006458:	03013383          	ld	t2,48(sp)
    8000645c:	03813403          	ld	s0,56(sp)
    80006460:	04013483          	ld	s1,64(sp)
    80006464:	04813503          	ld	a0,72(sp)
    80006468:	05013583          	ld	a1,80(sp)
    8000646c:	05813603          	ld	a2,88(sp)
    80006470:	06013683          	ld	a3,96(sp)
    80006474:	06813703          	ld	a4,104(sp)
    80006478:	07013783          	ld	a5,112(sp)
    8000647c:	07813803          	ld	a6,120(sp)
    80006480:	08013883          	ld	a7,128(sp)
    80006484:	08813903          	ld	s2,136(sp)
    80006488:	09013983          	ld	s3,144(sp)
    8000648c:	09813a03          	ld	s4,152(sp)
    80006490:	0a013a83          	ld	s5,160(sp)
    80006494:	0a813b03          	ld	s6,168(sp)
    80006498:	0b013b83          	ld	s7,176(sp)
    8000649c:	0b813c03          	ld	s8,184(sp)
    800064a0:	0c013c83          	ld	s9,192(sp)
    800064a4:	0c813d03          	ld	s10,200(sp)
    800064a8:	0d013d83          	ld	s11,208(sp)
    800064ac:	0d813e03          	ld	t3,216(sp)
    800064b0:	0e013e83          	ld	t4,224(sp)
    800064b4:	0e813f03          	ld	t5,232(sp)
    800064b8:	0f013f83          	ld	t6,240(sp)
    800064bc:	10010113          	addi	sp,sp,256
    800064c0:	10200073          	sret
    800064c4:	00000013          	nop
    800064c8:	00000013          	nop
    800064cc:	00000013          	nop

00000000800064d0 <timervec>:
    800064d0:	34051573          	csrrw	a0,mscratch,a0
    800064d4:	00b53023          	sd	a1,0(a0)
    800064d8:	00c53423          	sd	a2,8(a0)
    800064dc:	00d53823          	sd	a3,16(a0)
    800064e0:	01853583          	ld	a1,24(a0)
    800064e4:	02053603          	ld	a2,32(a0)
    800064e8:	0005b683          	ld	a3,0(a1)
    800064ec:	00c686b3          	add	a3,a3,a2
    800064f0:	00d5b023          	sd	a3,0(a1)
    800064f4:	00200593          	li	a1,2
    800064f8:	14459073          	csrw	sip,a1
    800064fc:	01053683          	ld	a3,16(a0)
    80006500:	00853603          	ld	a2,8(a0)
    80006504:	00053583          	ld	a1,0(a0)
    80006508:	34051573          	csrrw	a0,mscratch,a0
    8000650c:	30200073          	mret

0000000080006510 <plicinit>:
    80006510:	ff010113          	addi	sp,sp,-16
    80006514:	00813423          	sd	s0,8(sp)
    80006518:	01010413          	addi	s0,sp,16
    8000651c:	00813403          	ld	s0,8(sp)
    80006520:	0c0007b7          	lui	a5,0xc000
    80006524:	00100713          	li	a4,1
    80006528:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000652c:	00e7a223          	sw	a4,4(a5)
    80006530:	01010113          	addi	sp,sp,16
    80006534:	00008067          	ret

0000000080006538 <plicinithart>:
    80006538:	ff010113          	addi	sp,sp,-16
    8000653c:	00813023          	sd	s0,0(sp)
    80006540:	00113423          	sd	ra,8(sp)
    80006544:	01010413          	addi	s0,sp,16
    80006548:	00000097          	auipc	ra,0x0
    8000654c:	a40080e7          	jalr	-1472(ra) # 80005f88 <cpuid>
    80006550:	0085171b          	slliw	a4,a0,0x8
    80006554:	0c0027b7          	lui	a5,0xc002
    80006558:	00e787b3          	add	a5,a5,a4
    8000655c:	40200713          	li	a4,1026
    80006560:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80006564:	00813083          	ld	ra,8(sp)
    80006568:	00013403          	ld	s0,0(sp)
    8000656c:	00d5151b          	slliw	a0,a0,0xd
    80006570:	0c2017b7          	lui	a5,0xc201
    80006574:	00a78533          	add	a0,a5,a0
    80006578:	00052023          	sw	zero,0(a0)
    8000657c:	01010113          	addi	sp,sp,16
    80006580:	00008067          	ret

0000000080006584 <plic_claim>:
    80006584:	ff010113          	addi	sp,sp,-16
    80006588:	00813023          	sd	s0,0(sp)
    8000658c:	00113423          	sd	ra,8(sp)
    80006590:	01010413          	addi	s0,sp,16
    80006594:	00000097          	auipc	ra,0x0
    80006598:	9f4080e7          	jalr	-1548(ra) # 80005f88 <cpuid>
    8000659c:	00813083          	ld	ra,8(sp)
    800065a0:	00013403          	ld	s0,0(sp)
    800065a4:	00d5151b          	slliw	a0,a0,0xd
    800065a8:	0c2017b7          	lui	a5,0xc201
    800065ac:	00a78533          	add	a0,a5,a0
    800065b0:	00452503          	lw	a0,4(a0)
    800065b4:	01010113          	addi	sp,sp,16
    800065b8:	00008067          	ret

00000000800065bc <plic_complete>:
    800065bc:	fe010113          	addi	sp,sp,-32
    800065c0:	00813823          	sd	s0,16(sp)
    800065c4:	00913423          	sd	s1,8(sp)
    800065c8:	00113c23          	sd	ra,24(sp)
    800065cc:	02010413          	addi	s0,sp,32
    800065d0:	00050493          	mv	s1,a0
    800065d4:	00000097          	auipc	ra,0x0
    800065d8:	9b4080e7          	jalr	-1612(ra) # 80005f88 <cpuid>
    800065dc:	01813083          	ld	ra,24(sp)
    800065e0:	01013403          	ld	s0,16(sp)
    800065e4:	00d5179b          	slliw	a5,a0,0xd
    800065e8:	0c201737          	lui	a4,0xc201
    800065ec:	00f707b3          	add	a5,a4,a5
    800065f0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800065f4:	00813483          	ld	s1,8(sp)
    800065f8:	02010113          	addi	sp,sp,32
    800065fc:	00008067          	ret

0000000080006600 <consolewrite>:
    80006600:	fb010113          	addi	sp,sp,-80
    80006604:	04813023          	sd	s0,64(sp)
    80006608:	04113423          	sd	ra,72(sp)
    8000660c:	02913c23          	sd	s1,56(sp)
    80006610:	03213823          	sd	s2,48(sp)
    80006614:	03313423          	sd	s3,40(sp)
    80006618:	03413023          	sd	s4,32(sp)
    8000661c:	01513c23          	sd	s5,24(sp)
    80006620:	05010413          	addi	s0,sp,80
    80006624:	06c05c63          	blez	a2,8000669c <consolewrite+0x9c>
    80006628:	00060993          	mv	s3,a2
    8000662c:	00050a13          	mv	s4,a0
    80006630:	00058493          	mv	s1,a1
    80006634:	00000913          	li	s2,0
    80006638:	fff00a93          	li	s5,-1
    8000663c:	01c0006f          	j	80006658 <consolewrite+0x58>
    80006640:	fbf44503          	lbu	a0,-65(s0)
    80006644:	0019091b          	addiw	s2,s2,1
    80006648:	00148493          	addi	s1,s1,1
    8000664c:	00001097          	auipc	ra,0x1
    80006650:	a9c080e7          	jalr	-1380(ra) # 800070e8 <uartputc>
    80006654:	03298063          	beq	s3,s2,80006674 <consolewrite+0x74>
    80006658:	00048613          	mv	a2,s1
    8000665c:	00100693          	li	a3,1
    80006660:	000a0593          	mv	a1,s4
    80006664:	fbf40513          	addi	a0,s0,-65
    80006668:	00000097          	auipc	ra,0x0
    8000666c:	9d8080e7          	jalr	-1576(ra) # 80006040 <either_copyin>
    80006670:	fd5518e3          	bne	a0,s5,80006640 <consolewrite+0x40>
    80006674:	04813083          	ld	ra,72(sp)
    80006678:	04013403          	ld	s0,64(sp)
    8000667c:	03813483          	ld	s1,56(sp)
    80006680:	02813983          	ld	s3,40(sp)
    80006684:	02013a03          	ld	s4,32(sp)
    80006688:	01813a83          	ld	s5,24(sp)
    8000668c:	00090513          	mv	a0,s2
    80006690:	03013903          	ld	s2,48(sp)
    80006694:	05010113          	addi	sp,sp,80
    80006698:	00008067          	ret
    8000669c:	00000913          	li	s2,0
    800066a0:	fd5ff06f          	j	80006674 <consolewrite+0x74>

00000000800066a4 <consoleread>:
    800066a4:	f9010113          	addi	sp,sp,-112
    800066a8:	06813023          	sd	s0,96(sp)
    800066ac:	04913c23          	sd	s1,88(sp)
    800066b0:	05213823          	sd	s2,80(sp)
    800066b4:	05313423          	sd	s3,72(sp)
    800066b8:	05413023          	sd	s4,64(sp)
    800066bc:	03513c23          	sd	s5,56(sp)
    800066c0:	03613823          	sd	s6,48(sp)
    800066c4:	03713423          	sd	s7,40(sp)
    800066c8:	03813023          	sd	s8,32(sp)
    800066cc:	06113423          	sd	ra,104(sp)
    800066d0:	01913c23          	sd	s9,24(sp)
    800066d4:	07010413          	addi	s0,sp,112
    800066d8:	00060b93          	mv	s7,a2
    800066dc:	00050913          	mv	s2,a0
    800066e0:	00058c13          	mv	s8,a1
    800066e4:	00060b1b          	sext.w	s6,a2
    800066e8:	00005497          	auipc	s1,0x5
    800066ec:	01048493          	addi	s1,s1,16 # 8000b6f8 <cons>
    800066f0:	00400993          	li	s3,4
    800066f4:	fff00a13          	li	s4,-1
    800066f8:	00a00a93          	li	s5,10
    800066fc:	05705e63          	blez	s7,80006758 <consoleread+0xb4>
    80006700:	09c4a703          	lw	a4,156(s1)
    80006704:	0984a783          	lw	a5,152(s1)
    80006708:	0007071b          	sext.w	a4,a4
    8000670c:	08e78463          	beq	a5,a4,80006794 <consoleread+0xf0>
    80006710:	07f7f713          	andi	a4,a5,127
    80006714:	00e48733          	add	a4,s1,a4
    80006718:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000671c:	0017869b          	addiw	a3,a5,1
    80006720:	08d4ac23          	sw	a3,152(s1)
    80006724:	00070c9b          	sext.w	s9,a4
    80006728:	0b370663          	beq	a4,s3,800067d4 <consoleread+0x130>
    8000672c:	00100693          	li	a3,1
    80006730:	f9f40613          	addi	a2,s0,-97
    80006734:	000c0593          	mv	a1,s8
    80006738:	00090513          	mv	a0,s2
    8000673c:	f8e40fa3          	sb	a4,-97(s0)
    80006740:	00000097          	auipc	ra,0x0
    80006744:	8b4080e7          	jalr	-1868(ra) # 80005ff4 <either_copyout>
    80006748:	01450863          	beq	a0,s4,80006758 <consoleread+0xb4>
    8000674c:	001c0c13          	addi	s8,s8,1
    80006750:	fffb8b9b          	addiw	s7,s7,-1
    80006754:	fb5c94e3          	bne	s9,s5,800066fc <consoleread+0x58>
    80006758:	000b851b          	sext.w	a0,s7
    8000675c:	06813083          	ld	ra,104(sp)
    80006760:	06013403          	ld	s0,96(sp)
    80006764:	05813483          	ld	s1,88(sp)
    80006768:	05013903          	ld	s2,80(sp)
    8000676c:	04813983          	ld	s3,72(sp)
    80006770:	04013a03          	ld	s4,64(sp)
    80006774:	03813a83          	ld	s5,56(sp)
    80006778:	02813b83          	ld	s7,40(sp)
    8000677c:	02013c03          	ld	s8,32(sp)
    80006780:	01813c83          	ld	s9,24(sp)
    80006784:	40ab053b          	subw	a0,s6,a0
    80006788:	03013b03          	ld	s6,48(sp)
    8000678c:	07010113          	addi	sp,sp,112
    80006790:	00008067          	ret
    80006794:	00001097          	auipc	ra,0x1
    80006798:	1d8080e7          	jalr	472(ra) # 8000796c <push_on>
    8000679c:	0984a703          	lw	a4,152(s1)
    800067a0:	09c4a783          	lw	a5,156(s1)
    800067a4:	0007879b          	sext.w	a5,a5
    800067a8:	fef70ce3          	beq	a4,a5,800067a0 <consoleread+0xfc>
    800067ac:	00001097          	auipc	ra,0x1
    800067b0:	234080e7          	jalr	564(ra) # 800079e0 <pop_on>
    800067b4:	0984a783          	lw	a5,152(s1)
    800067b8:	07f7f713          	andi	a4,a5,127
    800067bc:	00e48733          	add	a4,s1,a4
    800067c0:	01874703          	lbu	a4,24(a4)
    800067c4:	0017869b          	addiw	a3,a5,1
    800067c8:	08d4ac23          	sw	a3,152(s1)
    800067cc:	00070c9b          	sext.w	s9,a4
    800067d0:	f5371ee3          	bne	a4,s3,8000672c <consoleread+0x88>
    800067d4:	000b851b          	sext.w	a0,s7
    800067d8:	f96bf2e3          	bgeu	s7,s6,8000675c <consoleread+0xb8>
    800067dc:	08f4ac23          	sw	a5,152(s1)
    800067e0:	f7dff06f          	j	8000675c <consoleread+0xb8>

00000000800067e4 <consputc>:
    800067e4:	10000793          	li	a5,256
    800067e8:	00f50663          	beq	a0,a5,800067f4 <consputc+0x10>
    800067ec:	00001317          	auipc	t1,0x1
    800067f0:	9f430067          	jr	-1548(t1) # 800071e0 <uartputc_sync>
    800067f4:	ff010113          	addi	sp,sp,-16
    800067f8:	00113423          	sd	ra,8(sp)
    800067fc:	00813023          	sd	s0,0(sp)
    80006800:	01010413          	addi	s0,sp,16
    80006804:	00800513          	li	a0,8
    80006808:	00001097          	auipc	ra,0x1
    8000680c:	9d8080e7          	jalr	-1576(ra) # 800071e0 <uartputc_sync>
    80006810:	02000513          	li	a0,32
    80006814:	00001097          	auipc	ra,0x1
    80006818:	9cc080e7          	jalr	-1588(ra) # 800071e0 <uartputc_sync>
    8000681c:	00013403          	ld	s0,0(sp)
    80006820:	00813083          	ld	ra,8(sp)
    80006824:	00800513          	li	a0,8
    80006828:	01010113          	addi	sp,sp,16
    8000682c:	00001317          	auipc	t1,0x1
    80006830:	9b430067          	jr	-1612(t1) # 800071e0 <uartputc_sync>

0000000080006834 <consoleintr>:
    80006834:	fe010113          	addi	sp,sp,-32
    80006838:	00813823          	sd	s0,16(sp)
    8000683c:	00913423          	sd	s1,8(sp)
    80006840:	01213023          	sd	s2,0(sp)
    80006844:	00113c23          	sd	ra,24(sp)
    80006848:	02010413          	addi	s0,sp,32
    8000684c:	00005917          	auipc	s2,0x5
    80006850:	eac90913          	addi	s2,s2,-340 # 8000b6f8 <cons>
    80006854:	00050493          	mv	s1,a0
    80006858:	00090513          	mv	a0,s2
    8000685c:	00001097          	auipc	ra,0x1
    80006860:	e40080e7          	jalr	-448(ra) # 8000769c <acquire>
    80006864:	02048c63          	beqz	s1,8000689c <consoleintr+0x68>
    80006868:	0a092783          	lw	a5,160(s2)
    8000686c:	09892703          	lw	a4,152(s2)
    80006870:	07f00693          	li	a3,127
    80006874:	40e7873b          	subw	a4,a5,a4
    80006878:	02e6e263          	bltu	a3,a4,8000689c <consoleintr+0x68>
    8000687c:	00d00713          	li	a4,13
    80006880:	04e48063          	beq	s1,a4,800068c0 <consoleintr+0x8c>
    80006884:	07f7f713          	andi	a4,a5,127
    80006888:	00e90733          	add	a4,s2,a4
    8000688c:	0017879b          	addiw	a5,a5,1
    80006890:	0af92023          	sw	a5,160(s2)
    80006894:	00970c23          	sb	s1,24(a4)
    80006898:	08f92e23          	sw	a5,156(s2)
    8000689c:	01013403          	ld	s0,16(sp)
    800068a0:	01813083          	ld	ra,24(sp)
    800068a4:	00813483          	ld	s1,8(sp)
    800068a8:	00013903          	ld	s2,0(sp)
    800068ac:	00005517          	auipc	a0,0x5
    800068b0:	e4c50513          	addi	a0,a0,-436 # 8000b6f8 <cons>
    800068b4:	02010113          	addi	sp,sp,32
    800068b8:	00001317          	auipc	t1,0x1
    800068bc:	eb030067          	jr	-336(t1) # 80007768 <release>
    800068c0:	00a00493          	li	s1,10
    800068c4:	fc1ff06f          	j	80006884 <consoleintr+0x50>

00000000800068c8 <consoleinit>:
    800068c8:	fe010113          	addi	sp,sp,-32
    800068cc:	00113c23          	sd	ra,24(sp)
    800068d0:	00813823          	sd	s0,16(sp)
    800068d4:	00913423          	sd	s1,8(sp)
    800068d8:	02010413          	addi	s0,sp,32
    800068dc:	00005497          	auipc	s1,0x5
    800068e0:	e1c48493          	addi	s1,s1,-484 # 8000b6f8 <cons>
    800068e4:	00048513          	mv	a0,s1
    800068e8:	00002597          	auipc	a1,0x2
    800068ec:	e1058593          	addi	a1,a1,-496 # 800086f8 <CONSOLE_STATUS+0x6e8>
    800068f0:	00001097          	auipc	ra,0x1
    800068f4:	d88080e7          	jalr	-632(ra) # 80007678 <initlock>
    800068f8:	00000097          	auipc	ra,0x0
    800068fc:	7ac080e7          	jalr	1964(ra) # 800070a4 <uartinit>
    80006900:	01813083          	ld	ra,24(sp)
    80006904:	01013403          	ld	s0,16(sp)
    80006908:	00000797          	auipc	a5,0x0
    8000690c:	d9c78793          	addi	a5,a5,-612 # 800066a4 <consoleread>
    80006910:	0af4bc23          	sd	a5,184(s1)
    80006914:	00000797          	auipc	a5,0x0
    80006918:	cec78793          	addi	a5,a5,-788 # 80006600 <consolewrite>
    8000691c:	0cf4b023          	sd	a5,192(s1)
    80006920:	00813483          	ld	s1,8(sp)
    80006924:	02010113          	addi	sp,sp,32
    80006928:	00008067          	ret

000000008000692c <console_read>:
    8000692c:	ff010113          	addi	sp,sp,-16
    80006930:	00813423          	sd	s0,8(sp)
    80006934:	01010413          	addi	s0,sp,16
    80006938:	00813403          	ld	s0,8(sp)
    8000693c:	00005317          	auipc	t1,0x5
    80006940:	e7433303          	ld	t1,-396(t1) # 8000b7b0 <devsw+0x10>
    80006944:	01010113          	addi	sp,sp,16
    80006948:	00030067          	jr	t1

000000008000694c <console_write>:
    8000694c:	ff010113          	addi	sp,sp,-16
    80006950:	00813423          	sd	s0,8(sp)
    80006954:	01010413          	addi	s0,sp,16
    80006958:	00813403          	ld	s0,8(sp)
    8000695c:	00005317          	auipc	t1,0x5
    80006960:	e5c33303          	ld	t1,-420(t1) # 8000b7b8 <devsw+0x18>
    80006964:	01010113          	addi	sp,sp,16
    80006968:	00030067          	jr	t1

000000008000696c <panic>:
    8000696c:	fe010113          	addi	sp,sp,-32
    80006970:	00113c23          	sd	ra,24(sp)
    80006974:	00813823          	sd	s0,16(sp)
    80006978:	00913423          	sd	s1,8(sp)
    8000697c:	02010413          	addi	s0,sp,32
    80006980:	00050493          	mv	s1,a0
    80006984:	00002517          	auipc	a0,0x2
    80006988:	d7c50513          	addi	a0,a0,-644 # 80008700 <CONSOLE_STATUS+0x6f0>
    8000698c:	00005797          	auipc	a5,0x5
    80006990:	ec07a623          	sw	zero,-308(a5) # 8000b858 <pr+0x18>
    80006994:	00000097          	auipc	ra,0x0
    80006998:	034080e7          	jalr	52(ra) # 800069c8 <__printf>
    8000699c:	00048513          	mv	a0,s1
    800069a0:	00000097          	auipc	ra,0x0
    800069a4:	028080e7          	jalr	40(ra) # 800069c8 <__printf>
    800069a8:	00002517          	auipc	a0,0x2
    800069ac:	9e050513          	addi	a0,a0,-1568 # 80008388 <CONSOLE_STATUS+0x378>
    800069b0:	00000097          	auipc	ra,0x0
    800069b4:	018080e7          	jalr	24(ra) # 800069c8 <__printf>
    800069b8:	00100793          	li	a5,1
    800069bc:	00004717          	auipc	a4,0x4
    800069c0:	bcf72623          	sw	a5,-1076(a4) # 8000a588 <panicked>
    800069c4:	0000006f          	j	800069c4 <panic+0x58>

00000000800069c8 <__printf>:
    800069c8:	f3010113          	addi	sp,sp,-208
    800069cc:	08813023          	sd	s0,128(sp)
    800069d0:	07313423          	sd	s3,104(sp)
    800069d4:	09010413          	addi	s0,sp,144
    800069d8:	05813023          	sd	s8,64(sp)
    800069dc:	08113423          	sd	ra,136(sp)
    800069e0:	06913c23          	sd	s1,120(sp)
    800069e4:	07213823          	sd	s2,112(sp)
    800069e8:	07413023          	sd	s4,96(sp)
    800069ec:	05513c23          	sd	s5,88(sp)
    800069f0:	05613823          	sd	s6,80(sp)
    800069f4:	05713423          	sd	s7,72(sp)
    800069f8:	03913c23          	sd	s9,56(sp)
    800069fc:	03a13823          	sd	s10,48(sp)
    80006a00:	03b13423          	sd	s11,40(sp)
    80006a04:	00005317          	auipc	t1,0x5
    80006a08:	e3c30313          	addi	t1,t1,-452 # 8000b840 <pr>
    80006a0c:	01832c03          	lw	s8,24(t1)
    80006a10:	00b43423          	sd	a1,8(s0)
    80006a14:	00c43823          	sd	a2,16(s0)
    80006a18:	00d43c23          	sd	a3,24(s0)
    80006a1c:	02e43023          	sd	a4,32(s0)
    80006a20:	02f43423          	sd	a5,40(s0)
    80006a24:	03043823          	sd	a6,48(s0)
    80006a28:	03143c23          	sd	a7,56(s0)
    80006a2c:	00050993          	mv	s3,a0
    80006a30:	4a0c1663          	bnez	s8,80006edc <__printf+0x514>
    80006a34:	60098c63          	beqz	s3,8000704c <__printf+0x684>
    80006a38:	0009c503          	lbu	a0,0(s3)
    80006a3c:	00840793          	addi	a5,s0,8
    80006a40:	f6f43c23          	sd	a5,-136(s0)
    80006a44:	00000493          	li	s1,0
    80006a48:	22050063          	beqz	a0,80006c68 <__printf+0x2a0>
    80006a4c:	00002a37          	lui	s4,0x2
    80006a50:	00018ab7          	lui	s5,0x18
    80006a54:	000f4b37          	lui	s6,0xf4
    80006a58:	00989bb7          	lui	s7,0x989
    80006a5c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80006a60:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80006a64:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80006a68:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80006a6c:	00148c9b          	addiw	s9,s1,1
    80006a70:	02500793          	li	a5,37
    80006a74:	01998933          	add	s2,s3,s9
    80006a78:	38f51263          	bne	a0,a5,80006dfc <__printf+0x434>
    80006a7c:	00094783          	lbu	a5,0(s2)
    80006a80:	00078c9b          	sext.w	s9,a5
    80006a84:	1e078263          	beqz	a5,80006c68 <__printf+0x2a0>
    80006a88:	0024849b          	addiw	s1,s1,2
    80006a8c:	07000713          	li	a4,112
    80006a90:	00998933          	add	s2,s3,s1
    80006a94:	38e78a63          	beq	a5,a4,80006e28 <__printf+0x460>
    80006a98:	20f76863          	bltu	a4,a5,80006ca8 <__printf+0x2e0>
    80006a9c:	42a78863          	beq	a5,a0,80006ecc <__printf+0x504>
    80006aa0:	06400713          	li	a4,100
    80006aa4:	40e79663          	bne	a5,a4,80006eb0 <__printf+0x4e8>
    80006aa8:	f7843783          	ld	a5,-136(s0)
    80006aac:	0007a603          	lw	a2,0(a5)
    80006ab0:	00878793          	addi	a5,a5,8
    80006ab4:	f6f43c23          	sd	a5,-136(s0)
    80006ab8:	42064a63          	bltz	a2,80006eec <__printf+0x524>
    80006abc:	00a00713          	li	a4,10
    80006ac0:	02e677bb          	remuw	a5,a2,a4
    80006ac4:	00002d97          	auipc	s11,0x2
    80006ac8:	c64d8d93          	addi	s11,s11,-924 # 80008728 <digits>
    80006acc:	00900593          	li	a1,9
    80006ad0:	0006051b          	sext.w	a0,a2
    80006ad4:	00000c93          	li	s9,0
    80006ad8:	02079793          	slli	a5,a5,0x20
    80006adc:	0207d793          	srli	a5,a5,0x20
    80006ae0:	00fd87b3          	add	a5,s11,a5
    80006ae4:	0007c783          	lbu	a5,0(a5)
    80006ae8:	02e656bb          	divuw	a3,a2,a4
    80006aec:	f8f40023          	sb	a5,-128(s0)
    80006af0:	14c5d863          	bge	a1,a2,80006c40 <__printf+0x278>
    80006af4:	06300593          	li	a1,99
    80006af8:	00100c93          	li	s9,1
    80006afc:	02e6f7bb          	remuw	a5,a3,a4
    80006b00:	02079793          	slli	a5,a5,0x20
    80006b04:	0207d793          	srli	a5,a5,0x20
    80006b08:	00fd87b3          	add	a5,s11,a5
    80006b0c:	0007c783          	lbu	a5,0(a5)
    80006b10:	02e6d73b          	divuw	a4,a3,a4
    80006b14:	f8f400a3          	sb	a5,-127(s0)
    80006b18:	12a5f463          	bgeu	a1,a0,80006c40 <__printf+0x278>
    80006b1c:	00a00693          	li	a3,10
    80006b20:	00900593          	li	a1,9
    80006b24:	02d777bb          	remuw	a5,a4,a3
    80006b28:	02079793          	slli	a5,a5,0x20
    80006b2c:	0207d793          	srli	a5,a5,0x20
    80006b30:	00fd87b3          	add	a5,s11,a5
    80006b34:	0007c503          	lbu	a0,0(a5)
    80006b38:	02d757bb          	divuw	a5,a4,a3
    80006b3c:	f8a40123          	sb	a0,-126(s0)
    80006b40:	48e5f263          	bgeu	a1,a4,80006fc4 <__printf+0x5fc>
    80006b44:	06300513          	li	a0,99
    80006b48:	02d7f5bb          	remuw	a1,a5,a3
    80006b4c:	02059593          	slli	a1,a1,0x20
    80006b50:	0205d593          	srli	a1,a1,0x20
    80006b54:	00bd85b3          	add	a1,s11,a1
    80006b58:	0005c583          	lbu	a1,0(a1)
    80006b5c:	02d7d7bb          	divuw	a5,a5,a3
    80006b60:	f8b401a3          	sb	a1,-125(s0)
    80006b64:	48e57263          	bgeu	a0,a4,80006fe8 <__printf+0x620>
    80006b68:	3e700513          	li	a0,999
    80006b6c:	02d7f5bb          	remuw	a1,a5,a3
    80006b70:	02059593          	slli	a1,a1,0x20
    80006b74:	0205d593          	srli	a1,a1,0x20
    80006b78:	00bd85b3          	add	a1,s11,a1
    80006b7c:	0005c583          	lbu	a1,0(a1)
    80006b80:	02d7d7bb          	divuw	a5,a5,a3
    80006b84:	f8b40223          	sb	a1,-124(s0)
    80006b88:	46e57663          	bgeu	a0,a4,80006ff4 <__printf+0x62c>
    80006b8c:	02d7f5bb          	remuw	a1,a5,a3
    80006b90:	02059593          	slli	a1,a1,0x20
    80006b94:	0205d593          	srli	a1,a1,0x20
    80006b98:	00bd85b3          	add	a1,s11,a1
    80006b9c:	0005c583          	lbu	a1,0(a1)
    80006ba0:	02d7d7bb          	divuw	a5,a5,a3
    80006ba4:	f8b402a3          	sb	a1,-123(s0)
    80006ba8:	46ea7863          	bgeu	s4,a4,80007018 <__printf+0x650>
    80006bac:	02d7f5bb          	remuw	a1,a5,a3
    80006bb0:	02059593          	slli	a1,a1,0x20
    80006bb4:	0205d593          	srli	a1,a1,0x20
    80006bb8:	00bd85b3          	add	a1,s11,a1
    80006bbc:	0005c583          	lbu	a1,0(a1)
    80006bc0:	02d7d7bb          	divuw	a5,a5,a3
    80006bc4:	f8b40323          	sb	a1,-122(s0)
    80006bc8:	3eeaf863          	bgeu	s5,a4,80006fb8 <__printf+0x5f0>
    80006bcc:	02d7f5bb          	remuw	a1,a5,a3
    80006bd0:	02059593          	slli	a1,a1,0x20
    80006bd4:	0205d593          	srli	a1,a1,0x20
    80006bd8:	00bd85b3          	add	a1,s11,a1
    80006bdc:	0005c583          	lbu	a1,0(a1)
    80006be0:	02d7d7bb          	divuw	a5,a5,a3
    80006be4:	f8b403a3          	sb	a1,-121(s0)
    80006be8:	42eb7e63          	bgeu	s6,a4,80007024 <__printf+0x65c>
    80006bec:	02d7f5bb          	remuw	a1,a5,a3
    80006bf0:	02059593          	slli	a1,a1,0x20
    80006bf4:	0205d593          	srli	a1,a1,0x20
    80006bf8:	00bd85b3          	add	a1,s11,a1
    80006bfc:	0005c583          	lbu	a1,0(a1)
    80006c00:	02d7d7bb          	divuw	a5,a5,a3
    80006c04:	f8b40423          	sb	a1,-120(s0)
    80006c08:	42ebfc63          	bgeu	s7,a4,80007040 <__printf+0x678>
    80006c0c:	02079793          	slli	a5,a5,0x20
    80006c10:	0207d793          	srli	a5,a5,0x20
    80006c14:	00fd8db3          	add	s11,s11,a5
    80006c18:	000dc703          	lbu	a4,0(s11)
    80006c1c:	00a00793          	li	a5,10
    80006c20:	00900c93          	li	s9,9
    80006c24:	f8e404a3          	sb	a4,-119(s0)
    80006c28:	00065c63          	bgez	a2,80006c40 <__printf+0x278>
    80006c2c:	f9040713          	addi	a4,s0,-112
    80006c30:	00f70733          	add	a4,a4,a5
    80006c34:	02d00693          	li	a3,45
    80006c38:	fed70823          	sb	a3,-16(a4)
    80006c3c:	00078c93          	mv	s9,a5
    80006c40:	f8040793          	addi	a5,s0,-128
    80006c44:	01978cb3          	add	s9,a5,s9
    80006c48:	f7f40d13          	addi	s10,s0,-129
    80006c4c:	000cc503          	lbu	a0,0(s9)
    80006c50:	fffc8c93          	addi	s9,s9,-1
    80006c54:	00000097          	auipc	ra,0x0
    80006c58:	b90080e7          	jalr	-1136(ra) # 800067e4 <consputc>
    80006c5c:	ffac98e3          	bne	s9,s10,80006c4c <__printf+0x284>
    80006c60:	00094503          	lbu	a0,0(s2)
    80006c64:	e00514e3          	bnez	a0,80006a6c <__printf+0xa4>
    80006c68:	1a0c1663          	bnez	s8,80006e14 <__printf+0x44c>
    80006c6c:	08813083          	ld	ra,136(sp)
    80006c70:	08013403          	ld	s0,128(sp)
    80006c74:	07813483          	ld	s1,120(sp)
    80006c78:	07013903          	ld	s2,112(sp)
    80006c7c:	06813983          	ld	s3,104(sp)
    80006c80:	06013a03          	ld	s4,96(sp)
    80006c84:	05813a83          	ld	s5,88(sp)
    80006c88:	05013b03          	ld	s6,80(sp)
    80006c8c:	04813b83          	ld	s7,72(sp)
    80006c90:	04013c03          	ld	s8,64(sp)
    80006c94:	03813c83          	ld	s9,56(sp)
    80006c98:	03013d03          	ld	s10,48(sp)
    80006c9c:	02813d83          	ld	s11,40(sp)
    80006ca0:	0d010113          	addi	sp,sp,208
    80006ca4:	00008067          	ret
    80006ca8:	07300713          	li	a4,115
    80006cac:	1ce78a63          	beq	a5,a4,80006e80 <__printf+0x4b8>
    80006cb0:	07800713          	li	a4,120
    80006cb4:	1ee79e63          	bne	a5,a4,80006eb0 <__printf+0x4e8>
    80006cb8:	f7843783          	ld	a5,-136(s0)
    80006cbc:	0007a703          	lw	a4,0(a5)
    80006cc0:	00878793          	addi	a5,a5,8
    80006cc4:	f6f43c23          	sd	a5,-136(s0)
    80006cc8:	28074263          	bltz	a4,80006f4c <__printf+0x584>
    80006ccc:	00002d97          	auipc	s11,0x2
    80006cd0:	a5cd8d93          	addi	s11,s11,-1444 # 80008728 <digits>
    80006cd4:	00f77793          	andi	a5,a4,15
    80006cd8:	00fd87b3          	add	a5,s11,a5
    80006cdc:	0007c683          	lbu	a3,0(a5)
    80006ce0:	00f00613          	li	a2,15
    80006ce4:	0007079b          	sext.w	a5,a4
    80006ce8:	f8d40023          	sb	a3,-128(s0)
    80006cec:	0047559b          	srliw	a1,a4,0x4
    80006cf0:	0047569b          	srliw	a3,a4,0x4
    80006cf4:	00000c93          	li	s9,0
    80006cf8:	0ee65063          	bge	a2,a4,80006dd8 <__printf+0x410>
    80006cfc:	00f6f693          	andi	a3,a3,15
    80006d00:	00dd86b3          	add	a3,s11,a3
    80006d04:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80006d08:	0087d79b          	srliw	a5,a5,0x8
    80006d0c:	00100c93          	li	s9,1
    80006d10:	f8d400a3          	sb	a3,-127(s0)
    80006d14:	0cb67263          	bgeu	a2,a1,80006dd8 <__printf+0x410>
    80006d18:	00f7f693          	andi	a3,a5,15
    80006d1c:	00dd86b3          	add	a3,s11,a3
    80006d20:	0006c583          	lbu	a1,0(a3)
    80006d24:	00f00613          	li	a2,15
    80006d28:	0047d69b          	srliw	a3,a5,0x4
    80006d2c:	f8b40123          	sb	a1,-126(s0)
    80006d30:	0047d593          	srli	a1,a5,0x4
    80006d34:	28f67e63          	bgeu	a2,a5,80006fd0 <__printf+0x608>
    80006d38:	00f6f693          	andi	a3,a3,15
    80006d3c:	00dd86b3          	add	a3,s11,a3
    80006d40:	0006c503          	lbu	a0,0(a3)
    80006d44:	0087d813          	srli	a6,a5,0x8
    80006d48:	0087d69b          	srliw	a3,a5,0x8
    80006d4c:	f8a401a3          	sb	a0,-125(s0)
    80006d50:	28b67663          	bgeu	a2,a1,80006fdc <__printf+0x614>
    80006d54:	00f6f693          	andi	a3,a3,15
    80006d58:	00dd86b3          	add	a3,s11,a3
    80006d5c:	0006c583          	lbu	a1,0(a3)
    80006d60:	00c7d513          	srli	a0,a5,0xc
    80006d64:	00c7d69b          	srliw	a3,a5,0xc
    80006d68:	f8b40223          	sb	a1,-124(s0)
    80006d6c:	29067a63          	bgeu	a2,a6,80007000 <__printf+0x638>
    80006d70:	00f6f693          	andi	a3,a3,15
    80006d74:	00dd86b3          	add	a3,s11,a3
    80006d78:	0006c583          	lbu	a1,0(a3)
    80006d7c:	0107d813          	srli	a6,a5,0x10
    80006d80:	0107d69b          	srliw	a3,a5,0x10
    80006d84:	f8b402a3          	sb	a1,-123(s0)
    80006d88:	28a67263          	bgeu	a2,a0,8000700c <__printf+0x644>
    80006d8c:	00f6f693          	andi	a3,a3,15
    80006d90:	00dd86b3          	add	a3,s11,a3
    80006d94:	0006c683          	lbu	a3,0(a3)
    80006d98:	0147d79b          	srliw	a5,a5,0x14
    80006d9c:	f8d40323          	sb	a3,-122(s0)
    80006da0:	21067663          	bgeu	a2,a6,80006fac <__printf+0x5e4>
    80006da4:	02079793          	slli	a5,a5,0x20
    80006da8:	0207d793          	srli	a5,a5,0x20
    80006dac:	00fd8db3          	add	s11,s11,a5
    80006db0:	000dc683          	lbu	a3,0(s11)
    80006db4:	00800793          	li	a5,8
    80006db8:	00700c93          	li	s9,7
    80006dbc:	f8d403a3          	sb	a3,-121(s0)
    80006dc0:	00075c63          	bgez	a4,80006dd8 <__printf+0x410>
    80006dc4:	f9040713          	addi	a4,s0,-112
    80006dc8:	00f70733          	add	a4,a4,a5
    80006dcc:	02d00693          	li	a3,45
    80006dd0:	fed70823          	sb	a3,-16(a4)
    80006dd4:	00078c93          	mv	s9,a5
    80006dd8:	f8040793          	addi	a5,s0,-128
    80006ddc:	01978cb3          	add	s9,a5,s9
    80006de0:	f7f40d13          	addi	s10,s0,-129
    80006de4:	000cc503          	lbu	a0,0(s9)
    80006de8:	fffc8c93          	addi	s9,s9,-1
    80006dec:	00000097          	auipc	ra,0x0
    80006df0:	9f8080e7          	jalr	-1544(ra) # 800067e4 <consputc>
    80006df4:	ff9d18e3          	bne	s10,s9,80006de4 <__printf+0x41c>
    80006df8:	0100006f          	j	80006e08 <__printf+0x440>
    80006dfc:	00000097          	auipc	ra,0x0
    80006e00:	9e8080e7          	jalr	-1560(ra) # 800067e4 <consputc>
    80006e04:	000c8493          	mv	s1,s9
    80006e08:	00094503          	lbu	a0,0(s2)
    80006e0c:	c60510e3          	bnez	a0,80006a6c <__printf+0xa4>
    80006e10:	e40c0ee3          	beqz	s8,80006c6c <__printf+0x2a4>
    80006e14:	00005517          	auipc	a0,0x5
    80006e18:	a2c50513          	addi	a0,a0,-1492 # 8000b840 <pr>
    80006e1c:	00001097          	auipc	ra,0x1
    80006e20:	94c080e7          	jalr	-1716(ra) # 80007768 <release>
    80006e24:	e49ff06f          	j	80006c6c <__printf+0x2a4>
    80006e28:	f7843783          	ld	a5,-136(s0)
    80006e2c:	03000513          	li	a0,48
    80006e30:	01000d13          	li	s10,16
    80006e34:	00878713          	addi	a4,a5,8
    80006e38:	0007bc83          	ld	s9,0(a5)
    80006e3c:	f6e43c23          	sd	a4,-136(s0)
    80006e40:	00000097          	auipc	ra,0x0
    80006e44:	9a4080e7          	jalr	-1628(ra) # 800067e4 <consputc>
    80006e48:	07800513          	li	a0,120
    80006e4c:	00000097          	auipc	ra,0x0
    80006e50:	998080e7          	jalr	-1640(ra) # 800067e4 <consputc>
    80006e54:	00002d97          	auipc	s11,0x2
    80006e58:	8d4d8d93          	addi	s11,s11,-1836 # 80008728 <digits>
    80006e5c:	03ccd793          	srli	a5,s9,0x3c
    80006e60:	00fd87b3          	add	a5,s11,a5
    80006e64:	0007c503          	lbu	a0,0(a5)
    80006e68:	fffd0d1b          	addiw	s10,s10,-1
    80006e6c:	004c9c93          	slli	s9,s9,0x4
    80006e70:	00000097          	auipc	ra,0x0
    80006e74:	974080e7          	jalr	-1676(ra) # 800067e4 <consputc>
    80006e78:	fe0d12e3          	bnez	s10,80006e5c <__printf+0x494>
    80006e7c:	f8dff06f          	j	80006e08 <__printf+0x440>
    80006e80:	f7843783          	ld	a5,-136(s0)
    80006e84:	0007bc83          	ld	s9,0(a5)
    80006e88:	00878793          	addi	a5,a5,8
    80006e8c:	f6f43c23          	sd	a5,-136(s0)
    80006e90:	000c9a63          	bnez	s9,80006ea4 <__printf+0x4dc>
    80006e94:	1080006f          	j	80006f9c <__printf+0x5d4>
    80006e98:	001c8c93          	addi	s9,s9,1
    80006e9c:	00000097          	auipc	ra,0x0
    80006ea0:	948080e7          	jalr	-1720(ra) # 800067e4 <consputc>
    80006ea4:	000cc503          	lbu	a0,0(s9)
    80006ea8:	fe0518e3          	bnez	a0,80006e98 <__printf+0x4d0>
    80006eac:	f5dff06f          	j	80006e08 <__printf+0x440>
    80006eb0:	02500513          	li	a0,37
    80006eb4:	00000097          	auipc	ra,0x0
    80006eb8:	930080e7          	jalr	-1744(ra) # 800067e4 <consputc>
    80006ebc:	000c8513          	mv	a0,s9
    80006ec0:	00000097          	auipc	ra,0x0
    80006ec4:	924080e7          	jalr	-1756(ra) # 800067e4 <consputc>
    80006ec8:	f41ff06f          	j	80006e08 <__printf+0x440>
    80006ecc:	02500513          	li	a0,37
    80006ed0:	00000097          	auipc	ra,0x0
    80006ed4:	914080e7          	jalr	-1772(ra) # 800067e4 <consputc>
    80006ed8:	f31ff06f          	j	80006e08 <__printf+0x440>
    80006edc:	00030513          	mv	a0,t1
    80006ee0:	00000097          	auipc	ra,0x0
    80006ee4:	7bc080e7          	jalr	1980(ra) # 8000769c <acquire>
    80006ee8:	b4dff06f          	j	80006a34 <__printf+0x6c>
    80006eec:	40c0053b          	negw	a0,a2
    80006ef0:	00a00713          	li	a4,10
    80006ef4:	02e576bb          	remuw	a3,a0,a4
    80006ef8:	00002d97          	auipc	s11,0x2
    80006efc:	830d8d93          	addi	s11,s11,-2000 # 80008728 <digits>
    80006f00:	ff700593          	li	a1,-9
    80006f04:	02069693          	slli	a3,a3,0x20
    80006f08:	0206d693          	srli	a3,a3,0x20
    80006f0c:	00dd86b3          	add	a3,s11,a3
    80006f10:	0006c683          	lbu	a3,0(a3)
    80006f14:	02e557bb          	divuw	a5,a0,a4
    80006f18:	f8d40023          	sb	a3,-128(s0)
    80006f1c:	10b65e63          	bge	a2,a1,80007038 <__printf+0x670>
    80006f20:	06300593          	li	a1,99
    80006f24:	02e7f6bb          	remuw	a3,a5,a4
    80006f28:	02069693          	slli	a3,a3,0x20
    80006f2c:	0206d693          	srli	a3,a3,0x20
    80006f30:	00dd86b3          	add	a3,s11,a3
    80006f34:	0006c683          	lbu	a3,0(a3)
    80006f38:	02e7d73b          	divuw	a4,a5,a4
    80006f3c:	00200793          	li	a5,2
    80006f40:	f8d400a3          	sb	a3,-127(s0)
    80006f44:	bca5ece3          	bltu	a1,a0,80006b1c <__printf+0x154>
    80006f48:	ce5ff06f          	j	80006c2c <__printf+0x264>
    80006f4c:	40e007bb          	negw	a5,a4
    80006f50:	00001d97          	auipc	s11,0x1
    80006f54:	7d8d8d93          	addi	s11,s11,2008 # 80008728 <digits>
    80006f58:	00f7f693          	andi	a3,a5,15
    80006f5c:	00dd86b3          	add	a3,s11,a3
    80006f60:	0006c583          	lbu	a1,0(a3)
    80006f64:	ff100613          	li	a2,-15
    80006f68:	0047d69b          	srliw	a3,a5,0x4
    80006f6c:	f8b40023          	sb	a1,-128(s0)
    80006f70:	0047d59b          	srliw	a1,a5,0x4
    80006f74:	0ac75e63          	bge	a4,a2,80007030 <__printf+0x668>
    80006f78:	00f6f693          	andi	a3,a3,15
    80006f7c:	00dd86b3          	add	a3,s11,a3
    80006f80:	0006c603          	lbu	a2,0(a3)
    80006f84:	00f00693          	li	a3,15
    80006f88:	0087d79b          	srliw	a5,a5,0x8
    80006f8c:	f8c400a3          	sb	a2,-127(s0)
    80006f90:	d8b6e4e3          	bltu	a3,a1,80006d18 <__printf+0x350>
    80006f94:	00200793          	li	a5,2
    80006f98:	e2dff06f          	j	80006dc4 <__printf+0x3fc>
    80006f9c:	00001c97          	auipc	s9,0x1
    80006fa0:	76cc8c93          	addi	s9,s9,1900 # 80008708 <CONSOLE_STATUS+0x6f8>
    80006fa4:	02800513          	li	a0,40
    80006fa8:	ef1ff06f          	j	80006e98 <__printf+0x4d0>
    80006fac:	00700793          	li	a5,7
    80006fb0:	00600c93          	li	s9,6
    80006fb4:	e0dff06f          	j	80006dc0 <__printf+0x3f8>
    80006fb8:	00700793          	li	a5,7
    80006fbc:	00600c93          	li	s9,6
    80006fc0:	c69ff06f          	j	80006c28 <__printf+0x260>
    80006fc4:	00300793          	li	a5,3
    80006fc8:	00200c93          	li	s9,2
    80006fcc:	c5dff06f          	j	80006c28 <__printf+0x260>
    80006fd0:	00300793          	li	a5,3
    80006fd4:	00200c93          	li	s9,2
    80006fd8:	de9ff06f          	j	80006dc0 <__printf+0x3f8>
    80006fdc:	00400793          	li	a5,4
    80006fe0:	00300c93          	li	s9,3
    80006fe4:	dddff06f          	j	80006dc0 <__printf+0x3f8>
    80006fe8:	00400793          	li	a5,4
    80006fec:	00300c93          	li	s9,3
    80006ff0:	c39ff06f          	j	80006c28 <__printf+0x260>
    80006ff4:	00500793          	li	a5,5
    80006ff8:	00400c93          	li	s9,4
    80006ffc:	c2dff06f          	j	80006c28 <__printf+0x260>
    80007000:	00500793          	li	a5,5
    80007004:	00400c93          	li	s9,4
    80007008:	db9ff06f          	j	80006dc0 <__printf+0x3f8>
    8000700c:	00600793          	li	a5,6
    80007010:	00500c93          	li	s9,5
    80007014:	dadff06f          	j	80006dc0 <__printf+0x3f8>
    80007018:	00600793          	li	a5,6
    8000701c:	00500c93          	li	s9,5
    80007020:	c09ff06f          	j	80006c28 <__printf+0x260>
    80007024:	00800793          	li	a5,8
    80007028:	00700c93          	li	s9,7
    8000702c:	bfdff06f          	j	80006c28 <__printf+0x260>
    80007030:	00100793          	li	a5,1
    80007034:	d91ff06f          	j	80006dc4 <__printf+0x3fc>
    80007038:	00100793          	li	a5,1
    8000703c:	bf1ff06f          	j	80006c2c <__printf+0x264>
    80007040:	00900793          	li	a5,9
    80007044:	00800c93          	li	s9,8
    80007048:	be1ff06f          	j	80006c28 <__printf+0x260>
    8000704c:	00001517          	auipc	a0,0x1
    80007050:	6c450513          	addi	a0,a0,1732 # 80008710 <CONSOLE_STATUS+0x700>
    80007054:	00000097          	auipc	ra,0x0
    80007058:	918080e7          	jalr	-1768(ra) # 8000696c <panic>

000000008000705c <printfinit>:
    8000705c:	fe010113          	addi	sp,sp,-32
    80007060:	00813823          	sd	s0,16(sp)
    80007064:	00913423          	sd	s1,8(sp)
    80007068:	00113c23          	sd	ra,24(sp)
    8000706c:	02010413          	addi	s0,sp,32
    80007070:	00004497          	auipc	s1,0x4
    80007074:	7d048493          	addi	s1,s1,2000 # 8000b840 <pr>
    80007078:	00048513          	mv	a0,s1
    8000707c:	00001597          	auipc	a1,0x1
    80007080:	6a458593          	addi	a1,a1,1700 # 80008720 <CONSOLE_STATUS+0x710>
    80007084:	00000097          	auipc	ra,0x0
    80007088:	5f4080e7          	jalr	1524(ra) # 80007678 <initlock>
    8000708c:	01813083          	ld	ra,24(sp)
    80007090:	01013403          	ld	s0,16(sp)
    80007094:	0004ac23          	sw	zero,24(s1)
    80007098:	00813483          	ld	s1,8(sp)
    8000709c:	02010113          	addi	sp,sp,32
    800070a0:	00008067          	ret

00000000800070a4 <uartinit>:
    800070a4:	ff010113          	addi	sp,sp,-16
    800070a8:	00813423          	sd	s0,8(sp)
    800070ac:	01010413          	addi	s0,sp,16
    800070b0:	100007b7          	lui	a5,0x10000
    800070b4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800070b8:	f8000713          	li	a4,-128
    800070bc:	00e781a3          	sb	a4,3(a5)
    800070c0:	00300713          	li	a4,3
    800070c4:	00e78023          	sb	a4,0(a5)
    800070c8:	000780a3          	sb	zero,1(a5)
    800070cc:	00e781a3          	sb	a4,3(a5)
    800070d0:	00700693          	li	a3,7
    800070d4:	00d78123          	sb	a3,2(a5)
    800070d8:	00e780a3          	sb	a4,1(a5)
    800070dc:	00813403          	ld	s0,8(sp)
    800070e0:	01010113          	addi	sp,sp,16
    800070e4:	00008067          	ret

00000000800070e8 <uartputc>:
    800070e8:	00003797          	auipc	a5,0x3
    800070ec:	4a07a783          	lw	a5,1184(a5) # 8000a588 <panicked>
    800070f0:	00078463          	beqz	a5,800070f8 <uartputc+0x10>
    800070f4:	0000006f          	j	800070f4 <uartputc+0xc>
    800070f8:	fd010113          	addi	sp,sp,-48
    800070fc:	02813023          	sd	s0,32(sp)
    80007100:	00913c23          	sd	s1,24(sp)
    80007104:	01213823          	sd	s2,16(sp)
    80007108:	01313423          	sd	s3,8(sp)
    8000710c:	02113423          	sd	ra,40(sp)
    80007110:	03010413          	addi	s0,sp,48
    80007114:	00003917          	auipc	s2,0x3
    80007118:	47c90913          	addi	s2,s2,1148 # 8000a590 <uart_tx_r>
    8000711c:	00093783          	ld	a5,0(s2)
    80007120:	00003497          	auipc	s1,0x3
    80007124:	47848493          	addi	s1,s1,1144 # 8000a598 <uart_tx_w>
    80007128:	0004b703          	ld	a4,0(s1)
    8000712c:	02078693          	addi	a3,a5,32
    80007130:	00050993          	mv	s3,a0
    80007134:	02e69c63          	bne	a3,a4,8000716c <uartputc+0x84>
    80007138:	00001097          	auipc	ra,0x1
    8000713c:	834080e7          	jalr	-1996(ra) # 8000796c <push_on>
    80007140:	00093783          	ld	a5,0(s2)
    80007144:	0004b703          	ld	a4,0(s1)
    80007148:	02078793          	addi	a5,a5,32
    8000714c:	00e79463          	bne	a5,a4,80007154 <uartputc+0x6c>
    80007150:	0000006f          	j	80007150 <uartputc+0x68>
    80007154:	00001097          	auipc	ra,0x1
    80007158:	88c080e7          	jalr	-1908(ra) # 800079e0 <pop_on>
    8000715c:	00093783          	ld	a5,0(s2)
    80007160:	0004b703          	ld	a4,0(s1)
    80007164:	02078693          	addi	a3,a5,32
    80007168:	fce688e3          	beq	a3,a4,80007138 <uartputc+0x50>
    8000716c:	01f77693          	andi	a3,a4,31
    80007170:	00004597          	auipc	a1,0x4
    80007174:	6f058593          	addi	a1,a1,1776 # 8000b860 <uart_tx_buf>
    80007178:	00d586b3          	add	a3,a1,a3
    8000717c:	00170713          	addi	a4,a4,1
    80007180:	01368023          	sb	s3,0(a3)
    80007184:	00e4b023          	sd	a4,0(s1)
    80007188:	10000637          	lui	a2,0x10000
    8000718c:	02f71063          	bne	a4,a5,800071ac <uartputc+0xc4>
    80007190:	0340006f          	j	800071c4 <uartputc+0xdc>
    80007194:	00074703          	lbu	a4,0(a4)
    80007198:	00f93023          	sd	a5,0(s2)
    8000719c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800071a0:	00093783          	ld	a5,0(s2)
    800071a4:	0004b703          	ld	a4,0(s1)
    800071a8:	00f70e63          	beq	a4,a5,800071c4 <uartputc+0xdc>
    800071ac:	00564683          	lbu	a3,5(a2)
    800071b0:	01f7f713          	andi	a4,a5,31
    800071b4:	00e58733          	add	a4,a1,a4
    800071b8:	0206f693          	andi	a3,a3,32
    800071bc:	00178793          	addi	a5,a5,1
    800071c0:	fc069ae3          	bnez	a3,80007194 <uartputc+0xac>
    800071c4:	02813083          	ld	ra,40(sp)
    800071c8:	02013403          	ld	s0,32(sp)
    800071cc:	01813483          	ld	s1,24(sp)
    800071d0:	01013903          	ld	s2,16(sp)
    800071d4:	00813983          	ld	s3,8(sp)
    800071d8:	03010113          	addi	sp,sp,48
    800071dc:	00008067          	ret

00000000800071e0 <uartputc_sync>:
    800071e0:	ff010113          	addi	sp,sp,-16
    800071e4:	00813423          	sd	s0,8(sp)
    800071e8:	01010413          	addi	s0,sp,16
    800071ec:	00003717          	auipc	a4,0x3
    800071f0:	39c72703          	lw	a4,924(a4) # 8000a588 <panicked>
    800071f4:	02071663          	bnez	a4,80007220 <uartputc_sync+0x40>
    800071f8:	00050793          	mv	a5,a0
    800071fc:	100006b7          	lui	a3,0x10000
    80007200:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80007204:	02077713          	andi	a4,a4,32
    80007208:	fe070ce3          	beqz	a4,80007200 <uartputc_sync+0x20>
    8000720c:	0ff7f793          	andi	a5,a5,255
    80007210:	00f68023          	sb	a5,0(a3)
    80007214:	00813403          	ld	s0,8(sp)
    80007218:	01010113          	addi	sp,sp,16
    8000721c:	00008067          	ret
    80007220:	0000006f          	j	80007220 <uartputc_sync+0x40>

0000000080007224 <uartstart>:
    80007224:	ff010113          	addi	sp,sp,-16
    80007228:	00813423          	sd	s0,8(sp)
    8000722c:	01010413          	addi	s0,sp,16
    80007230:	00003617          	auipc	a2,0x3
    80007234:	36060613          	addi	a2,a2,864 # 8000a590 <uart_tx_r>
    80007238:	00003517          	auipc	a0,0x3
    8000723c:	36050513          	addi	a0,a0,864 # 8000a598 <uart_tx_w>
    80007240:	00063783          	ld	a5,0(a2)
    80007244:	00053703          	ld	a4,0(a0)
    80007248:	04f70263          	beq	a4,a5,8000728c <uartstart+0x68>
    8000724c:	100005b7          	lui	a1,0x10000
    80007250:	00004817          	auipc	a6,0x4
    80007254:	61080813          	addi	a6,a6,1552 # 8000b860 <uart_tx_buf>
    80007258:	01c0006f          	j	80007274 <uartstart+0x50>
    8000725c:	0006c703          	lbu	a4,0(a3)
    80007260:	00f63023          	sd	a5,0(a2)
    80007264:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80007268:	00063783          	ld	a5,0(a2)
    8000726c:	00053703          	ld	a4,0(a0)
    80007270:	00f70e63          	beq	a4,a5,8000728c <uartstart+0x68>
    80007274:	01f7f713          	andi	a4,a5,31
    80007278:	00e806b3          	add	a3,a6,a4
    8000727c:	0055c703          	lbu	a4,5(a1)
    80007280:	00178793          	addi	a5,a5,1
    80007284:	02077713          	andi	a4,a4,32
    80007288:	fc071ae3          	bnez	a4,8000725c <uartstart+0x38>
    8000728c:	00813403          	ld	s0,8(sp)
    80007290:	01010113          	addi	sp,sp,16
    80007294:	00008067          	ret

0000000080007298 <uartgetc>:
    80007298:	ff010113          	addi	sp,sp,-16
    8000729c:	00813423          	sd	s0,8(sp)
    800072a0:	01010413          	addi	s0,sp,16
    800072a4:	10000737          	lui	a4,0x10000
    800072a8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800072ac:	0017f793          	andi	a5,a5,1
    800072b0:	00078c63          	beqz	a5,800072c8 <uartgetc+0x30>
    800072b4:	00074503          	lbu	a0,0(a4)
    800072b8:	0ff57513          	andi	a0,a0,255
    800072bc:	00813403          	ld	s0,8(sp)
    800072c0:	01010113          	addi	sp,sp,16
    800072c4:	00008067          	ret
    800072c8:	fff00513          	li	a0,-1
    800072cc:	ff1ff06f          	j	800072bc <uartgetc+0x24>

00000000800072d0 <uartintr>:
    800072d0:	100007b7          	lui	a5,0x10000
    800072d4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800072d8:	0017f793          	andi	a5,a5,1
    800072dc:	0a078463          	beqz	a5,80007384 <uartintr+0xb4>
    800072e0:	fe010113          	addi	sp,sp,-32
    800072e4:	00813823          	sd	s0,16(sp)
    800072e8:	00913423          	sd	s1,8(sp)
    800072ec:	00113c23          	sd	ra,24(sp)
    800072f0:	02010413          	addi	s0,sp,32
    800072f4:	100004b7          	lui	s1,0x10000
    800072f8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800072fc:	0ff57513          	andi	a0,a0,255
    80007300:	fffff097          	auipc	ra,0xfffff
    80007304:	534080e7          	jalr	1332(ra) # 80006834 <consoleintr>
    80007308:	0054c783          	lbu	a5,5(s1)
    8000730c:	0017f793          	andi	a5,a5,1
    80007310:	fe0794e3          	bnez	a5,800072f8 <uartintr+0x28>
    80007314:	00003617          	auipc	a2,0x3
    80007318:	27c60613          	addi	a2,a2,636 # 8000a590 <uart_tx_r>
    8000731c:	00003517          	auipc	a0,0x3
    80007320:	27c50513          	addi	a0,a0,636 # 8000a598 <uart_tx_w>
    80007324:	00063783          	ld	a5,0(a2)
    80007328:	00053703          	ld	a4,0(a0)
    8000732c:	04f70263          	beq	a4,a5,80007370 <uartintr+0xa0>
    80007330:	100005b7          	lui	a1,0x10000
    80007334:	00004817          	auipc	a6,0x4
    80007338:	52c80813          	addi	a6,a6,1324 # 8000b860 <uart_tx_buf>
    8000733c:	01c0006f          	j	80007358 <uartintr+0x88>
    80007340:	0006c703          	lbu	a4,0(a3)
    80007344:	00f63023          	sd	a5,0(a2)
    80007348:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000734c:	00063783          	ld	a5,0(a2)
    80007350:	00053703          	ld	a4,0(a0)
    80007354:	00f70e63          	beq	a4,a5,80007370 <uartintr+0xa0>
    80007358:	01f7f713          	andi	a4,a5,31
    8000735c:	00e806b3          	add	a3,a6,a4
    80007360:	0055c703          	lbu	a4,5(a1)
    80007364:	00178793          	addi	a5,a5,1
    80007368:	02077713          	andi	a4,a4,32
    8000736c:	fc071ae3          	bnez	a4,80007340 <uartintr+0x70>
    80007370:	01813083          	ld	ra,24(sp)
    80007374:	01013403          	ld	s0,16(sp)
    80007378:	00813483          	ld	s1,8(sp)
    8000737c:	02010113          	addi	sp,sp,32
    80007380:	00008067          	ret
    80007384:	00003617          	auipc	a2,0x3
    80007388:	20c60613          	addi	a2,a2,524 # 8000a590 <uart_tx_r>
    8000738c:	00003517          	auipc	a0,0x3
    80007390:	20c50513          	addi	a0,a0,524 # 8000a598 <uart_tx_w>
    80007394:	00063783          	ld	a5,0(a2)
    80007398:	00053703          	ld	a4,0(a0)
    8000739c:	04f70263          	beq	a4,a5,800073e0 <uartintr+0x110>
    800073a0:	100005b7          	lui	a1,0x10000
    800073a4:	00004817          	auipc	a6,0x4
    800073a8:	4bc80813          	addi	a6,a6,1212 # 8000b860 <uart_tx_buf>
    800073ac:	01c0006f          	j	800073c8 <uartintr+0xf8>
    800073b0:	0006c703          	lbu	a4,0(a3)
    800073b4:	00f63023          	sd	a5,0(a2)
    800073b8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800073bc:	00063783          	ld	a5,0(a2)
    800073c0:	00053703          	ld	a4,0(a0)
    800073c4:	02f70063          	beq	a4,a5,800073e4 <uartintr+0x114>
    800073c8:	01f7f713          	andi	a4,a5,31
    800073cc:	00e806b3          	add	a3,a6,a4
    800073d0:	0055c703          	lbu	a4,5(a1)
    800073d4:	00178793          	addi	a5,a5,1
    800073d8:	02077713          	andi	a4,a4,32
    800073dc:	fc071ae3          	bnez	a4,800073b0 <uartintr+0xe0>
    800073e0:	00008067          	ret
    800073e4:	00008067          	ret

00000000800073e8 <kinit>:
    800073e8:	fc010113          	addi	sp,sp,-64
    800073ec:	02913423          	sd	s1,40(sp)
    800073f0:	fffff7b7          	lui	a5,0xfffff
    800073f4:	00005497          	auipc	s1,0x5
    800073f8:	48b48493          	addi	s1,s1,1163 # 8000c87f <end+0xfff>
    800073fc:	02813823          	sd	s0,48(sp)
    80007400:	01313c23          	sd	s3,24(sp)
    80007404:	00f4f4b3          	and	s1,s1,a5
    80007408:	02113c23          	sd	ra,56(sp)
    8000740c:	03213023          	sd	s2,32(sp)
    80007410:	01413823          	sd	s4,16(sp)
    80007414:	01513423          	sd	s5,8(sp)
    80007418:	04010413          	addi	s0,sp,64
    8000741c:	000017b7          	lui	a5,0x1
    80007420:	01100993          	li	s3,17
    80007424:	00f487b3          	add	a5,s1,a5
    80007428:	01b99993          	slli	s3,s3,0x1b
    8000742c:	06f9e063          	bltu	s3,a5,8000748c <kinit+0xa4>
    80007430:	00004a97          	auipc	s5,0x4
    80007434:	450a8a93          	addi	s5,s5,1104 # 8000b880 <end>
    80007438:	0754ec63          	bltu	s1,s5,800074b0 <kinit+0xc8>
    8000743c:	0734fa63          	bgeu	s1,s3,800074b0 <kinit+0xc8>
    80007440:	00088a37          	lui	s4,0x88
    80007444:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80007448:	00003917          	auipc	s2,0x3
    8000744c:	15890913          	addi	s2,s2,344 # 8000a5a0 <kmem>
    80007450:	00ca1a13          	slli	s4,s4,0xc
    80007454:	0140006f          	j	80007468 <kinit+0x80>
    80007458:	000017b7          	lui	a5,0x1
    8000745c:	00f484b3          	add	s1,s1,a5
    80007460:	0554e863          	bltu	s1,s5,800074b0 <kinit+0xc8>
    80007464:	0534f663          	bgeu	s1,s3,800074b0 <kinit+0xc8>
    80007468:	00001637          	lui	a2,0x1
    8000746c:	00100593          	li	a1,1
    80007470:	00048513          	mv	a0,s1
    80007474:	00000097          	auipc	ra,0x0
    80007478:	5e4080e7          	jalr	1508(ra) # 80007a58 <__memset>
    8000747c:	00093783          	ld	a5,0(s2)
    80007480:	00f4b023          	sd	a5,0(s1)
    80007484:	00993023          	sd	s1,0(s2)
    80007488:	fd4498e3          	bne	s1,s4,80007458 <kinit+0x70>
    8000748c:	03813083          	ld	ra,56(sp)
    80007490:	03013403          	ld	s0,48(sp)
    80007494:	02813483          	ld	s1,40(sp)
    80007498:	02013903          	ld	s2,32(sp)
    8000749c:	01813983          	ld	s3,24(sp)
    800074a0:	01013a03          	ld	s4,16(sp)
    800074a4:	00813a83          	ld	s5,8(sp)
    800074a8:	04010113          	addi	sp,sp,64
    800074ac:	00008067          	ret
    800074b0:	00001517          	auipc	a0,0x1
    800074b4:	29050513          	addi	a0,a0,656 # 80008740 <digits+0x18>
    800074b8:	fffff097          	auipc	ra,0xfffff
    800074bc:	4b4080e7          	jalr	1204(ra) # 8000696c <panic>

00000000800074c0 <freerange>:
    800074c0:	fc010113          	addi	sp,sp,-64
    800074c4:	000017b7          	lui	a5,0x1
    800074c8:	02913423          	sd	s1,40(sp)
    800074cc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800074d0:	009504b3          	add	s1,a0,s1
    800074d4:	fffff537          	lui	a0,0xfffff
    800074d8:	02813823          	sd	s0,48(sp)
    800074dc:	02113c23          	sd	ra,56(sp)
    800074e0:	03213023          	sd	s2,32(sp)
    800074e4:	01313c23          	sd	s3,24(sp)
    800074e8:	01413823          	sd	s4,16(sp)
    800074ec:	01513423          	sd	s5,8(sp)
    800074f0:	01613023          	sd	s6,0(sp)
    800074f4:	04010413          	addi	s0,sp,64
    800074f8:	00a4f4b3          	and	s1,s1,a0
    800074fc:	00f487b3          	add	a5,s1,a5
    80007500:	06f5e463          	bltu	a1,a5,80007568 <freerange+0xa8>
    80007504:	00004a97          	auipc	s5,0x4
    80007508:	37ca8a93          	addi	s5,s5,892 # 8000b880 <end>
    8000750c:	0954e263          	bltu	s1,s5,80007590 <freerange+0xd0>
    80007510:	01100993          	li	s3,17
    80007514:	01b99993          	slli	s3,s3,0x1b
    80007518:	0734fc63          	bgeu	s1,s3,80007590 <freerange+0xd0>
    8000751c:	00058a13          	mv	s4,a1
    80007520:	00003917          	auipc	s2,0x3
    80007524:	08090913          	addi	s2,s2,128 # 8000a5a0 <kmem>
    80007528:	00002b37          	lui	s6,0x2
    8000752c:	0140006f          	j	80007540 <freerange+0x80>
    80007530:	000017b7          	lui	a5,0x1
    80007534:	00f484b3          	add	s1,s1,a5
    80007538:	0554ec63          	bltu	s1,s5,80007590 <freerange+0xd0>
    8000753c:	0534fa63          	bgeu	s1,s3,80007590 <freerange+0xd0>
    80007540:	00001637          	lui	a2,0x1
    80007544:	00100593          	li	a1,1
    80007548:	00048513          	mv	a0,s1
    8000754c:	00000097          	auipc	ra,0x0
    80007550:	50c080e7          	jalr	1292(ra) # 80007a58 <__memset>
    80007554:	00093703          	ld	a4,0(s2)
    80007558:	016487b3          	add	a5,s1,s6
    8000755c:	00e4b023          	sd	a4,0(s1)
    80007560:	00993023          	sd	s1,0(s2)
    80007564:	fcfa76e3          	bgeu	s4,a5,80007530 <freerange+0x70>
    80007568:	03813083          	ld	ra,56(sp)
    8000756c:	03013403          	ld	s0,48(sp)
    80007570:	02813483          	ld	s1,40(sp)
    80007574:	02013903          	ld	s2,32(sp)
    80007578:	01813983          	ld	s3,24(sp)
    8000757c:	01013a03          	ld	s4,16(sp)
    80007580:	00813a83          	ld	s5,8(sp)
    80007584:	00013b03          	ld	s6,0(sp)
    80007588:	04010113          	addi	sp,sp,64
    8000758c:	00008067          	ret
    80007590:	00001517          	auipc	a0,0x1
    80007594:	1b050513          	addi	a0,a0,432 # 80008740 <digits+0x18>
    80007598:	fffff097          	auipc	ra,0xfffff
    8000759c:	3d4080e7          	jalr	980(ra) # 8000696c <panic>

00000000800075a0 <kfree>:
    800075a0:	fe010113          	addi	sp,sp,-32
    800075a4:	00813823          	sd	s0,16(sp)
    800075a8:	00113c23          	sd	ra,24(sp)
    800075ac:	00913423          	sd	s1,8(sp)
    800075b0:	02010413          	addi	s0,sp,32
    800075b4:	03451793          	slli	a5,a0,0x34
    800075b8:	04079c63          	bnez	a5,80007610 <kfree+0x70>
    800075bc:	00004797          	auipc	a5,0x4
    800075c0:	2c478793          	addi	a5,a5,708 # 8000b880 <end>
    800075c4:	00050493          	mv	s1,a0
    800075c8:	04f56463          	bltu	a0,a5,80007610 <kfree+0x70>
    800075cc:	01100793          	li	a5,17
    800075d0:	01b79793          	slli	a5,a5,0x1b
    800075d4:	02f57e63          	bgeu	a0,a5,80007610 <kfree+0x70>
    800075d8:	00001637          	lui	a2,0x1
    800075dc:	00100593          	li	a1,1
    800075e0:	00000097          	auipc	ra,0x0
    800075e4:	478080e7          	jalr	1144(ra) # 80007a58 <__memset>
    800075e8:	00003797          	auipc	a5,0x3
    800075ec:	fb878793          	addi	a5,a5,-72 # 8000a5a0 <kmem>
    800075f0:	0007b703          	ld	a4,0(a5)
    800075f4:	01813083          	ld	ra,24(sp)
    800075f8:	01013403          	ld	s0,16(sp)
    800075fc:	00e4b023          	sd	a4,0(s1)
    80007600:	0097b023          	sd	s1,0(a5)
    80007604:	00813483          	ld	s1,8(sp)
    80007608:	02010113          	addi	sp,sp,32
    8000760c:	00008067          	ret
    80007610:	00001517          	auipc	a0,0x1
    80007614:	13050513          	addi	a0,a0,304 # 80008740 <digits+0x18>
    80007618:	fffff097          	auipc	ra,0xfffff
    8000761c:	354080e7          	jalr	852(ra) # 8000696c <panic>

0000000080007620 <kalloc>:
    80007620:	fe010113          	addi	sp,sp,-32
    80007624:	00813823          	sd	s0,16(sp)
    80007628:	00913423          	sd	s1,8(sp)
    8000762c:	00113c23          	sd	ra,24(sp)
    80007630:	02010413          	addi	s0,sp,32
    80007634:	00003797          	auipc	a5,0x3
    80007638:	f6c78793          	addi	a5,a5,-148 # 8000a5a0 <kmem>
    8000763c:	0007b483          	ld	s1,0(a5)
    80007640:	02048063          	beqz	s1,80007660 <kalloc+0x40>
    80007644:	0004b703          	ld	a4,0(s1)
    80007648:	00001637          	lui	a2,0x1
    8000764c:	00500593          	li	a1,5
    80007650:	00048513          	mv	a0,s1
    80007654:	00e7b023          	sd	a4,0(a5)
    80007658:	00000097          	auipc	ra,0x0
    8000765c:	400080e7          	jalr	1024(ra) # 80007a58 <__memset>
    80007660:	01813083          	ld	ra,24(sp)
    80007664:	01013403          	ld	s0,16(sp)
    80007668:	00048513          	mv	a0,s1
    8000766c:	00813483          	ld	s1,8(sp)
    80007670:	02010113          	addi	sp,sp,32
    80007674:	00008067          	ret

0000000080007678 <initlock>:
    80007678:	ff010113          	addi	sp,sp,-16
    8000767c:	00813423          	sd	s0,8(sp)
    80007680:	01010413          	addi	s0,sp,16
    80007684:	00813403          	ld	s0,8(sp)
    80007688:	00b53423          	sd	a1,8(a0)
    8000768c:	00052023          	sw	zero,0(a0)
    80007690:	00053823          	sd	zero,16(a0)
    80007694:	01010113          	addi	sp,sp,16
    80007698:	00008067          	ret

000000008000769c <acquire>:
    8000769c:	fe010113          	addi	sp,sp,-32
    800076a0:	00813823          	sd	s0,16(sp)
    800076a4:	00913423          	sd	s1,8(sp)
    800076a8:	00113c23          	sd	ra,24(sp)
    800076ac:	01213023          	sd	s2,0(sp)
    800076b0:	02010413          	addi	s0,sp,32
    800076b4:	00050493          	mv	s1,a0
    800076b8:	10002973          	csrr	s2,sstatus
    800076bc:	100027f3          	csrr	a5,sstatus
    800076c0:	ffd7f793          	andi	a5,a5,-3
    800076c4:	10079073          	csrw	sstatus,a5
    800076c8:	fffff097          	auipc	ra,0xfffff
    800076cc:	8e0080e7          	jalr	-1824(ra) # 80005fa8 <mycpu>
    800076d0:	07852783          	lw	a5,120(a0)
    800076d4:	06078e63          	beqz	a5,80007750 <acquire+0xb4>
    800076d8:	fffff097          	auipc	ra,0xfffff
    800076dc:	8d0080e7          	jalr	-1840(ra) # 80005fa8 <mycpu>
    800076e0:	07852783          	lw	a5,120(a0)
    800076e4:	0004a703          	lw	a4,0(s1)
    800076e8:	0017879b          	addiw	a5,a5,1
    800076ec:	06f52c23          	sw	a5,120(a0)
    800076f0:	04071063          	bnez	a4,80007730 <acquire+0x94>
    800076f4:	00100713          	li	a4,1
    800076f8:	00070793          	mv	a5,a4
    800076fc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80007700:	0007879b          	sext.w	a5,a5
    80007704:	fe079ae3          	bnez	a5,800076f8 <acquire+0x5c>
    80007708:	0ff0000f          	fence
    8000770c:	fffff097          	auipc	ra,0xfffff
    80007710:	89c080e7          	jalr	-1892(ra) # 80005fa8 <mycpu>
    80007714:	01813083          	ld	ra,24(sp)
    80007718:	01013403          	ld	s0,16(sp)
    8000771c:	00a4b823          	sd	a0,16(s1)
    80007720:	00013903          	ld	s2,0(sp)
    80007724:	00813483          	ld	s1,8(sp)
    80007728:	02010113          	addi	sp,sp,32
    8000772c:	00008067          	ret
    80007730:	0104b903          	ld	s2,16(s1)
    80007734:	fffff097          	auipc	ra,0xfffff
    80007738:	874080e7          	jalr	-1932(ra) # 80005fa8 <mycpu>
    8000773c:	faa91ce3          	bne	s2,a0,800076f4 <acquire+0x58>
    80007740:	00001517          	auipc	a0,0x1
    80007744:	00850513          	addi	a0,a0,8 # 80008748 <digits+0x20>
    80007748:	fffff097          	auipc	ra,0xfffff
    8000774c:	224080e7          	jalr	548(ra) # 8000696c <panic>
    80007750:	00195913          	srli	s2,s2,0x1
    80007754:	fffff097          	auipc	ra,0xfffff
    80007758:	854080e7          	jalr	-1964(ra) # 80005fa8 <mycpu>
    8000775c:	00197913          	andi	s2,s2,1
    80007760:	07252e23          	sw	s2,124(a0)
    80007764:	f75ff06f          	j	800076d8 <acquire+0x3c>

0000000080007768 <release>:
    80007768:	fe010113          	addi	sp,sp,-32
    8000776c:	00813823          	sd	s0,16(sp)
    80007770:	00113c23          	sd	ra,24(sp)
    80007774:	00913423          	sd	s1,8(sp)
    80007778:	01213023          	sd	s2,0(sp)
    8000777c:	02010413          	addi	s0,sp,32
    80007780:	00052783          	lw	a5,0(a0)
    80007784:	00079a63          	bnez	a5,80007798 <release+0x30>
    80007788:	00001517          	auipc	a0,0x1
    8000778c:	fc850513          	addi	a0,a0,-56 # 80008750 <digits+0x28>
    80007790:	fffff097          	auipc	ra,0xfffff
    80007794:	1dc080e7          	jalr	476(ra) # 8000696c <panic>
    80007798:	01053903          	ld	s2,16(a0)
    8000779c:	00050493          	mv	s1,a0
    800077a0:	fffff097          	auipc	ra,0xfffff
    800077a4:	808080e7          	jalr	-2040(ra) # 80005fa8 <mycpu>
    800077a8:	fea910e3          	bne	s2,a0,80007788 <release+0x20>
    800077ac:	0004b823          	sd	zero,16(s1)
    800077b0:	0ff0000f          	fence
    800077b4:	0f50000f          	fence	iorw,ow
    800077b8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800077bc:	ffffe097          	auipc	ra,0xffffe
    800077c0:	7ec080e7          	jalr	2028(ra) # 80005fa8 <mycpu>
    800077c4:	100027f3          	csrr	a5,sstatus
    800077c8:	0027f793          	andi	a5,a5,2
    800077cc:	04079a63          	bnez	a5,80007820 <release+0xb8>
    800077d0:	07852783          	lw	a5,120(a0)
    800077d4:	02f05e63          	blez	a5,80007810 <release+0xa8>
    800077d8:	fff7871b          	addiw	a4,a5,-1
    800077dc:	06e52c23          	sw	a4,120(a0)
    800077e0:	00071c63          	bnez	a4,800077f8 <release+0x90>
    800077e4:	07c52783          	lw	a5,124(a0)
    800077e8:	00078863          	beqz	a5,800077f8 <release+0x90>
    800077ec:	100027f3          	csrr	a5,sstatus
    800077f0:	0027e793          	ori	a5,a5,2
    800077f4:	10079073          	csrw	sstatus,a5
    800077f8:	01813083          	ld	ra,24(sp)
    800077fc:	01013403          	ld	s0,16(sp)
    80007800:	00813483          	ld	s1,8(sp)
    80007804:	00013903          	ld	s2,0(sp)
    80007808:	02010113          	addi	sp,sp,32
    8000780c:	00008067          	ret
    80007810:	00001517          	auipc	a0,0x1
    80007814:	f6050513          	addi	a0,a0,-160 # 80008770 <digits+0x48>
    80007818:	fffff097          	auipc	ra,0xfffff
    8000781c:	154080e7          	jalr	340(ra) # 8000696c <panic>
    80007820:	00001517          	auipc	a0,0x1
    80007824:	f3850513          	addi	a0,a0,-200 # 80008758 <digits+0x30>
    80007828:	fffff097          	auipc	ra,0xfffff
    8000782c:	144080e7          	jalr	324(ra) # 8000696c <panic>

0000000080007830 <holding>:
    80007830:	00052783          	lw	a5,0(a0)
    80007834:	00079663          	bnez	a5,80007840 <holding+0x10>
    80007838:	00000513          	li	a0,0
    8000783c:	00008067          	ret
    80007840:	fe010113          	addi	sp,sp,-32
    80007844:	00813823          	sd	s0,16(sp)
    80007848:	00913423          	sd	s1,8(sp)
    8000784c:	00113c23          	sd	ra,24(sp)
    80007850:	02010413          	addi	s0,sp,32
    80007854:	01053483          	ld	s1,16(a0)
    80007858:	ffffe097          	auipc	ra,0xffffe
    8000785c:	750080e7          	jalr	1872(ra) # 80005fa8 <mycpu>
    80007860:	01813083          	ld	ra,24(sp)
    80007864:	01013403          	ld	s0,16(sp)
    80007868:	40a48533          	sub	a0,s1,a0
    8000786c:	00153513          	seqz	a0,a0
    80007870:	00813483          	ld	s1,8(sp)
    80007874:	02010113          	addi	sp,sp,32
    80007878:	00008067          	ret

000000008000787c <push_off>:
    8000787c:	fe010113          	addi	sp,sp,-32
    80007880:	00813823          	sd	s0,16(sp)
    80007884:	00113c23          	sd	ra,24(sp)
    80007888:	00913423          	sd	s1,8(sp)
    8000788c:	02010413          	addi	s0,sp,32
    80007890:	100024f3          	csrr	s1,sstatus
    80007894:	100027f3          	csrr	a5,sstatus
    80007898:	ffd7f793          	andi	a5,a5,-3
    8000789c:	10079073          	csrw	sstatus,a5
    800078a0:	ffffe097          	auipc	ra,0xffffe
    800078a4:	708080e7          	jalr	1800(ra) # 80005fa8 <mycpu>
    800078a8:	07852783          	lw	a5,120(a0)
    800078ac:	02078663          	beqz	a5,800078d8 <push_off+0x5c>
    800078b0:	ffffe097          	auipc	ra,0xffffe
    800078b4:	6f8080e7          	jalr	1784(ra) # 80005fa8 <mycpu>
    800078b8:	07852783          	lw	a5,120(a0)
    800078bc:	01813083          	ld	ra,24(sp)
    800078c0:	01013403          	ld	s0,16(sp)
    800078c4:	0017879b          	addiw	a5,a5,1
    800078c8:	06f52c23          	sw	a5,120(a0)
    800078cc:	00813483          	ld	s1,8(sp)
    800078d0:	02010113          	addi	sp,sp,32
    800078d4:	00008067          	ret
    800078d8:	0014d493          	srli	s1,s1,0x1
    800078dc:	ffffe097          	auipc	ra,0xffffe
    800078e0:	6cc080e7          	jalr	1740(ra) # 80005fa8 <mycpu>
    800078e4:	0014f493          	andi	s1,s1,1
    800078e8:	06952e23          	sw	s1,124(a0)
    800078ec:	fc5ff06f          	j	800078b0 <push_off+0x34>

00000000800078f0 <pop_off>:
    800078f0:	ff010113          	addi	sp,sp,-16
    800078f4:	00813023          	sd	s0,0(sp)
    800078f8:	00113423          	sd	ra,8(sp)
    800078fc:	01010413          	addi	s0,sp,16
    80007900:	ffffe097          	auipc	ra,0xffffe
    80007904:	6a8080e7          	jalr	1704(ra) # 80005fa8 <mycpu>
    80007908:	100027f3          	csrr	a5,sstatus
    8000790c:	0027f793          	andi	a5,a5,2
    80007910:	04079663          	bnez	a5,8000795c <pop_off+0x6c>
    80007914:	07852783          	lw	a5,120(a0)
    80007918:	02f05a63          	blez	a5,8000794c <pop_off+0x5c>
    8000791c:	fff7871b          	addiw	a4,a5,-1
    80007920:	06e52c23          	sw	a4,120(a0)
    80007924:	00071c63          	bnez	a4,8000793c <pop_off+0x4c>
    80007928:	07c52783          	lw	a5,124(a0)
    8000792c:	00078863          	beqz	a5,8000793c <pop_off+0x4c>
    80007930:	100027f3          	csrr	a5,sstatus
    80007934:	0027e793          	ori	a5,a5,2
    80007938:	10079073          	csrw	sstatus,a5
    8000793c:	00813083          	ld	ra,8(sp)
    80007940:	00013403          	ld	s0,0(sp)
    80007944:	01010113          	addi	sp,sp,16
    80007948:	00008067          	ret
    8000794c:	00001517          	auipc	a0,0x1
    80007950:	e2450513          	addi	a0,a0,-476 # 80008770 <digits+0x48>
    80007954:	fffff097          	auipc	ra,0xfffff
    80007958:	018080e7          	jalr	24(ra) # 8000696c <panic>
    8000795c:	00001517          	auipc	a0,0x1
    80007960:	dfc50513          	addi	a0,a0,-516 # 80008758 <digits+0x30>
    80007964:	fffff097          	auipc	ra,0xfffff
    80007968:	008080e7          	jalr	8(ra) # 8000696c <panic>

000000008000796c <push_on>:
    8000796c:	fe010113          	addi	sp,sp,-32
    80007970:	00813823          	sd	s0,16(sp)
    80007974:	00113c23          	sd	ra,24(sp)
    80007978:	00913423          	sd	s1,8(sp)
    8000797c:	02010413          	addi	s0,sp,32
    80007980:	100024f3          	csrr	s1,sstatus
    80007984:	100027f3          	csrr	a5,sstatus
    80007988:	0027e793          	ori	a5,a5,2
    8000798c:	10079073          	csrw	sstatus,a5
    80007990:	ffffe097          	auipc	ra,0xffffe
    80007994:	618080e7          	jalr	1560(ra) # 80005fa8 <mycpu>
    80007998:	07852783          	lw	a5,120(a0)
    8000799c:	02078663          	beqz	a5,800079c8 <push_on+0x5c>
    800079a0:	ffffe097          	auipc	ra,0xffffe
    800079a4:	608080e7          	jalr	1544(ra) # 80005fa8 <mycpu>
    800079a8:	07852783          	lw	a5,120(a0)
    800079ac:	01813083          	ld	ra,24(sp)
    800079b0:	01013403          	ld	s0,16(sp)
    800079b4:	0017879b          	addiw	a5,a5,1
    800079b8:	06f52c23          	sw	a5,120(a0)
    800079bc:	00813483          	ld	s1,8(sp)
    800079c0:	02010113          	addi	sp,sp,32
    800079c4:	00008067          	ret
    800079c8:	0014d493          	srli	s1,s1,0x1
    800079cc:	ffffe097          	auipc	ra,0xffffe
    800079d0:	5dc080e7          	jalr	1500(ra) # 80005fa8 <mycpu>
    800079d4:	0014f493          	andi	s1,s1,1
    800079d8:	06952e23          	sw	s1,124(a0)
    800079dc:	fc5ff06f          	j	800079a0 <push_on+0x34>

00000000800079e0 <pop_on>:
    800079e0:	ff010113          	addi	sp,sp,-16
    800079e4:	00813023          	sd	s0,0(sp)
    800079e8:	00113423          	sd	ra,8(sp)
    800079ec:	01010413          	addi	s0,sp,16
    800079f0:	ffffe097          	auipc	ra,0xffffe
    800079f4:	5b8080e7          	jalr	1464(ra) # 80005fa8 <mycpu>
    800079f8:	100027f3          	csrr	a5,sstatus
    800079fc:	0027f793          	andi	a5,a5,2
    80007a00:	04078463          	beqz	a5,80007a48 <pop_on+0x68>
    80007a04:	07852783          	lw	a5,120(a0)
    80007a08:	02f05863          	blez	a5,80007a38 <pop_on+0x58>
    80007a0c:	fff7879b          	addiw	a5,a5,-1
    80007a10:	06f52c23          	sw	a5,120(a0)
    80007a14:	07853783          	ld	a5,120(a0)
    80007a18:	00079863          	bnez	a5,80007a28 <pop_on+0x48>
    80007a1c:	100027f3          	csrr	a5,sstatus
    80007a20:	ffd7f793          	andi	a5,a5,-3
    80007a24:	10079073          	csrw	sstatus,a5
    80007a28:	00813083          	ld	ra,8(sp)
    80007a2c:	00013403          	ld	s0,0(sp)
    80007a30:	01010113          	addi	sp,sp,16
    80007a34:	00008067          	ret
    80007a38:	00001517          	auipc	a0,0x1
    80007a3c:	d6050513          	addi	a0,a0,-672 # 80008798 <digits+0x70>
    80007a40:	fffff097          	auipc	ra,0xfffff
    80007a44:	f2c080e7          	jalr	-212(ra) # 8000696c <panic>
    80007a48:	00001517          	auipc	a0,0x1
    80007a4c:	d3050513          	addi	a0,a0,-720 # 80008778 <digits+0x50>
    80007a50:	fffff097          	auipc	ra,0xfffff
    80007a54:	f1c080e7          	jalr	-228(ra) # 8000696c <panic>

0000000080007a58 <__memset>:
    80007a58:	ff010113          	addi	sp,sp,-16
    80007a5c:	00813423          	sd	s0,8(sp)
    80007a60:	01010413          	addi	s0,sp,16
    80007a64:	1a060e63          	beqz	a2,80007c20 <__memset+0x1c8>
    80007a68:	40a007b3          	neg	a5,a0
    80007a6c:	0077f793          	andi	a5,a5,7
    80007a70:	00778693          	addi	a3,a5,7
    80007a74:	00b00813          	li	a6,11
    80007a78:	0ff5f593          	andi	a1,a1,255
    80007a7c:	fff6071b          	addiw	a4,a2,-1
    80007a80:	1b06e663          	bltu	a3,a6,80007c2c <__memset+0x1d4>
    80007a84:	1cd76463          	bltu	a4,a3,80007c4c <__memset+0x1f4>
    80007a88:	1a078e63          	beqz	a5,80007c44 <__memset+0x1ec>
    80007a8c:	00b50023          	sb	a1,0(a0)
    80007a90:	00100713          	li	a4,1
    80007a94:	1ae78463          	beq	a5,a4,80007c3c <__memset+0x1e4>
    80007a98:	00b500a3          	sb	a1,1(a0)
    80007a9c:	00200713          	li	a4,2
    80007aa0:	1ae78a63          	beq	a5,a4,80007c54 <__memset+0x1fc>
    80007aa4:	00b50123          	sb	a1,2(a0)
    80007aa8:	00300713          	li	a4,3
    80007aac:	18e78463          	beq	a5,a4,80007c34 <__memset+0x1dc>
    80007ab0:	00b501a3          	sb	a1,3(a0)
    80007ab4:	00400713          	li	a4,4
    80007ab8:	1ae78263          	beq	a5,a4,80007c5c <__memset+0x204>
    80007abc:	00b50223          	sb	a1,4(a0)
    80007ac0:	00500713          	li	a4,5
    80007ac4:	1ae78063          	beq	a5,a4,80007c64 <__memset+0x20c>
    80007ac8:	00b502a3          	sb	a1,5(a0)
    80007acc:	00700713          	li	a4,7
    80007ad0:	18e79e63          	bne	a5,a4,80007c6c <__memset+0x214>
    80007ad4:	00b50323          	sb	a1,6(a0)
    80007ad8:	00700e93          	li	t4,7
    80007adc:	00859713          	slli	a4,a1,0x8
    80007ae0:	00e5e733          	or	a4,a1,a4
    80007ae4:	01059e13          	slli	t3,a1,0x10
    80007ae8:	01c76e33          	or	t3,a4,t3
    80007aec:	01859313          	slli	t1,a1,0x18
    80007af0:	006e6333          	or	t1,t3,t1
    80007af4:	02059893          	slli	a7,a1,0x20
    80007af8:	40f60e3b          	subw	t3,a2,a5
    80007afc:	011368b3          	or	a7,t1,a7
    80007b00:	02859813          	slli	a6,a1,0x28
    80007b04:	0108e833          	or	a6,a7,a6
    80007b08:	03059693          	slli	a3,a1,0x30
    80007b0c:	003e589b          	srliw	a7,t3,0x3
    80007b10:	00d866b3          	or	a3,a6,a3
    80007b14:	03859713          	slli	a4,a1,0x38
    80007b18:	00389813          	slli	a6,a7,0x3
    80007b1c:	00f507b3          	add	a5,a0,a5
    80007b20:	00e6e733          	or	a4,a3,a4
    80007b24:	000e089b          	sext.w	a7,t3
    80007b28:	00f806b3          	add	a3,a6,a5
    80007b2c:	00e7b023          	sd	a4,0(a5)
    80007b30:	00878793          	addi	a5,a5,8
    80007b34:	fed79ce3          	bne	a5,a3,80007b2c <__memset+0xd4>
    80007b38:	ff8e7793          	andi	a5,t3,-8
    80007b3c:	0007871b          	sext.w	a4,a5
    80007b40:	01d787bb          	addw	a5,a5,t4
    80007b44:	0ce88e63          	beq	a7,a4,80007c20 <__memset+0x1c8>
    80007b48:	00f50733          	add	a4,a0,a5
    80007b4c:	00b70023          	sb	a1,0(a4)
    80007b50:	0017871b          	addiw	a4,a5,1
    80007b54:	0cc77663          	bgeu	a4,a2,80007c20 <__memset+0x1c8>
    80007b58:	00e50733          	add	a4,a0,a4
    80007b5c:	00b70023          	sb	a1,0(a4)
    80007b60:	0027871b          	addiw	a4,a5,2
    80007b64:	0ac77e63          	bgeu	a4,a2,80007c20 <__memset+0x1c8>
    80007b68:	00e50733          	add	a4,a0,a4
    80007b6c:	00b70023          	sb	a1,0(a4)
    80007b70:	0037871b          	addiw	a4,a5,3
    80007b74:	0ac77663          	bgeu	a4,a2,80007c20 <__memset+0x1c8>
    80007b78:	00e50733          	add	a4,a0,a4
    80007b7c:	00b70023          	sb	a1,0(a4)
    80007b80:	0047871b          	addiw	a4,a5,4
    80007b84:	08c77e63          	bgeu	a4,a2,80007c20 <__memset+0x1c8>
    80007b88:	00e50733          	add	a4,a0,a4
    80007b8c:	00b70023          	sb	a1,0(a4)
    80007b90:	0057871b          	addiw	a4,a5,5
    80007b94:	08c77663          	bgeu	a4,a2,80007c20 <__memset+0x1c8>
    80007b98:	00e50733          	add	a4,a0,a4
    80007b9c:	00b70023          	sb	a1,0(a4)
    80007ba0:	0067871b          	addiw	a4,a5,6
    80007ba4:	06c77e63          	bgeu	a4,a2,80007c20 <__memset+0x1c8>
    80007ba8:	00e50733          	add	a4,a0,a4
    80007bac:	00b70023          	sb	a1,0(a4)
    80007bb0:	0077871b          	addiw	a4,a5,7
    80007bb4:	06c77663          	bgeu	a4,a2,80007c20 <__memset+0x1c8>
    80007bb8:	00e50733          	add	a4,a0,a4
    80007bbc:	00b70023          	sb	a1,0(a4)
    80007bc0:	0087871b          	addiw	a4,a5,8
    80007bc4:	04c77e63          	bgeu	a4,a2,80007c20 <__memset+0x1c8>
    80007bc8:	00e50733          	add	a4,a0,a4
    80007bcc:	00b70023          	sb	a1,0(a4)
    80007bd0:	0097871b          	addiw	a4,a5,9
    80007bd4:	04c77663          	bgeu	a4,a2,80007c20 <__memset+0x1c8>
    80007bd8:	00e50733          	add	a4,a0,a4
    80007bdc:	00b70023          	sb	a1,0(a4)
    80007be0:	00a7871b          	addiw	a4,a5,10
    80007be4:	02c77e63          	bgeu	a4,a2,80007c20 <__memset+0x1c8>
    80007be8:	00e50733          	add	a4,a0,a4
    80007bec:	00b70023          	sb	a1,0(a4)
    80007bf0:	00b7871b          	addiw	a4,a5,11
    80007bf4:	02c77663          	bgeu	a4,a2,80007c20 <__memset+0x1c8>
    80007bf8:	00e50733          	add	a4,a0,a4
    80007bfc:	00b70023          	sb	a1,0(a4)
    80007c00:	00c7871b          	addiw	a4,a5,12
    80007c04:	00c77e63          	bgeu	a4,a2,80007c20 <__memset+0x1c8>
    80007c08:	00e50733          	add	a4,a0,a4
    80007c0c:	00b70023          	sb	a1,0(a4)
    80007c10:	00d7879b          	addiw	a5,a5,13
    80007c14:	00c7f663          	bgeu	a5,a2,80007c20 <__memset+0x1c8>
    80007c18:	00f507b3          	add	a5,a0,a5
    80007c1c:	00b78023          	sb	a1,0(a5)
    80007c20:	00813403          	ld	s0,8(sp)
    80007c24:	01010113          	addi	sp,sp,16
    80007c28:	00008067          	ret
    80007c2c:	00b00693          	li	a3,11
    80007c30:	e55ff06f          	j	80007a84 <__memset+0x2c>
    80007c34:	00300e93          	li	t4,3
    80007c38:	ea5ff06f          	j	80007adc <__memset+0x84>
    80007c3c:	00100e93          	li	t4,1
    80007c40:	e9dff06f          	j	80007adc <__memset+0x84>
    80007c44:	00000e93          	li	t4,0
    80007c48:	e95ff06f          	j	80007adc <__memset+0x84>
    80007c4c:	00000793          	li	a5,0
    80007c50:	ef9ff06f          	j	80007b48 <__memset+0xf0>
    80007c54:	00200e93          	li	t4,2
    80007c58:	e85ff06f          	j	80007adc <__memset+0x84>
    80007c5c:	00400e93          	li	t4,4
    80007c60:	e7dff06f          	j	80007adc <__memset+0x84>
    80007c64:	00500e93          	li	t4,5
    80007c68:	e75ff06f          	j	80007adc <__memset+0x84>
    80007c6c:	00600e93          	li	t4,6
    80007c70:	e6dff06f          	j	80007adc <__memset+0x84>

0000000080007c74 <__memmove>:
    80007c74:	ff010113          	addi	sp,sp,-16
    80007c78:	00813423          	sd	s0,8(sp)
    80007c7c:	01010413          	addi	s0,sp,16
    80007c80:	0e060863          	beqz	a2,80007d70 <__memmove+0xfc>
    80007c84:	fff6069b          	addiw	a3,a2,-1
    80007c88:	0006881b          	sext.w	a6,a3
    80007c8c:	0ea5e863          	bltu	a1,a0,80007d7c <__memmove+0x108>
    80007c90:	00758713          	addi	a4,a1,7
    80007c94:	00a5e7b3          	or	a5,a1,a0
    80007c98:	40a70733          	sub	a4,a4,a0
    80007c9c:	0077f793          	andi	a5,a5,7
    80007ca0:	00f73713          	sltiu	a4,a4,15
    80007ca4:	00174713          	xori	a4,a4,1
    80007ca8:	0017b793          	seqz	a5,a5
    80007cac:	00e7f7b3          	and	a5,a5,a4
    80007cb0:	10078863          	beqz	a5,80007dc0 <__memmove+0x14c>
    80007cb4:	00900793          	li	a5,9
    80007cb8:	1107f463          	bgeu	a5,a6,80007dc0 <__memmove+0x14c>
    80007cbc:	0036581b          	srliw	a6,a2,0x3
    80007cc0:	fff8081b          	addiw	a6,a6,-1
    80007cc4:	02081813          	slli	a6,a6,0x20
    80007cc8:	01d85893          	srli	a7,a6,0x1d
    80007ccc:	00858813          	addi	a6,a1,8
    80007cd0:	00058793          	mv	a5,a1
    80007cd4:	00050713          	mv	a4,a0
    80007cd8:	01088833          	add	a6,a7,a6
    80007cdc:	0007b883          	ld	a7,0(a5)
    80007ce0:	00878793          	addi	a5,a5,8
    80007ce4:	00870713          	addi	a4,a4,8
    80007ce8:	ff173c23          	sd	a7,-8(a4)
    80007cec:	ff0798e3          	bne	a5,a6,80007cdc <__memmove+0x68>
    80007cf0:	ff867713          	andi	a4,a2,-8
    80007cf4:	02071793          	slli	a5,a4,0x20
    80007cf8:	0207d793          	srli	a5,a5,0x20
    80007cfc:	00f585b3          	add	a1,a1,a5
    80007d00:	40e686bb          	subw	a3,a3,a4
    80007d04:	00f507b3          	add	a5,a0,a5
    80007d08:	06e60463          	beq	a2,a4,80007d70 <__memmove+0xfc>
    80007d0c:	0005c703          	lbu	a4,0(a1)
    80007d10:	00e78023          	sb	a4,0(a5)
    80007d14:	04068e63          	beqz	a3,80007d70 <__memmove+0xfc>
    80007d18:	0015c603          	lbu	a2,1(a1)
    80007d1c:	00100713          	li	a4,1
    80007d20:	00c780a3          	sb	a2,1(a5)
    80007d24:	04e68663          	beq	a3,a4,80007d70 <__memmove+0xfc>
    80007d28:	0025c603          	lbu	a2,2(a1)
    80007d2c:	00200713          	li	a4,2
    80007d30:	00c78123          	sb	a2,2(a5)
    80007d34:	02e68e63          	beq	a3,a4,80007d70 <__memmove+0xfc>
    80007d38:	0035c603          	lbu	a2,3(a1)
    80007d3c:	00300713          	li	a4,3
    80007d40:	00c781a3          	sb	a2,3(a5)
    80007d44:	02e68663          	beq	a3,a4,80007d70 <__memmove+0xfc>
    80007d48:	0045c603          	lbu	a2,4(a1)
    80007d4c:	00400713          	li	a4,4
    80007d50:	00c78223          	sb	a2,4(a5)
    80007d54:	00e68e63          	beq	a3,a4,80007d70 <__memmove+0xfc>
    80007d58:	0055c603          	lbu	a2,5(a1)
    80007d5c:	00500713          	li	a4,5
    80007d60:	00c782a3          	sb	a2,5(a5)
    80007d64:	00e68663          	beq	a3,a4,80007d70 <__memmove+0xfc>
    80007d68:	0065c703          	lbu	a4,6(a1)
    80007d6c:	00e78323          	sb	a4,6(a5)
    80007d70:	00813403          	ld	s0,8(sp)
    80007d74:	01010113          	addi	sp,sp,16
    80007d78:	00008067          	ret
    80007d7c:	02061713          	slli	a4,a2,0x20
    80007d80:	02075713          	srli	a4,a4,0x20
    80007d84:	00e587b3          	add	a5,a1,a4
    80007d88:	f0f574e3          	bgeu	a0,a5,80007c90 <__memmove+0x1c>
    80007d8c:	02069613          	slli	a2,a3,0x20
    80007d90:	02065613          	srli	a2,a2,0x20
    80007d94:	fff64613          	not	a2,a2
    80007d98:	00e50733          	add	a4,a0,a4
    80007d9c:	00c78633          	add	a2,a5,a2
    80007da0:	fff7c683          	lbu	a3,-1(a5)
    80007da4:	fff78793          	addi	a5,a5,-1
    80007da8:	fff70713          	addi	a4,a4,-1
    80007dac:	00d70023          	sb	a3,0(a4)
    80007db0:	fec798e3          	bne	a5,a2,80007da0 <__memmove+0x12c>
    80007db4:	00813403          	ld	s0,8(sp)
    80007db8:	01010113          	addi	sp,sp,16
    80007dbc:	00008067          	ret
    80007dc0:	02069713          	slli	a4,a3,0x20
    80007dc4:	02075713          	srli	a4,a4,0x20
    80007dc8:	00170713          	addi	a4,a4,1
    80007dcc:	00e50733          	add	a4,a0,a4
    80007dd0:	00050793          	mv	a5,a0
    80007dd4:	0005c683          	lbu	a3,0(a1)
    80007dd8:	00178793          	addi	a5,a5,1
    80007ddc:	00158593          	addi	a1,a1,1
    80007de0:	fed78fa3          	sb	a3,-1(a5)
    80007de4:	fee798e3          	bne	a5,a4,80007dd4 <__memmove+0x160>
    80007de8:	f89ff06f          	j	80007d70 <__memmove+0xfc>

0000000080007dec <__putc>:
    80007dec:	fe010113          	addi	sp,sp,-32
    80007df0:	00813823          	sd	s0,16(sp)
    80007df4:	00113c23          	sd	ra,24(sp)
    80007df8:	02010413          	addi	s0,sp,32
    80007dfc:	00050793          	mv	a5,a0
    80007e00:	fef40593          	addi	a1,s0,-17
    80007e04:	00100613          	li	a2,1
    80007e08:	00000513          	li	a0,0
    80007e0c:	fef407a3          	sb	a5,-17(s0)
    80007e10:	fffff097          	auipc	ra,0xfffff
    80007e14:	b3c080e7          	jalr	-1220(ra) # 8000694c <console_write>
    80007e18:	01813083          	ld	ra,24(sp)
    80007e1c:	01013403          	ld	s0,16(sp)
    80007e20:	02010113          	addi	sp,sp,32
    80007e24:	00008067          	ret

0000000080007e28 <__getc>:
    80007e28:	fe010113          	addi	sp,sp,-32
    80007e2c:	00813823          	sd	s0,16(sp)
    80007e30:	00113c23          	sd	ra,24(sp)
    80007e34:	02010413          	addi	s0,sp,32
    80007e38:	fe840593          	addi	a1,s0,-24
    80007e3c:	00100613          	li	a2,1
    80007e40:	00000513          	li	a0,0
    80007e44:	fffff097          	auipc	ra,0xfffff
    80007e48:	ae8080e7          	jalr	-1304(ra) # 8000692c <console_read>
    80007e4c:	fe844503          	lbu	a0,-24(s0)
    80007e50:	01813083          	ld	ra,24(sp)
    80007e54:	01013403          	ld	s0,16(sp)
    80007e58:	02010113          	addi	sp,sp,32
    80007e5c:	00008067          	ret

0000000080007e60 <console_handler>:
    80007e60:	fe010113          	addi	sp,sp,-32
    80007e64:	00813823          	sd	s0,16(sp)
    80007e68:	00113c23          	sd	ra,24(sp)
    80007e6c:	00913423          	sd	s1,8(sp)
    80007e70:	02010413          	addi	s0,sp,32
    80007e74:	14202773          	csrr	a4,scause
    80007e78:	100027f3          	csrr	a5,sstatus
    80007e7c:	0027f793          	andi	a5,a5,2
    80007e80:	06079e63          	bnez	a5,80007efc <console_handler+0x9c>
    80007e84:	00074c63          	bltz	a4,80007e9c <console_handler+0x3c>
    80007e88:	01813083          	ld	ra,24(sp)
    80007e8c:	01013403          	ld	s0,16(sp)
    80007e90:	00813483          	ld	s1,8(sp)
    80007e94:	02010113          	addi	sp,sp,32
    80007e98:	00008067          	ret
    80007e9c:	0ff77713          	andi	a4,a4,255
    80007ea0:	00900793          	li	a5,9
    80007ea4:	fef712e3          	bne	a4,a5,80007e88 <console_handler+0x28>
    80007ea8:	ffffe097          	auipc	ra,0xffffe
    80007eac:	6dc080e7          	jalr	1756(ra) # 80006584 <plic_claim>
    80007eb0:	00a00793          	li	a5,10
    80007eb4:	00050493          	mv	s1,a0
    80007eb8:	02f50c63          	beq	a0,a5,80007ef0 <console_handler+0x90>
    80007ebc:	fc0506e3          	beqz	a0,80007e88 <console_handler+0x28>
    80007ec0:	00050593          	mv	a1,a0
    80007ec4:	00000517          	auipc	a0,0x0
    80007ec8:	7dc50513          	addi	a0,a0,2012 # 800086a0 <CONSOLE_STATUS+0x690>
    80007ecc:	fffff097          	auipc	ra,0xfffff
    80007ed0:	afc080e7          	jalr	-1284(ra) # 800069c8 <__printf>
    80007ed4:	01013403          	ld	s0,16(sp)
    80007ed8:	01813083          	ld	ra,24(sp)
    80007edc:	00048513          	mv	a0,s1
    80007ee0:	00813483          	ld	s1,8(sp)
    80007ee4:	02010113          	addi	sp,sp,32
    80007ee8:	ffffe317          	auipc	t1,0xffffe
    80007eec:	6d430067          	jr	1748(t1) # 800065bc <plic_complete>
    80007ef0:	fffff097          	auipc	ra,0xfffff
    80007ef4:	3e0080e7          	jalr	992(ra) # 800072d0 <uartintr>
    80007ef8:	fddff06f          	j	80007ed4 <console_handler+0x74>
    80007efc:	00001517          	auipc	a0,0x1
    80007f00:	8a450513          	addi	a0,a0,-1884 # 800087a0 <digits+0x78>
    80007f04:	fffff097          	auipc	ra,0xfffff
    80007f08:	a68080e7          	jalr	-1432(ra) # 8000696c <panic>
	...
