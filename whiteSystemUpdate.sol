// SPDX-License-Identifier: GPL-3.0
pragma solidity = 0.6.6;

contract WhiteList {


    uint public MAX_LIMIT = 100;
    mapping(address => uint) private addressIndexMap;
    address[] private whiteList;

    function setMaxLimt(uint _maxlimt) public {
        MAX_LIMIT = _maxlimt;
    }

    function checkInList(address _item) public view returns(bool) {
        return addressIndexMap[_item] > 0;
    }

    function addOne(address _item) public returns(bool result) {

        require(whiteList.length < MAX_LIMIT, " upto limt! ");

        require(addressIndexMap[_item] < 1, " It is allready in list! ");

        whiteList.push(_item);

        uint moreOneIndex = whiteList.length;

        addressIndexMap[ _item ] = moreOneIndex;

        result = true;

    }

    function removeOne(address _item) public returns(bool result) {

        require(addressIndexMap[_item] > 0, " It is not in list! ");

        uint currentIndex = addressIndexMap[_item] - 1;

        uint lastInex = whiteList.length - 1;

        address _temp = whiteList[lastInex];

        whiteList[lastInex] = _item;

        whiteList[currentIndex] = _temp;

        addressIndexMap[_temp] = currentIndex + 1;

        addressIndexMap[ _item ] = 0;

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
