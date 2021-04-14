.data
sensdelavie: .word 42
s: .string "le sens de la vie"

msg_neq: .asciz "les nombres ne sont pas egaux"
msg_eq:  .asciz "les nombres sont egaux"

num0_g: .word 124
num1_g: .word 256
result_g: .word 0

size_array_g: .word 8
array_g: .word 124, 256, 512, 2, 8, 4, 32, 1024

.text
la a1 sensdelavie
lw a0 (a1)
li a7 1
lw t1 0(a1)
lw t2 4(a1)
ecall #affiche 42

li a0 42
li a7 1
ecall #affiche 42

la a0 s
li a7 4
ecall #affiche le string
lb t3 0(a0)
lb t4 1(a0)

li t0 1
li t1 2
bne t0 t1 not_eq
la a0 msg_eq
j end
not_eq:
la a0 msg_neq
end:
li a7 4
ecall


la t0 num0_g
lw t1 (t0)
la t2 num1_g
lw t3 (t0)

la t4 result_g
add t5 t1 t3

sw t5 (t4)
lw a0 (t4)
li a7 1
ecall


la t0, size_array_g
lw t0, 0(t0)
la t1, array_g
lw a0 0(t1)
li a7 1
ecall
