// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;


import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";


contract Curator is Ownable {
    // ----- CUSTOM TYPES ----------------------------------------------------------------------------------------------

    struct RootRouter {
        string chainId;
        string adr;
        string ttl;
    }



    // ----- DATA ------------------------------------------------------------------------------------------------------

    RootRouter public rootRouter;
    bool public isRootRouterConfigured;



    // ----- SMART CONTRACT MANAGEMENT ---------------------------------------------------------------------------------

    function setRootRouter(uint256 newChainId, string memory newAddress, uint256 newTtl) external onlyOwner {
        rootRouter = RootRouter(
            Strings.toString(newChainId),
            newAddress,
            Strings.toString(newTtl)
        );
        isRootRouterConfigured = true;
    }

    function cleanRootRouter() external onlyOwner {
        delete rootRouter;
        isRootRouterConfigured = false;
    }



    // ----- ROUTING ---------------------------------------------------------------------------------------------------

    function getRootRouter() public view returns(string[5] memory) {
        if (!isRootRouterConfigured) {
            return [
                "400", // Response code
                "", // Ignore
                "", // Ignore
                "", // Ignore
                "" // Ignore
            ];
        }

        return [
            "200", // Response code
            "3", // Pool code length
            rootRouter.chainId,
            rootRouter.adr,
            rootRouter.ttl
        ];
    }
}
