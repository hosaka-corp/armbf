// macro.S
// Just a few macros for generating sets of instructions.

// ----------------------------------------------------------------------------
// DpRotImm
.macro DpRotImm_1 rn, imm
	cmn \rn, #\imm
	cmp \rn, #\imm
	mov \rn, #\imm
	mvn \rn, #\imm
	teq \rn, #\imm
	tst \rn, #\imm
.endm 
.macro DpRotImm_2 rd, rn, imm
	adc \rd, \rn, #\imm
	add \rd, \rn, #\imm
	and \rd, \rn, #\imm
	bic \rd, \rn, #\imm
	eor \rd, \rn, #\imm
	orr \rd, \rn, #\imm
	rsb \rd, \rn, #\imm
	rsc \rd, \rn, #\imm
	sbc \rd, \rn, #\imm
	sub \rd, \rn, #\imm
.endm


// ----------------------------------------------------------------------------
// DpShiftImm
.macro DpShiftImm_1 op, rn, rm
	\op \rn, \rm, lsl #0
	\op \rn, \rm, lsl #1
	\op \rn, \rm, lsl #2
	\op \rn, \rm, lsl #3
	\op \rn, \rm, lsr #0
	\op \rn, \rm, lsr #1
	\op \rn, \rm, lsr #2
	\op \rn, \rm, lsr #3
	\op \rn, \rm, asr #0
	\op \rn, \rm, asr #1
	\op \rn, \rm, asr #2
	\op \rn, \rm, asr #3
	\op \rn, \rm, ror #0
	\op \rn, \rm, ror #1
	\op \rn, \rm, ror #2
	\op \rn, \rm, ror #3
.endm
.macro DpShiftImm_2 rd, rn, rm, shift, imm
	adc \rd, \rn, \rm, \shift #\imm
	add \rd, \rn, \rm, \shift #\imm
	and \rd, \rn, \rm, \shift #\imm
	bic \rd, \rn, \rm, \shift #\imm
	eor \rd, \rn, \rm, \shift #\imm
	orr \rd, \rn, \rm, \shift #\imm
	rsb \rd, \rn, \rm, \shift #\imm
	rsc \rd, \rn, \rm, \shift #\imm
	sbc \rd, \rn, \rm, \shift #\imm
	sub \rd, \rn, \rm, \shift #\imm
	adc \rd, \rn, \rm, \shift #0
	add \rd, \rn, \rm, \shift #0
	and \rd, \rn, \rm, \shift #0
	bic \rd, \rn, \rm, \shift #0
	eor \rd, \rn, \rm, \shift #0
	orr \rd, \rn, \rm, \shift #0
	rsb \rd, \rn, \rm, \shift #0
	rsc \rd, \rn, \rm, \shift #0
	sbc \rd, \rn, \rm, \shift #0
	sub \rd, \rn, \rm, \shift #0
.endm


// ----------------------------------------------------------------------------
// DpShiftReg
.macro DpShiftReg_1 rn, rm, shift, rs
	cmn \rn, \rm, \shift \rs
	cmp \rn, \rm, \shift \rs
	mov \rn, \rm, \shift \rs
	mvn \rn, \rm, \shift \rs
	teq \rn, \rm, \shift \rs
	tst \rn, \rm, \shift \rs
.endm
.macro DpShiftReg_2 rd, rn, rm, shift, rs
	adc \rd, \rn, \rm, \shift \rs
	add \rd, \rn, \rm, \shift \rs
	and \rd, \rn, \rm, \shift \rs
	bic \rd, \rn, \rm, \shift \rs
	eor \rd, \rn, \rm, \shift \rs
	orr \rd, \rn, \rm, \shift \rs
	rsb \rd, \rn, \rm, \shift \rs
	rsc \rd, \rn, \rm, \shift \rs
	sbc \rd, \rn, \rm, \shift \rs
	sub \rd, \rn, \rm, \shift \rs
.endm


// ----------------------------------------------------------------------------
// Status register
.macro MsrImm imm
	msr cpsr_c, #\imm
	msr cpsr_x, #\imm
	msr cpsr_f, #\imm
	msr cpsr_s, #\imm
	msr spsr_c, #\imm
	msr spsr_x, #\imm
	msr spsr_f, #\imm
	msr spsr_s, #\imm
.endm
.macro MsrReg r
	msr cpsr_c, \r
	msr cpsr_x, \r
	msr cpsr_f, \r
	msr cpsr_s, \r
	msr spsr_c, \r
	msr spsr_x, \r
	msr spsr_f, \r
	msr spsr_s, \r
.endm
.macro MrsReg r
	mrs \r, cpsr
	mrs \r, spsr
.endm


// ----------------------------------------------------------------------------
// Branching
.macro BranchImm label
	b \label
	bl \label
	blx \label
.endm
.macro BranchReg r
	bx \r
	blx \r
.endm

// ----------------------------------------------------------------------------
// Load/store

.macro LsImm rd, rn, imm12
	ldr \rd, [\rn, #\imm12]
	ldrb \rd, [\rn, #\imm12]
	str \rd, [\rn, #\imm12]
	strb \rd, [\rn, #\imm12]

	ldr \rd, [\rn, #\imm12]!
	ldrb \rd, [\rn, #\imm12]!
	str \rd, [\rn, #\imm12]!
	strb \rd, [\rn, #\imm12]!

	ldr \rd, [\rn], #\imm12
	str \rd, [\rn], #\imm12
	ldrb \rd, [\rn], #\imm12
	strb \rd, [\rn], #\imm12
.endm


.macro LsShift rd, rn, rm
	ldr \rd, [\rn, \rm]
	ldrb \rd, [\rn, \rm]
	str \rd, [\rn, \rm]
	strb \rd, [\rn, \rm]

	ldr \rd, [\rn, \rm]!
	ldrb \rd, [\rn, \rm]!
	str \rd, [\rn, \rm]!
	strb \rd, [\rn, \rm]!

	ldr \rd, [\rn], \rm
	ldrb \rd, [\rn], \rm
	str \rd, [\rn], \rm
	strb \rd, [\rn], \rm
.endm

.macro LsShiftScaled rd, rn, rm, shift, shift_imm
	ldr \rd, [\rn, \rm, \shift #\shift_imm]
	ldrb \rd, [\rn, \rm, \shift #\shift_imm]
	str \rd, [\rn, \rm, \shift #\shift_imm]
	strb \rd, [\rn, \rm, \shift #\shift_imm]
	str \rd, [\rn, \rm, \shift #0]

	ldr \rd, [\rn, \rm, \shift #\shift_imm]!
	ldrb \rd, [\rn, \rm, \shift #\shift_imm]!
	str \rd, [\rn, \rm, \shift #\shift_imm]!
	strb \rd, [\rn, \rm, \shift #\shift_imm]!
	str \rd, [\rn, \rm, \shift #0]!

	ldr \rd, [\rn], \rm, \shift #\shift_imm
	ldrb \rd, [\rn], \rm, \shift #\shift_imm
	str \rd, [\rn], \rm, \shift #\shift_imm
	strb \rd, [\rn], \rm, \shift #\shift_imm
	str \rd, [\rn], \rm, \shift #0
.endm

.macro LsMiscImm rd, rn, imm
	ldrh \rd, [\rn, #\imm]
	ldrd \rd, [\rn, #\imm]
	ldrsh \rd, [\rn, #\imm]
	ldrsb \rd, [\rn, #\imm]
	strh \rd, [\rn, #\imm]
	strd \rd, [\rn, #\imm]

	ldrh \rd, [\rn, #\imm]!
	ldrd \rd, [\rn, #\imm]!
	ldrsh \rd, [\rn, #\imm]!
	ldrsb \rd, [\rn, #\imm]!
	strh \rd, [\rn, #\imm]!
	strd \rd, [\rn, #\imm]!

	ldrh \rd, [\rn], #\imm
	ldrsh \rd, [\rn], #\imm
	ldrsb \rd, [\rn], #\imm
	ldrd \rd, [\rn], #\imm
	strh \rd, [\rn], #\imm
	strd \rd, [\rn], #\imm
.endm

.macro LsMiscReg rd, rn, rm
	ldrh \rd, [\rn, \rm]
	strh \rd, [\rn, \rm]

	ldrh \rd, [\rn, \rm]!
	strh \rd, [\rn, \rm]!

	ldrh \rd, [\rn], \rm
	strh \rd, [\rn], \rm
.endm


