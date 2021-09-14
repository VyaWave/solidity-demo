pragma solidity =0.6.6;

import "./util.sol";

contract Hello is Console {
    constructor() public {}

    uint256 public diff;

    address private _XueAddress = 0xcC15300c0688c6f75782C92a4487a5A4D6100F7b;

    address private _JiaAddress = 0xd02c8efA8d20c55F163bA165e70d271DDaB8DBF4;

    function hello() public pure returns (string memory) {

        return "Hello Blockchain World";

    }

    function getUint256( address item) public pure returns(uint256 ){

        return  uint256( uint160( item ) );

    }


    function viewXueAddress() public view returns( address ) {

        return _XueAddress;

    }

    function viewMyAddress() public view returns( address ) {

        return _JiaAddress;

    }

    function calculateDiff() public returns( uint256 ) {

      uint256 valJia = getUint256(  _JiaAddress );

      uint256 valXue = getUint256( _XueAddress );

      if( valJia > valXue ) {

        diff =  valJia - valXue;

      }

      log(" ===== valJia ==== ", valJia );

      log(" ===== valXue ==== ", valXue );

      log(" ===== isXueMore ==== ", valJia < valXue );

      log(" ===== diff ==== ", diff );

      return diff;

    }

}
