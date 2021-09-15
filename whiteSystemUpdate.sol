// SPDX-License-Identifier: GPL-3.0
pragma solidity = 0.6.6;

contract WhiteSystem {

  uint160[] public whiteList;

  uint160[] public validWhitelist;

  uint256 MAX_LIMIT = 100;


  // 设置最大数量
  function setMaxLimt( uint256 max ) public {

    MAX_LIMIT = max;

  }

  // 检查上限
  function checkLimit() public view returns( bool limit ) {

    uint length = whiteList.length -1;

    uint validCount = 0;


    for( uint i = 0; i < length; i ++ ) {
      if ( uint256( uint160( whiteList[i] ) ) > 0 ) {
        validCount++;
      }
    }

    limit = validCount >= MAX_LIMIT;

  }


  // 获取对应的索引值
  function checkIndex( uint160 item ) public view returns( uint256 targetIndex ){

    targetIndex = 0;

    uint length = whiteList.length -1;

    for( uint i = 0; i < length; i ++ ) {
      if ( uint256(uint160(item)) == uint256(uint160(whiteList[i])) ) {
        targetIndex = i;
        return targetIndex;
      }
    }
  }

  // 获取是否存在
  function checkin( uint160 item ) public view returns( bool inList ){

    uint length = whiteList.length - 1;

    for( uint i = 0; i < length; i ++ ) {
      if ( uint256(uint160(item)) == uint256(uint160(whiteList[i])) ) {
        inList = true;
        return inList;
      }
    }
  }

  // 增加一个
  function addOne( uint160 item ) public returns( bool result ) {

    bool inList = checkin(item);
    bool uptoLimt = checkLimit();

    require( !inList, " white list is upto limit! " );
    require( !uptoLimt, " Item is allready in list! ");

    whiteList.push( item );

    result = true;

  }

  // 移除一个
  function removeOne( uint160 item ) public returns( bool result ) {


    bool inList = checkin(item);

    require( !inList, " Item is not in list! ");

    uint index = checkIndex(item);

    delete whiteList[index];

    result = true;

  }

  // 获取有效地址
  function getWhiteList() public {

    uint length = whiteList.length - 1;

    for( uint i = 0; i < length; i ++ ) {

        if ( uint256(uint160(whiteList[i])) > 0 ) {
          validWhitelist.push(whiteList[i]);
        }
    }

  }

  // 获取有效地址数量
  function getCount() public view returns( uint count) {

    uint length = whiteList.length - 1;

    for( uint i = 0; i < length; i ++ ) {
        if ( uint256(uint160(whiteList[i])) > 0 ) {
          count ++;
        }
    }

  }

}
