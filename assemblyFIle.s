	.section	__TEXT,__text,regular,pure_instructions
    .global _main

_main:
	.cfi_startproc
    ## %bb.0:
    pushl    %ebp
    .cfi_def_cfa_offset 8
    .cfi_offset %ebp, -8
    movl    %esp, %ebp
    .cfi_def_cfa_register %ebp
    pushl    %eax
    movl    $0, -4(%ebp)
    movl    $2, %eax
    addl    $4, %esp
    popl    %ebp
    retl
    .cfi_endproc
