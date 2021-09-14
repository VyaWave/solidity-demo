pragma solidity =0.6.6;

import "./console.sol";

contract Hello {
    constructor() public {}


    uint256 private xue =
        uint256(uint160(0xcC15300c0688c6f75782C92a4487a5A4D6100F7b));

    uint256 private jia =
        uint256(uint160(0xd02c8efA8d20c55F163bA165e70d271DDaB8DBF4));

    uint256 private difference;

    function hello() public pure returns (string memory) {
        return "Hello Blockchain World";
    }

    function echoAddress() public returns (uint256 memory) {

      difference = jia - xue;

      log(" ===== xue ==== ", xue );

      log(" ===== jia ==== ", jia );

      log(" ===== diff ==== ", jia );

      return difference;

    }

}
