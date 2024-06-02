module Vespa();

// 
reg [31:0] registerFile [31:0];
reg [7:0] memory [8912:0]; 
reg [31:0] instructionRegister;
reg [31:0] programCounter;
reg [32:0] result;
reg [31:0] destinationRegisterData;
reg [31:0] sourceRegister1Data;
reg [31:0] sourceRegister2Data;
reg run;

//flags
reg negativeFlag;
reg zeroFlag;
reg carryFlag;
reg overflowFlag;

//opcode
`define NOP 'd0
`define ADD 'd1
`define SUB 'd2
`define OR 'd3
`define AND 'd4
`define NOT 'd5
`define XOR 'd6
`define CMP 'd7
`define BXX 'd8
`define JMP 'd9
`define LDD 'd10
`define LDI 'd11
`define LDX 'd12
`define STD 'd13
`define STX 'd14
`define HLT 'd31

//condition code
`define BRA 4'b0000
`define BCC 4'b0001
`define BVC 4'b0010
`define BEQ 4'b0011
`define BGE 4'b0100
`define BGT 4'b0101
`define BPL 4'b0110
`define BNV 4'b1000
`define BCS 4'b1001
`define BVS 4'b1010
`define BNE 4'b1011
`define BLT 4'b1100
`define BLE 4'b1101
`define BMI 4'b1110

//opcode specification
`define opcode instructionRegister[31:27]
`define destinationRegisterAddress instructionRegister[26:22]
`define sourceRegister1Address instructionRegister[21:17]
`define immediateMode instructionRegister[16]
`define sourceRegister2Address instructionRegister[15:11]
`define conditionCode instructionRegister[26:23]
`define immediate11 instructionRegister[10:0]
`define immediate16 instructionRegister[15:0]
`define immediate22 instructionRegister[21:0]
`define immediate23 instructionRegister[22:0]

task fetch;
begin
  instructionRegister=readMem(programCounter);
  programCounter=programCounter+4;
end
endtask

task execute;
begin
  case(`opcode)
    `NOP:begin
    end
    `ADD:begin
      if(`immediateMode==1)begin
        sourceRegister2Data=signExtend16To32(`immediate16);
      end
      else begin
        sourceRegister2Data=registerFile[`sourceRegister2Address];
      end
      sourceRegister1Data=registerFile[`sourceRegister1Address];
      result=sourceRegister1Data+sourceRegister2Data;
      registerFile[`destinationRegisterAddress]=result[31:0];
      setFlags(result,sourceRegister1Data,sourceRegister2Data,0);
    end
    `SUB:begin
     if(`immediateMode==1)begin
        sourceRegister2Data=signExtend16To32(`immediate16);
      end
      else begin
        sourceRegister2Data=registerFile[`sourceRegister2Address];
      end
      sourceRegister1Data=registerFile[`sourceRegister1Address];
      result=sourceRegister1Data-sourceRegister2Data;
      registerFile[`destinationRegisterAddress]=result[31:0];
      setFlags(result,sourceRegister1Data,sourceRegister2Data,1);
    end
    `OR:begin
      if(`immediateMode==1)begin
        sourceRegister2Data=signExtend16To32(`immediate16);
      end
      else begin
        sourceRegister2Data=registerFile[`sourceRegister2Address];
      end
      sourceRegister1Data=registerFile[`sourceRegister1Address];
      result[31:0]=sourceRegister1Data|sourceRegister2Data;
      registerFile[`destinationRegisterAddress]=result[31:0];
    end
    `AND:begin
      if(`immediateMode==1)begin
        sourceRegister2Data=signExtend16To32(`immediate16);
      end
      else begin
        sourceRegister2Data=registerFile[`sourceRegister2Address];
      end
      sourceRegister1Data=registerFile[`sourceRegister1Address];
      result[31:0]=sourceRegister1Data&sourceRegister2Data;
      registerFile[`destinationRegisterAddress]=result[31:0];
    end
    `XOR:begin
      if(`immediateMode==1)begin
        sourceRegister2Data=signExtend16To32(`immediate16);
      end
      else begin
        sourceRegister2Data=registerFile[`sourceRegister2Address];
      end
      sourceRegister1Data=registerFile[`sourceRegister1Address];
      result[31:0]=sourceRegister1Data^sourceRegister2Data;
      registerFile[`destinationRegisterAddress]=result[31:0];
    end
    `NOT:begin
      sourceRegister1Data=registerFile[`sourceRegister1Address];
      result[31:0]=~sourceRegister1Data;
      registerFile[`destinationRegisterAddress]=result[31:0];
    end
    `JMP:begin
      if(`immediateMode==1)begin
        destinationRegisterData=registerFile[`destinationRegisterAddress];
      end
      sourceRegister1Data=registerFile[`sourceRegister1Address];
      programCounter=sourceRegister1Data+signExtend16To32(`immediate16);
    end
    `CMP:begin
      if(`immediateMode==1)begin
        sourceRegister2Data=signExtend16To32(`immediate16);
      end
      else begin
        sourceRegister2Data=registerFile[`sourceRegister2Address];
      end
      sourceRegister1Data=registerFile[`sourceRegister1Address];
      result=sourceRegister1Data-sourceRegister2Data;
      setFlags(result,sourceRegister1Data,sourceRegister2Data,1);
    end
    `BXX:begin
      if(setConditionCode(negativeFlag,zeroFlag,carryFlag,overflowFlag)==1)begin
        programCounter=programCounter+signExtend23To32(`immediate23);
      end
    end
    `LDD:begin
     registerFile[`destinationRegisterAddress]=readMem(signExtend22To32(`immediate22)); 
    end
    `LDI:begin
      registerFile[`destinationRegisterAddress]=signExtend22To32(`immediate22);
    end
    `LDX:begin
      registerFile[`destinationRegisterAddress]=readMem(registerFile[`destinationRegisterAddress]+signExtend22To32(`immediate22));
    end
    `STD:begin
      writeMem(signExtend22To32(`immediate22),registerFile[`destinationRegisterAddress]);
    end
    `STX:begin
      writeMem(registerFile[`destinationRegisterAddress]+signExtend22To32(`immediate22),registerFile[`destinationRegisterAddress]);
    end
    `HLT:begin
      run=0;
    end
    default:begin
      $display("opcde not available");
    end
  endcase
end
endtask

function [31:0] readMem(input[31:0] addr);
begin
  readMem={memory[addr],memory[addr+1],memory[addr+2],memory[addr+3]};
end
endfunction

task writeMem(input[31:0] addr,data);
begin
  {memory[addr],memory[addr+1],memory[addr+2],memory[addr+3]}=data;
end
endtask


task setFlags(input [32:0] result,input [31:0] operand1,operand2,input subtraction); 
begin
  negativeFlag=result[31];
  carryFlag=result[32];
  zeroFlag=~(|result[31:0]);
  overflowFlag=(result[31]&~operand1[31]&~(subtraction^operand2[31]))|(~result[31]&operand1[31]&(subtraction^operand2[31]));
end
endtask

function setConditionCode(input negativeFlag,zeroFlag,carryFlag,overflowFlag);
begin
  case(`conditionCode)
    `BRA:begin
      setConditionCode=1;
    end
    `BCC:begin
      setConditionCode=~carryFlag;
    end
    `BVC:begin
      setConditionCode=~overflowFlag; 
    end
    `BEQ:begin
      setConditionCode=zeroFlag;
    end
    `BGE:begin
      setConditionCode=(~negativeFlag & ~overflowFlag)|(negativeFlag & overflowFlag);
    end
    `BGT:begin
      setConditionCode=~zeroFlag & ((~negativeFlag&~overflowFlag)|(negativeFlag&overflowFlag));
    end
    `BPL:begin
      setConditionCode=~negativeFlag;
    end
    `BNV:begin
      setConditionCode=0;
    end
    `BCS:begin
      setConditionCode=carryFlag;
    end
    `BVS:begin
      setConditionCode=overflowFlag;
    end
    `BNE:begin 
      setConditionCode=~zeroFlag;
    end
    `BLT:begin
      setConditionCode=(negativeFlag & ~overflowFlag)|(~negativeFlag & overflowFlag);
    end
    `BLE:begin
      setConditionCode=zeroFlag|((negativeFlag&~overflowFlag)|(~negativeFlag&overflowFlag));
    end
    `BMI:begin
      setConditionCode=negativeFlag;
    end
    default:$display("condition not found");
  endcase
end
endfunction

function [31:0] signExtend11To32(input [10:0] data);
begin
  signExtend11To32={{(32-11){data[10]}},data};
end
endfunction

function [31:0] signExtend16To32(input [15:0] data);
begin
  signExtend16To32={{(32-16){data[15]}},data};
end
endfunction

function [31:0] signExtend22To32(input [21:0] data);
begin
  signExtend22To32={{(32-22){data[21]}},data};
end
endfunction

function [31:0] signExtend23To32(input [22:0] data);
begin
  signExtend23To32={{(32-23){data[22]}},data};
end
endfunction

integer instruction;
initial begin
  $readmemh("program.o",memory);
  run=1;
  while(run==1)begin
    fetch;
    execute;
    $display("Instruction:%d,programCounter:%h opcode:%d,\n",instruction,programCounter,`opcode);
    instruction=instruction+1;
  end
  $finish;
end
endmodule
