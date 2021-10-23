import { useEffect, useState } from 'react';
import { ethers, Contract } from "ethers";
import myEpicNft from './utils/MyEpicNFT.json';
import './styles/App.css';
import Emoji from './components/Emoji';
import MintedContract from './components/MintedContract';

// Constants
const OPENSEA_LINK = 'https://testnets.opensea.io/assets/';
const CONTRACT_ADDRESS = "0x1D0587a081609915f7C814B135478bCE35991525";

const App = () => {

  const [currentAccount, setCurrentAccount] = useState("");
  const [contract, setContract] = useState<Contract | null>(null);
  const [isMinting, setIsMinting] = useState(false);
  const [numberOfContract, setNumberOfContract] = useState(-1);

  const connectContract = async (ethereum: any) => {
    if (!contract) {
      const provider = new ethers.providers.Web3Provider(ethereum);
      const signer = provider.getSigner();
      const connectedContract = new ethers.Contract(CONTRACT_ADDRESS, myEpicNft.abi, signer);
      setContract(connectedContract);
      const remainingEpicNFTs = await connectedContract.remainingEpicNFTs();
      setNumberOfContract(remainingEpicNFTs.toNumber());
    }
  }

  const checkIfWalletIsConnected = async () => {
    const { ethereum } = window;

    if (!ethereum) {
      console.log("Make sure you have metamask!");
      return;
    }

    const chainId = await ethereum.request({ method: 'eth_chainId' });
    console.log("Connected to chain " + chainId);

    // String, hex code of the chainId of the Rinkebey test network
    const rinkebyChainId = "0x4"; 
    if (chainId !== rinkebyChainId) {
      alert("You are not connected to the Rinkeby Test Network!");
    }

    const accounts = await ethereum.request({ method: 'eth_accounts' });

    if (accounts.length > 0) {
      const account = accounts[0];
      setCurrentAccount(account)
      connectContract(ethereum);
      setupEventListener();
    } else {
      console.log("No authorized account found")
    }
  }

  const connectWallet = async () => {
    try {
      const { ethereum } = window;

      if (!ethereum) {
        alert("Get MetaMask!");
        return;
      }

      const accounts = await ethereum.request({ method: "eth_requestAccounts" });
      setCurrentAccount(accounts[0]); 
      connectContract(ethereum);
      setupEventListener();
    } catch (error) {
      console.log(error)
    }
  }

  const setupEventListener = async () => {
    try {
      const { ethereum } = window;

      if (ethereum && contract) {

        contract.on("NewEpicNFTMinted", (from, tokenId, totalNFTs) => {
          console.log(from, tokenId.toNumber());
          setNumberOfContract(totalNFTs.toNumber());
          alert(`Hey there! We've minted your NFT and sent it to your wallet. It may be blank right now. It can take a max of 10 min to show up on OpenSea. Here's the link: https://testnets.opensea.io/assets/${CONTRACT_ADDRESS}/${tokenId.toNumber()}`);
        });
      } else {
        console.log("Ethereum object doesn't exist!");
      }
    } catch (error) {
      console.log(error)
    }
  }

  const askContractToMintNft = async () => {
      try {
        const { ethereum } = window;
  
        if (ethereum && contract) {
          const nftTxn = await contract.makeAnEpicNFT();
          setIsMinting(true);
          await nftTxn.wait();
          
          console.log(`Mined, see transaction: https://rinkeby.etherscan.io/tx/${nftTxn.hash}`);
          setIsMinting(false);
        }
      } catch (error) {
        setIsMinting(false);
        console.log(error)
      }
  }

  useEffect(() => {
    checkIfWalletIsConnected();
  }, []);

  console.log('numberOfContract: ', numberOfContract);

  return (
    <div className="App">
      <div className="container">
        <div className="header-container">
          <p className="header gradient-text">My NFT Collection</p>
          <p className="sub-text">
            Each unique. Each beautiful. Discover your NFT today.
          </p>
          <MintedContract numberOfContract={numberOfContract} />
          {currentAccount === "" ? (
            <button onClick={connectWallet} className="cta-button connect-wallet-button">
              Connect to Wallet
            </button>
          ) : (
            <button onClick={askContractToMintNft} className="cta-button connect-wallet-button">
              Mint NFT
            </button>
          )}
          {isMinting && 
            <p className="text">
              <Emoji label="hammer" symbol="🔨" />
              Minting in progress...
            </p>
          }
        </div>
      </div>
    </div>
  );
};

export default App;