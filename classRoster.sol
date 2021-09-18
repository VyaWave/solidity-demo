// SPDX-License-Identifier: GPL-3.0
pragma solidity = 0.6.6;

contract ClassRoster {

    uint256 immutable public  STUDENT_COUNT;

    mapping(uint256 => bool) private studentsMap;
    mapping(uint256 => uint256) private studentsIndexMap;

    mapping(uint256 => string) private studentsNameMap;

    uint256[] private students;

    constructor(uint256 _count) public {
        require( _count >=70 && _count <=120, " Must in 70 ~ 120 ! " );
        STUDENT_COUNT = _count;
    }


    function viewTotal() public view returns(uint total) {
        total = students.length;
    }

    function viewStudents() public view returns( uint256[] memory list ){
        list = students;
    }


    function addStudent(uint256 _id, string memory name) public returns(bool result) {

        require(students.length < STUDENT_COUNT, " upto limt students ! ");

        require(studentsMap[_id], " It is allready in list! ");

        students.push(_id);

        studentsMap[ _id ] = true;

        studentsNameMap[ _id ] = name;

        studentsIndexMap[ _id ] = students.length;

        result = true;

    }

    function removeOne(uint _id) public returns(bool result) {

        require(studentsMap[_id], " It is not in list! ");

         uint lastInex = students.length - 1;

        uint lastItem = students[lastInex];

        uint currentIndex = studentsIndexMap[_id] - 1;

        students[currentIndex] =  students[lastInex];

        studentsIndexMap[lastItem] = currentIndex + 1;

        studentsIndexMap[ _id ] = 0;

        studentsMap[ _id ] = false;

        studentsNameMap[_id] = "";

        students.pop();

        result = true;
    }

}
