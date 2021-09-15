// SPDX-License-Identifier: GPL-3.0
pragma solidity = 0.6.6;

contract WhiteSystem {

  uint160[] public whiteList;

  uint256 MAX_LIMIT = 100;

  constructor(uint256 maxLimt) public {

    MAX_LIMIT = maxLimt;

  }

  // bool[] 0: in white list && 1: uptoLimt
  function checkWhiteList( uint160 item ) public view  returns(bool[] memory result) {

    uint validCount = 0;
    uint length = whiteList.length - 1;

    bool ifIn = false;
    bool uptoLimt = false;

    for( uint i = 0; i < length; i ++ ) {
      if ( uint256(uint160(item)) == uint256(uint160(whiteList[i])) ) {
        ifIn = true;
      }

      if ( uint256( uint160( whiteList[i] ) ) > 0 ) {
        validCount++;
      }
    }

    uptoLimt = validCount >= MAX_LIMIT;

    result[0] = ifIn;
    result[1] = uptoLimt;

    return result;

  }


  function findIndex( uint160 item ) public view returns( uint256 targetIndex ){

    targetIndex = 1;

    uint length = whiteList.length -1;

    for( uint i = 0; i < length; i ++ ) {
      if ( uint256(uint160(item)) == uint256(uint160(whiteList[i])) ) {
        targetIndex = i;
        return targetIndex;
      }
    }
  }

  function addOne( uint160 item ) public returns( bool result ) {

    bool[] memory check = checkWhiteList( item );

    bool inList = check[0];
    bool uptoLimt = check[1];

    require( !inList, " white list is upto limit! " );
    require( !uptoLimt, " Item is allready in list! ");

    whiteList.push( item );

    result = true;

  }

  function removeOne( uint160 item ) public returns( bool result ) {

    bool[] memory check = checkWhiteList( item );

    bool inList = check[0];

    require( !inList, " Item is not in list! ");

    uint index = findIndex(item);

    delete whiteList[index];

    result = true;

  }

  function totalCount() public view returns(uint count) {

     uint length = whiteList.length - 1;

    for( uint i = 0; i < length; i ++ ) {

        if ( uint256(uint160(whiteList[i])) > 0 ) {
            count ++;
        }
    }

  }

  function viewWhiteList() public view returns( address[] memory result) {

    uint validTotal = totalCount();

    address[] memory validWhiteList = new address[](validTotal);

    uint length = whiteList.length - 1;

    for( uint i = 0; i < length; i ++ ) {



    }

  }


}
