// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ArraysExercise {
    uint[] public numbers = [1,2,3,4,5,6,7,8,9,10];
    address[] senders;
    uint[] timestamps;

    function saveTimestamp(uint _unixTimestamp) public {
        senders.push(msg.sender);
        timestamps.push(_unixTimestamp);
    }

    function afterY2K() public returns (uint[] memory filteredTimestamps, address[] memory filteredSenders) {
        uint filteredLength = 0;               

        for(uint8 i = 0; i < timestamps.length; i++) {
            if(timestamps[i] > 946702800) {
                filteredLength++;
            }
        }

        filteredTimestamps = new uint[] (filteredLength);
        filteredSenders = new address[] (filteredLength);

        uint8 cursor = 0;
        for(uint8 i = 0; i < timestamps.length; i++) {
            if(timestamps[i] > 946702800) {
                filteredTimestamps[cursor] = timestamps[i];
                filteredSenders[cursor] = senders[i];
                cursor++;
            }
        }

        return (filteredTimestamps, filteredSenders);
    }

    function resetSenders () public {
        delete senders;
    }

    function resetTimestamps () public {
        delete timestamps;
    }

    function getNumbers() external view returns (uint[] memory memoryNumbers){
        memoryNumbers = numbers;
        return memoryNumbers;
    }

    function resetNumbers() public {
        uint[] memory resetArray = new uint [](10);
        for(uint8 i = 0; i < 10; i++) {
            resetArray[i] = i+1;
        }

        numbers = resetArray;
    }

    function appendToNumbers(uint[] memory _toAppend) public {
        for(uint8 i = 0; i < _toAppend.length; i++) {
            numbers.push(_toAppend[i]);
        }
    }
}
