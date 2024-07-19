#!/bin/bash

# Deploy the smart contract
cardano-cli transaction build-raw \
    --tx-in <UTXO> \
    --tx-out <ADDRESS>+<AMOUNT> \
    --fee <FEE> \
    --out-file tx.raw

cardano-cli transaction sign \
    --signing-key-file <SIGNING_KEY> \
    --tx-body-file tx.raw \
    --out-file tx.signed

cardano-cli transaction submit \
    --tx-file tx.signed
