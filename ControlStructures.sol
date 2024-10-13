// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ControlStructures {
    // Brand label for the contract
    string public brandLabel = "bigshort.base.eth"; // Adding the brand label

    // FizzBuzz function to return specific strings based on divisibility of the input number
    function fizzBuzz(uint _number) external pure returns (string memory) {
        if (_number % 3 == 0 && _number % 5 == 0) {
            return "FizzBuzz";
        } else if (_number % 3 == 0) {
            return "Fizz";
        } else if (_number % 5 == 0) {
            return "Buzz";
        } else {
            return "Splat";
        }
    }

    // Custom error for after hours usage
    error AfterHours(uint errorTime);

    // Function to return different strings based on the input time
    function doNotDisturb(uint _time) external pure returns (string memory) {
        // If time is greater than or equal to 2400, trigger an assert
        if (_time >= 2400) {
            assert(false);
        }

        // If time is before 0800 or after 2200, trigger a custom error
        if (_time > 2200 || _time < 800) {
            revert AfterHours(_time);
        }

        // Return appropriate message based on time of day
        if (_time >= 1200 && _time <= 1259) {
            revert("At lunch!");
        } else if (_time >= 800 && _time <= 1199) {
            return "Morning!";
        } else if (_time >= 1300 && _time <= 1799) {
            return "Afternoon!";
        } else {
            return "Evening!";
        }
    }
}
