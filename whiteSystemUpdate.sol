// SPDX-License-Identifier: GPL-3.0
pragma solidity = 0.6.6;

contract WhiteList {


    uint MAX_LIMIT = 100;
    mapping(address => uint) temporary;
    address[] private whiteList;

    function setMaxLimt(uint _maxlimt) public {
        MAX_LIMIT = _maxlimt;
    }

    function checkInList(address _item) public view returns(bool result) {

        if (temporary[_item] > 0 ) {
            result = true;
        } else {
            result = false;
        }
    }


     function checkMaxLimit() private view returns(bool uptoLimt) {

        if (whiteList.length >= MAX_LIMIT) {
            uptoLimt = true;
        } else {
            uptoLimt = false;
        }

    }


    function addOne(address _item) public returns(bool result) {

        require(!checkMaxLimit(), " upto limt! ");

        require(!checkInList(_item), " It is allready in list! ");

        whiteList.push(_item);

        uint length = whiteList.length;

        temporary[ _item ] = length;

        result = true;

    }

    function removeOne(address _item) public returns(bool result) {

        require(checkInList(_item), " It is not in list! ");

        uint index = temporary[_item] - 1;

        uint length = whiteList.length;

        address _temp = whiteList[length -1 ];

        whiteList[length - 1 ] = _item;

        whiteList[index] = _temp;

        temporary[_temp] = index + 1;

        temporary[ _item ] = 0;

        whiteList.pop();

        result = true;

    }

    function viewTotal() public view returns(uint total) {

        total = whiteList.length;

    }

    function viewList() public view returns( address[] memory list ){

        list = whiteList;

    }

}
