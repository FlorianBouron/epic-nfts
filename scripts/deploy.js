const main = async () => {
  const nftContractFactory = await hre.ethers.getContractFactory('MyEpicNFT');
  const nftContract = await nftContractFactory.deploy();
  await nftContract.deployed();
  console.log("Contract deployed to:", nftContract.address);

  for(let i = 0; i<20; i++) {
    const txn = await nftContract.makeAnEpicNFT();
    await txn.wait();
    console.log(`Just minted the ${i} NFT`);
  }

  console.log("Minted NFTs")
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};

runMain();