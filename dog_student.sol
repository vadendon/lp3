// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract StudentData {
    struct Student {
        uint id;
        string name;
        uint age;
        string course;
    }

    Student[] public students;
    mapping(uint => bool) private studentExists;

    event StudentAdded(uint id, string name, uint age, string course);
    
    // Receive function to handle plain Ether transfers
    receive() external payable {
        // Revert any Ether sent to this contract, as it's not supposed to hold funds
        revert("This contract does not accept payments.");
    }

    // Fallback function in case data is sent
    fallback() external payable {
        // Also revert in case any data is sent with an Ether transfer
        revert("This contract does not accept payments.");
    }

    function addStudent(uint _id, string memory _name, uint _age, string memory _course) public {
        require(!studentExists[_id], "Student with this ID already exists.");
        
        Student memory newStudent = Student({
            id: _id,
            name: _name,
            age: _age,
            course: _course
        });

        students.push(newStudent);
        studentExists[_id] = true;

        emit StudentAdded(_id, _name, _age, _course);
    }

    function getStudentCount() public view returns (uint) {
        return students.length;
    }

    function getStudent(uint index) public view returns (uint, string memory, uint, string memory) {
        require(index < students.length, "Student index out of range.");

        Student memory student = students[index];
        return (student.id, student.name, student.age, student.course);
    }
}