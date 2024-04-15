@ Subtraction program
MOV r1, #20      @ Load value 20 into register r1
MOV r2, #10       @ Load value 10 into register r2
SUB r0, r2, r1   @ Subtract value in r1 from r2 and store result in r0 (10)
@ The result will be -10, indicated as 4294967286 in 32-bit unsigned integer (or 0xFFFFFFF6 in hexadecimal)
@ R13 is usually used as a stack pointer, while R15 is the programme counter, pointing to the next instruction to be executed. Therefore, the exact meaning of these values depends on the context of the programme and what is happening during execution.