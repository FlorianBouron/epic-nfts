// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

// We first import some OpenZeppelin Contracts.
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

contract MyEpicNFT is ERC721URIStorage {
  // Help us keep track of tokenIds.
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  // We need to pass the name of our NFTs token and it's symbol.
  constructor() ERC721 ("SquareNFT", "SQUARE") {
    console.log("This is my NFT contract!");
  }

  // A function our user will hit to get their NFT.
  function makeAnEpicNFT() public {
     // Get the current tokenId, this starts at 0.
    uint256 newItemId = _tokenIds.current();

     // Actually mint the NFT to the sender using msg.sender.
    _safeMint(msg.sender, newItemId);

    // Set the NFTs data.
    _setTokenURI(newItemId, "data:application/json;base64,ewogICAgIm5hbWUiOiAiUm9ja2V0IiwKICAgICJkZXNjcmlwdGlvbiI6ICJUbyB0aGUgTW9vbiEiLAogICAgImltYWdlIjogImRhdGE6aW1hZ2Uvc3ZnK3htbDtiYXNlNjQsUEhOMlp5QjRiV3h1Y3owaWFIUjBjRG92TDNkM2R5NTNNeTV2Y21jdk1qQXdNQzl6ZG1jaUlHaGxhV2RvZEQwaU5qUXVNREV6SWlCM2FXUjBhRDBpTmpRdU1ESWlJSGh0Ykc1ek9uWTlJbWgwZEhCek9pOHZkbVZqZEdFdWFXOHZibUZ1YnlJK1BIQmhkR2dnWkQwaVRUTTRJRE0yTGpBeE0yd3ROaUEyTFRRZ05IWTJiQzAySURFd0lEUWdNaUF4TkMweE5DMHlMVEUwZW0wdE1UQXRNVEJzTFRFMExUSXRNVFFnTVRRZ01pQTBJREV3TFRab05tdzBMVFFnTmkwMmVpSWdabWxzYkMxeWRXeGxQU0psZG1WdWIyUmtJaUJtYVd4c1BTSWpZMk5qSWk4K1BIQmhkR2dnWkQwaVRURXdJRFEwTGpBeE0yTXRNeTQ1TXprZ05TNDNORGd0T1M0NU56UWdNVEl1T0RNMUxURXdJREUyTFM0d01qRWdNaTQwTURNZ01TNDFOellnTkM0d01qRWdOQ0EwSURNdU1qRTNMUzR3TWpjZ01UQXVNREV4TFRZdU1ETXhJREUyTFRFd2JDMHhNQzB4TUhvaUlHWnBiR3c5SWlObVl6WWlMejQ4Y0dGMGFDQmtQU0pOTVRZZ05ESXVNREV6WXkwekxqa3pPU0ExTGpjME9DMHhNaUF4TWk0NE16VXRNVElnTVRZZ01DQXlMakE1TVM0eU1ERWdNaUF5SURJZ015NHlNVGNnTUNBeE1DNHdNVEV0T0M0d016RWdNVFl0TVRKc0xUWXRObm9pSUdacGJHdzlJaU5sWkRjeE5qRWlMejQ4Y0dGMGFDQmtQU0pOTmpBZ0xqQXhNMk10Tmk0eU9EWXVNemc1TFRFM0xqRXpPQ0F4TGpFek55MHpNQ0F4TkMwNUxqUTJNU0E1TGpRMk1TMHhOeTQzTmpFZ01qTXVNakU0TFRJeExqWTFNaUF6TWk0ek5EZHNPUzR6TmpjZ09TNHpOamRETWpZdU56a3pJRFV4TGpnM05DQTBNQzQwTlRrZ05ETXVOVFV6SURVd0lETTBMakF4TTJNeE1pNDNOemt0TVRJdU56YzVJREV6TGpVd055MHlNeTQyTmprZ01UUXRNekFnTGpJeUxUSXVPREkyTFRFdU16ZzJMVFF1TVRZeUxUUXROSG9pSUdacGJHdzlJaU16T0RkaFlUY2lMejQ4Y0dGMGFDQmtQU0pOTmpBZ0xqQXhNMk10Tmk0eU9EWXVNemc1TFRFM0xqRXpPQ0F4TGpFek55MHpNQ0F4TkMwM0xqY3lOQ0EzTGpjeU15MHhOQzQyTmpRZ01UZ3VNekEzTFRFNUxqQTNPQ0F5Tmk0NU1EVnNNVEl1TWpNMUlERXlMakl6TlVNek1TNDNNRE1nTkRndU56VXhJRFF5TGpJeU1pQTBNUzQzT1RFZ05UQWdNelF1TURFell6RXlMamMzT1MweE1pNDNOemtnTVRNdU5UQTNMVEl6TGpZMk9TQXhOQzB6TUNBdU1qSXRNaTQ0TWpZdE1TNHpPRFl0TkM0eE5qSXROQzAwZWlJZ1ptbHNiRDBpSXpRNFlUQmtZeUl2UGp4amFYSmpiR1VnWTNnOUlqUTRJaUJqZVQwaU1UWXVNREV6SWlCeVBTSTRJaUJtYVd4c1BTSWpOR1EwWkRSa0lpOCtQR05wY21Oc1pTQmplRDBpTkRnaUlHTjVQU0l4Tmk0d01UTWlJSEk5SWpRaUlHWnBiR3c5SWlObVptWWlMejQ4TDNOMlp6ND0iCn0=");

    console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);

    // Increment the counter for when the next NFT is minted.
    _tokenIds.increment();
  }
}
