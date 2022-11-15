// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;


import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";


contract Curator is Ownable {
    // ----- CUSTOM TYPES ----------------------------------------------------------------------------------------------

    struct RootRouter {
        string chainId;
        string adr;
    }



    // ----- SETTINGS --------------------------------------------------------------------------------------------------

    string constant public POOL_CODE_LENGTH = "3";

    string public ttl = "864000"; // 10 days



    // ----- DATA ------------------------------------------------------------------------------------------------------

    RootRouter public rootRouter;
    bool public hasRootRouter;



    // ----- SMART CONTRACT MANAGEMENT ---------------------------------------------------------------------------------

    function setTtl(uint256 newTtl) external onlyOwner {
        ttl = Strings.toString(newTtl);
    }

    function setRootRouter(uint256 newChainId, string memory newAddress) external onlyOwner {
        rootRouter = RootRouter(
            Strings.toString(newChainId),
                newAddress
        );
        hasRootRouter = true;
    }

    function cleanRootRouter() external onlyOwner {
        delete rootRouter;
        hasRootRouter = false;
    }



    // ----- ROUTING ---------------------------------------------------------------------------------------------------

    function getRootRouter() public view returns(string[5] memory) {
        return [
            (hasRootRouter ? "200" : "400"), // Response code
            POOL_CODE_LENGTH,
            rootRouter.chainId,
            rootRouter.adr,
            ttl
        ];
    }
}
