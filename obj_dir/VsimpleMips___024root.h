// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See VsimpleMips.h for the primary calling header

#ifndef VERILATED_VSIMPLEMIPS___024ROOT_H_
#define VERILATED_VSIMPLEMIPS___024ROOT_H_  // guard

#include "verilated.h"


class VsimpleMips__Syms;

class alignas(VL_CACHE_LINE_BYTES) VsimpleMips___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    CData/*0:0*/ simpleMips__DOT__negativeFlag;
    CData/*0:0*/ simpleMips__DOT__zeroFlag;
    CData/*0:0*/ simpleMips__DOT__carryFlag;
    CData/*0:0*/ simpleMips__DOT__overflowFlag;
    CData/*7:0*/ simpleMips__DOT____Vlvbound_h0fe81f4f__0;
    CData/*7:0*/ simpleMips__DOT____Vlvbound_haef4349b__0;
    CData/*7:0*/ simpleMips__DOT____Vlvbound_haef4846a__0;
    CData/*7:0*/ simpleMips__DOT____Vlvbound_haef494f9__0;
    CData/*0:0*/ __VactContinue;
    IData/*31:0*/ simpleMips__DOT__instructionRegister;
    IData/*31:0*/ simpleMips__DOT__programCounter;
    IData/*31:0*/ simpleMips__DOT__sourceRegister1Data;
    IData/*31:0*/ simpleMips__DOT__sourceRegister2Data;
    IData/*31:0*/ simpleMips__DOT__instruction;
    IData/*31:0*/ __VactIterCount;
    QData/*32:0*/ simpleMips__DOT__result;
    VlUnpacked<IData/*31:0*/, 32> simpleMips__DOT__registerFile;
    VlUnpacked<CData/*7:0*/, 8913> simpleMips__DOT__memory;
    VlTriggerVec<0> __VactTriggered;
    VlTriggerVec<0> __VnbaTriggered;

    // INTERNAL VARIABLES
    VsimpleMips__Syms* const vlSymsp;

    // CONSTRUCTORS
    VsimpleMips___024root(VsimpleMips__Syms* symsp, const char* v__name);
    ~VsimpleMips___024root();
    VL_UNCOPYABLE(VsimpleMips___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
