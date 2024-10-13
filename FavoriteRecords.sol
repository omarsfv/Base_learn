// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract FavoriteRecords {
    // Brand label for the contract
    string public brandLabel = "bigshort.base.eth"; // Adding the brand label

    mapping(string => bool) public approvedRecords;
    mapping(address => string[]) userFavorites;

    string[] recordsList = [
        "Thriller",
        "Back in Black",
        "The Bodyguard",
        "The Dark Side of the Moon",
        "Their Greatest Hits (1971-1975)",
        "Hotel California",
        "Come On Over",
        "Rumours",
        "Saturday Night Fever"
    ];

    constructor() {
        for (uint8 i = 0; i < recordsList.length; i++) {
            approvedRecords[recordsList[i]] = true;
        }
    }

    // Function to get the list of approved records
    function getApprovedRecords() public view returns (string[] memory list) {
        list = recordsList;
        return list;
    }

    error NotApproved(string);

    // Function to add a record to the user's favorites
    function addRecord(string memory album) public {
        if (approvedRecords[album]) {
            userFavorites[msg.sender].push(album);
        } else {
            revert NotApproved(album);
        }
    }

    // Function to get the user's favorite records
    function getUserFavorites(address addr) public view returns (string[] memory fav) {
        fav = userFavorites[addr];
        return fav;
    }

    // Function to reset the user's favorite records
    function resetUserFavorites() public {
        delete userFavorites[msg.sender];
    }
}
