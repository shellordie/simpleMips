Simple and inefficient MIPS  processor
---

## registers and memory
- [31:0]registerFile[31:0] 
- [7:0]memory[8912:0]

## Opcode

- NOP 'd0      
- ADD 'd1  
- SUB 'd2
- OR 'd3
- AND 'd4
- NOT 'd5
- XOR 'd6
- CMP 'd7
- BXX 'd8
- JMP 'd9
- LDD 'd10
- LDI 'd11
- LDX 'd12
- STD 'd13
- STX 'd14
- HLT 'd31

## condition code

- BRA 4'b0000
- BCC 4'b0001
- BVC 4'b0010
- BEQ 4'b0011
- BGE 4'b0100
- BGT 4'b0101
- BPL 4'b0110
- BNV 4'b1000
- BCS 4'b1001
- BVS 4'b1010
- BNE 4'b1011
- BLT 4'b1100
- BLE 4'b1101
- BMI 4'b1110

## flags

- negativeFlag;
- zeroFlag;
- carryFlag;
- overflowFlag;

## program asm

```bash
ld r0,count ; load the value of count into r0
ldi r1,#0 ; initialize r1 to 0
back: 
    add r1,r1,#1 ; add one to the value in r1
    cmp r1,r0 ; compare iteration number (r1) to count (r0)
    ble back ; loop if r1 <= r0
    hlt ; otherwise, stop execution
count:
    .word 0xA
```

## run

```bash
git clone https://github.com/shellordie/simpleMips.git 
```

```bash
make
```

