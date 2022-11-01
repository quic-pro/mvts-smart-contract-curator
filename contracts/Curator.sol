// SPDX-License-Identifier: MIT


pragma solidity 0.8.7;


import "@openzeppelin/contracts/access/Ownable.sol";


contract Curator is Ownable {
    // ----- CUSTOM TYPES ------------------------------------------------------
    
    struct Router {
        uint128 ttl;
        uint128 chainId;
        string adr;
    }
    
    
    
    // ----- DATA --------------------------------------------------------------
    
    Router public rootRouter;
    
    
    
    // ----- SMART CONTRACT MANAGEMENT ------------------------------------------

    function setRootRouter(uint128 ttl, uint128 chainId, string memory adr) external onlyOwner {
        rootRouter = Router(ttl, chainId, adr);
    }
    
    function cleanRootRouter() external onlyOwner {
        rootRouter = Router(0, 0, "");
    }
}
