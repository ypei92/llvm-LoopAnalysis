//===- Hello.cpp - Example code from "Writing an LLVM Pass" ---------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file implements two versions of the LLVM "Hello World" pass described
// in docs/WritingAnLLVMPass.html
//
//===----------------------------------------------------------------------===//

#include "llvm/ADT/Statistic.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
#include <map>
using namespace llvm;

#define DEBUG_TYPE "loop-props"

STATISTIC(LoopCounter, "Counts number of loops greeted");

namespace {

    struct YourLoopAnalysis : public LoopPass {
        static char ID; // Pass identification, replacement for typeid
        YourLoopAnalysis() : LoopPass(ID) {}

        struct LoopNode {
            int num_bbs;
            int num_instrs;
            int num_atomics;
            int num_branches;
 
            LoopNode(){}
            LoopNode(int a = 0 , int b = 0 , int c = 0 , int d = 0) {
                num_bbs = a;
                num_instrs = b;
                num_atomics = c;
                num_branches = d;
            }
        };
        // std::map<Loop*, LoopNode> LoopData

        LoopNode processLoop(Loop* L) {
            unsigned int i = 0;
            int instrs = 0 , atomics = 0 , branches = 0;
            int BBs = L->getBlocks().size();

            std::vector< BasicBlock *> blocks = L->getBlocks();
            for( i = 0 ; i < blocks.size() ; i ++) {
                BasicBlock::InstListType& instlist = blocks[i]->getInstList();
                instrs += instlist.size();

                for( auto& I : instlist){
                    if(I.isAtomic())
                        atomics++;
                    if(isa<BranchInst> (I))
                        branches++;
                }
            }

            LoopNode tmp(BBs,instrs,atomics,branches);
            return tmp;
        }

        bool runOnLoop(Loop *L, LPPassManager &LPM) override {

            Loop *tmpLoop;
            unsigned int i = 0;
/*---------------------------Function------------------------------*/

            BasicBlock* funcblock = L->getHeader();
            Function* F = funcblock->getParent();

/*----------------------------DEPTH--------------------------------*/

            int depth = 0;
            for ( tmpLoop = L->getParentLoop() ; tmpLoop ; tmpLoop = tmpLoop->getParentLoop()) {
                depth ++;
            }

/*---------------BBs INSTRUCTIONS ATOMICS BRANCHES-----------------*/
            
            LoopNode loopdata = processLoop(L);
            std::vector<llvm::Loop*> subloops = L->getSubLoops();
            for ( i = 0 ; i < subloops.size() ; i ++) {
                LoopNode tmp = processLoop(subloops[i]);

                loopdata.num_bbs -= tmp.num_bbs;
                loopdata.num_branches -= tmp.num_branches;
            }

/*---------------------------OUTPUTS-------------------------------*/            
            errs() << LoopCounter++
                   << ": func=" << F->getName()
                   << ", depth=" << depth 
                   << ", subLoops=" << ((L->empty())?"false":"true") 
                   << ", BBs=" << loopdata.num_bbs  
                   << ", instrs=" << loopdata.num_instrs
                   << ", atomics=" << loopdata.num_atomics
                   << ", branches=" << loopdata.num_branches
                   << "\n" ;
            return false;
        }

        void getAnalysisUsage(AnalysisUsage &AU) const override {
            AU.setPreservesAll();
        }
    };
}

char YourLoopAnalysis::ID = 0;
static RegisterPass<YourLoopAnalysis> X("loop-props", "LoopAnalysis pass from F&M");
