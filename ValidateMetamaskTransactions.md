# Validate Metamask Transaction

-   By using the below steps we can validate transactions in Metamask

1. Check the address
2. Check the function selector

```sh
cast sig "functionName("args1", "args2")"
```

3. decode the calldata

```sh
cast --caldata-decode "functionName("args1", "args2")" "0x9d61d2340000000000000000000000007b96af9bd211cbf6ba5b0dd53aa61dc5806b6ace000000000000000000000000000000000000000000000000000000000000007b"
```

It will print out  
args1 = ........  
args2 = ........

---
