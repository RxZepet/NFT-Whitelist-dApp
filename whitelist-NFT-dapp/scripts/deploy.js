const { ethers } = require("hardhat");

async function main() {
  const whitelistContract = await ethers.getContractFactory("Whitelist");

  // here we deploy the contract. 10 is the maximum number of addresss that can be whitelisted
  const deployedWhitelistContract = await whitelistContract.deploy(10);

  // Wait for the  deployment to complete
  await deployedWhitelistContract.deployed();

  // this prints the address of the deployed contract
  console.log("Whitelist Contract Address:", deployedWhitelistContract.address);
}

// Call the main function and catch if there is any error
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

