pragma solidity =0.6.6;

import "./console.sol";
pragma solidity =0.6.6;

import "./console.sol";

contract Hello is Console {
    constructor() public {}


    uint256 private xue =
        uint256(uint160(0xcC15300c0688c6f75782C92a4487a5A4D6100F7b));

    uint256 private jia =
        uint256(uint160(0xd02c8efA8d20c55F163bA165e70d271DDaB8DBF4));

    uint256 private difference;

    function hello() public pure returns (uint256) {
        // return "Hello Blockchain World";
         return uint256(uint160(0xcC15300c0688c6f75782C92a4487a5A4D6100F7b));
    }

    function echoXue() public pure returns( uint256) {

        return uint256(uint160(0xcC15300c0688c6f75782C92a4487a5A4D6100F7b));

    }

    function echoJia() public pure  returns(uint256) {
        return uint256(uint160(0xd02c8efA8d20c55F163bA165e70d271DDaB8DBF4));
    }

    function echoAddress() public returns(uint256) {

      difference = xue - jia ;

      log(" ===== xue ==== ", xue );

      log(" ===== jia ==== ", jia );

      log(" ===== diff ==== ", difference );

      return difference;

    }

}

