//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Whitelist {

    // maxixmum number of addresses which can be whitelisted
    uint8 public maxWhitelistedAddresses;

    // numAddressesWhitelisted keeps track of the number of addresses presently whitelisted
    uint8 public numAddressesWhitelisted;

    // this indicates if an address has been whitelisted or not. Default is false
    mapping(address => bool) public whitelistedAddress;

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    // The function adds the address of the sender to the whitelist
    function addAddressToWhitelist() public {
        // checks if user(msg.sender) has allready been whitelisted
        require(!whitelistedAddress[msg.sender], "Sender already whitelisted");

        // checks if there is space for address to be added to the whitelist
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "Maximum limit reached");
        whitelistedAddress[msg.sender] = true;
        // increase the number of whitelisted addresses
        numAddressesWhitelisted += 1;
    }

}