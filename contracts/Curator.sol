// SPDX-License-Identifier: MIT


pragma solidity 0.8.7;


import "@openzeppelin/contracts/access/Ownable.sol";


contract Curator is Ownable {
    // ----- CUSTOM TYPES ------------------------------------------------------
    
    struct Router {
        uint128 chainId;
        string adr;
        uint128 poolCodeLength;
    }
    
    
    
    // ----- DATA --------------------------------------------------------------
    
    Router public rootRouter;
    
    
    
    // ----- SMART CONTRACT MANAGEMENT ------------------------------------------

    function setRootRouter(uint128 chainId, string memory adr, uint128 poolCodeLength) external onlyOwner {
        rootRouter = Router(chainId, adr, poolCodeLength);
    }
    
    function removeRootRouter() external onlyOwner {
        rootRouter = Router(0, "", 0);
    }
}
