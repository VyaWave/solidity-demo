pragma solidity =0.6.6;

import "./console.sol";

contract Hello is Console {
    constructor() public {}


    uint256 public xue =
        uint256(uint160(0xcC15300c0688c6f75782C92a4487a5A4D6100F7b));

    uint256 public jia =
        uint256(uint160(0xd02c8efA8d20c55F163bA165e70d271DDaB8DBF4));

    uint256 public diff;

    function hello() public pure returns (string memory) {
        return "Hello Blockchain World";
    }

    function echoXue() public view returns( uint256 ) {

        return xue;

    }

    function echoJia() public view  returns(uint256) {
        return jia;
    }

    function echoAddress() public returns(uint256) {

      diff = xue > jia ? xue - jia : jia - xue;

      log(" ===== xue ==== ", xue );

      log(" ===== jia ==== ", jia );

      log(" ===== isXueMore ==== ", xue > jia );

      log(" ===== diff ==== ", diff );



      return diff;

    }

}
