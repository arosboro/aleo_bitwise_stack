# aleo_bitwise_stack.aleo
A basic stack implementation utilizing a little-endian u32 buffer.

## Build Guide

To compile this Aleo program, run:
```bash
leo build
```

        Leo Compiled 'main.leo' into Aleo instructions
    ⏳ Compiling 'aleo_bitwise_stack.aleo'...

    • Loaded universal setup (in 51 ms)
    • Built 'main' (in 14851 ms)
    • Built 'push' (in 28878 ms)
    • Built 'pop' (in 30007 ms)
    • Built 'peek' (in 25034 ms)
    • Built 'slice_to_recipient' (in 49105 ms)
    • Built 'empty' (in 24245 ms)

        Leo ✅ Built 'aleo_bitwise_stack.aleo' 


```
leo run main 4u32 8u32 
       Leo Compiled 'main.leo' into Aleo instructions
       Leo ✅ Built 'aleo_bitwise_stack.aleo' (in "/Users/arosboro/git/aleo_bitwise_stack/build")

🚀 Executing 'aleo_bitwise_stack.aleo/main'...

 • Executing 'aleo_bitwise_stack.aleo/main'...
 • Executed 'main' (in 4200 ms)

⛓  Constraints

 •  'aleo_bitwise_stack.aleo/main' - 2,009 constraints (called 1 time)

➡️  Output

 • {
  owner: aleo1g7lprd8dkrt76jnyrgnw4mw0cpe2u4ckkajs96wqu8xyggze6v8qlegxp3.private,
  gates: 0u64.private,
  capacity: 4u32.private,
  top: 0u32.private,
  member_size: 8u32.private,
  buffer: 0u32.private,
  _nonce: 6232693666239414716412615658553314473366339781511532030482850656023849106313group.public
}

       Leo ✅ Executed 'aleo_bitwise_stack.aleo/main' (in "/Users/arosboro/git/aleo_bitwise_stack/build")
arosboro@Andrews-iMac stack % leo run push 14u32 "{
  owner: aleo1g7lprd8dkrt76jnyrgnw4mw0cpe2u4ckkajs96wqu8xyggze6v8qlegxp3.private,
  gates: 0u64.private,
  capacity: 4u32.private,
  top: 0u32.private,
  member_size: 8u32.private,
  buffer: 0u32.private,
  _nonce: 6232693666239414716412615658553314473366339781511532030482850656023849106313group.public
}"
       Leo Compiled 'main.leo' into Aleo instructions
       Leo ✅ Built 'aleo_bitwise_stack.aleo' (in "/Users/arosboro/git/aleo_bitwise_stack/build")

🚀 Executing 'aleo_bitwise_stack.aleo/push'...

 • Executing 'aleo_bitwise_stack.aleo/push'...
 • Executed 'push' (in 7942 ms)

⛓  Constraints

 •  'aleo_bitwise_stack.aleo/push' - 20,012 constraints (called 1 time)

➡️  Output

 • {
  owner: aleo1g7lprd8dkrt76jnyrgnw4mw0cpe2u4ckkajs96wqu8xyggze6v8qlegxp3.private,
  gates: 0u64.private,
  capacity: 4u32.private,
  top: 1u32.private,
  member_size: 8u32.private,
  buffer: 14u32.private,
  _nonce: 1402984380099206415781046278437520664249035316169314811568428614100809311902group.public
}
arosboro@Andrews-iMac stack % leo run push 6u32 "{
  owner: aleo1g7lprd8dkrt76jnyrgnw4mw0cpe2u4ckkajs96wqu8xyggze6v8qlegxp3.private,
  gates: 0u64.private,
  capacity: 4u32.private,
  top: 1u32.private,
  member_size: 8u32.private,
  buffer: 14u32.private,
  _nonce: 1402984380099206415781046278437520664249035316169314811568428614100809311902group.public
}"
       Leo Compiled 'main.leo' into Aleo instructions
       Leo ✅ Built 'aleo_bitwise_stack.aleo' (in "/Users/arosboro/git/aleo_bitwise_stack/build")

🚀 Executing 'aleo_bitwise_stack.aleo/push'...

 • Executing 'aleo_bitwise_stack.aleo/push'...
 • Executed 'push' (in 8677 ms)

⛓  Constraints

 •  'aleo_bitwise_stack.aleo/push' - 20,012 constraints (called 1 time)

➡️  Output

 • {
  owner: aleo1g7lprd8dkrt76jnyrgnw4mw0cpe2u4ckkajs96wqu8xyggze6v8qlegxp3.private,
  gates: 0u64.private,
  capacity: 4u32.private,
  top: 2u32.private,
  member_size: 8u32.private,
  buffer: 3590u32.private,
  _nonce: 2902171322731718069531241824355285800234743099931478470396903658923388147506group.public
}

       Leo ✅ Executed 'aleo_bitwise_stack.aleo/push' (in "/Users/arosboro/git/aleo_bitwise_stack/build")
arosboro@Andrews-iMac stack % leo run push 10u32 "{
  owner: aleo1g7lprd8dkrt76jnyrgnw4mw0cpe2u4ckkajs96wqu8xyggze6v8qlegxp3.private,
  gates: 0u64.private,
  capacity: 4u32.private,
  top: 2u32.private,
  member_size: 8u32.private,
  buffer: 3590u32.private,
  _nonce: 2902171322731718069531241824355285800234743099931478470396903658923388147506group.public
}"
       Leo Compiled 'main.leo' into Aleo instructions
       Leo ✅ Built 'aleo_bitwise_stack.aleo' (in "/Users/arosboro/git/aleo_bitwise_stack/build")

🚀 Executing 'aleo_bitwise_stack.aleo/push'...

 • Executing 'aleo_bitwise_stack.aleo/push'...
 • Executed 'push' (in 8130 ms)

⛓  Constraints

 •  'aleo_bitwise_stack.aleo/push' - 20,012 constraints (called 1 time)

➡️  Output

 • {
  owner: aleo1g7lprd8dkrt76jnyrgnw4mw0cpe2u4ckkajs96wqu8xyggze6v8qlegxp3.private,
  gates: 0u64.private,
  capacity: 4u32.private,
  top: 3u32.private,
  member_size: 8u32.private,
  buffer: 919050u32.private,
  _nonce: 7532877925017931080115694065223892563782933998235685085525790516845194354862group.public
}
arosboro@Andrews-iMac stack % leo run pop "{
  owner: aleo1g7lprd8dkrt76jnyrgnw4mw0cpe2u4ckkajs96wqu8xyggze6v8qlegxp3.private,
  gates: 0u64.private,
  capacity: 4u32.private,
  top: 3u32.private,
  member_size: 8u32.private,
  buffer: 919050u32.private,
  _nonce: 7532877925017931080115694065223892563782933998235685085525790516845194354862group.public
}"
       Leo Compiled 'main.leo' into Aleo instructions
       Leo ✅ Built 'aleo_bitwise_stack.aleo' (in "/Users/arosboro/git/aleo_bitwise_stack/build")

🚀 Executing 'aleo_bitwise_stack.aleo/pop'...

 • Executing 'aleo_bitwise_stack.aleo/pop'...
 • Executed 'pop' (in 7396 ms)

⛓  Constraints

 •  'aleo_bitwise_stack.aleo/pop' - 11,133 constraints (called 1 time)

➡️  Outputs

 • 10u32
 • {
  owner: aleo1g7lprd8dkrt76jnyrgnw4mw0cpe2u4ckkajs96wqu8xyggze6v8qlegxp3.private,
  gates: 0u64.private,
  capacity: 4u32.private,
  top: 2u32.private,
  member_size: 8u32.private,
  buffer: 3590u32.private,
  _nonce: 4072934003807954081975123936033437204948825914569981899596097866017798777816group.public
}
arosboro@Andrews-iMac stack % leo run pop "{
  owner: aleo1g7lprd8dkrt76jnyrgnw4mw0cpe2u4ckkajs96wqu8xyggze6v8qlegxp3.private,
  gates: 0u64.private,
  capacity: 4u32.private,
  top: 2u32.private,
  member_size: 8u32.private,
  buffer: 3590u32.private,
  _nonce: 4072934003807954081975123936033437204948825914569981899596097866017798777816group.public
}"
       Leo Compiled 'main.leo' into Aleo instructions
       Leo ✅ Built 'aleo_bitwise_stack.aleo' (in "/Users/arosboro/git/aleo_bitwise_stack/build")

🚀 Executing 'aleo_bitwise_stack.aleo/pop'...

 • Executing 'aleo_bitwise_stack.aleo/pop'...
 • Executed 'pop' (in 7432 ms)

⛓  Constraints

 •  'aleo_bitwise_stack.aleo/pop' - 11,133 constraints (called 1 time)

➡️  Outputs

 • 6u32
 • {
  owner: aleo1g7lprd8dkrt76jnyrgnw4mw0cpe2u4ckkajs96wqu8xyggze6v8qlegxp3.private,
  gates: 0u64.private,
  capacity: 4u32.private,
  top: 1u32.private,
  member_size: 8u32.private,
  buffer: 14u32.private,
  _nonce: 4565832246887087904236412712240455176061328658667229868960290019575880628666group.public
}

       Leo ✅ Executed 'aleo_bitwise_stack.aleo/pop' (in "/Users/arosboro/git/aleo_bitwise_stack/build")
arosboro@Andrews-iMac stack % leo run pop "{
  owner: aleo1g7lprd8dkrt76jnyrgnw4mw0cpe2u4ckkajs96wqu8xyggze6v8qlegxp3.private,
  gates: 0u64.private,
  capacity: 4u32.private,
  top: 1u32.private,
  member_size: 8u32.private,
  buffer: 14u32.private,
  _nonce: 4565832246887087904236412712240455176061328658667229868960290019575880628666group.public
}"
       Leo Compiled 'main.leo' into Aleo instructions
       Leo ✅ Built 'aleo_bitwise_stack.aleo' (in "/Users/arosboro/git/aleo_bitwise_stack/build")

🚀 Executing 'aleo_bitwise_stack.aleo/pop'...

 • Executing 'aleo_bitwise_stack.aleo/pop'...
 • Executed 'pop' (in 7348 ms)

⛓  Constraints

 •  'aleo_bitwise_stack.aleo/pop' - 11,133 constraints (called 1 time)

➡️  Outputs

 • 14u32
 • {
  owner: aleo1g7lprd8dkrt76jnyrgnw4mw0cpe2u4ckkajs96wqu8xyggze6v8qlegxp3.private,
  gates: 0u64.private,
  capacity: 4u32.private,
  top: 0u32.private,
  member_size: 8u32.private,
  buffer: 0u32.private,
  _nonce: 6768121700944294154598382970661755071661929006452140204038799918117711604168group.public
}

       Leo ✅ Executed 'aleo_bitwise_stack.aleo/pop' (in "/Users/arosboro/git/aleo_bitwise_stack/build")
```