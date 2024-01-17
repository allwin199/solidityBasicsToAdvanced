Whenever we compile our smart contract it will be compiled to EVM compatible code
(Ethereum Virtual Machine)

# Contract Compilation

Whenver a contract is deployed. 2 files will be generated `contract.abi` and `contract.bin`

![Compile Contract](./Advanced/images/1-compiled.png)

`contract.bin` will contain fields such as `object` and `opcodes`  
Object -> will contain the binary of the contract.  
Opcodes -> will contain the exact opcodes.

When we deploy a contract.
`contract.bin` is sent to the blockchain

---

# Transaction Fields

![Transaction Fields](./Advanced/images/2-transaction-fields.png)

-   When we deploy a contract, `data` field will be populated with `contract init code`and`contract byte code`
-   To field will be empty

![Contract Deployment](./Advanced/images/5-contract-deployment.png)

-   EVM will read the opcodes

# Function Calls

-   When we make a function call to the deployed contract
-   `data` field will be populated with function's `MethodId`
-   By seeing the `methodId` EVM knows which method to call

![Function Call](./Advanced/images/6-function-call.png)

# Sending ETH

-   When we send ETH To a contract
-   `data` field will be left empty

![Sending ETH](./Advanced/images/7-value-transfer.png)
