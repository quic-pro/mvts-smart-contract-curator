// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;


import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";


contract Curator is Ownable {
    // ----- CUSTOM TYPES ----------------------------------------------------------------------------------------------

    enum CodeMode {Number, Pool}

    struct Router {
        uint256 chainId;
        uint256 poolCodeLength;
        string adr;
    }

    struct NodeData {
        uint256 responseCode;
        uint256 ttl;
        CodeMode mode;
        string sipUri;
        Router router;
    }


    // ----- SETTINGS --------------------------------------------------------------------------------------------------

    uint256 public ttl = 10 days;


    // ----- DATA ------------------------------------------------------------------------------------------------------

    uint256 constant private _POOL_CODE_LENGTH = 3;

    Router public rootRouter;
    bool public hasRootRouter;


    // ----- SMART CONTRACT MANAGEMENT ---------------------------------------------------------------------------------

    function setTtl(uint256 newTtl) external onlyOwner {
        ttl = newTtl;
    }

    function setRootRouter(uint256 newChainId, string memory newAdr) external onlyOwner {
        rootRouter = Router(newChainId, _POOL_CODE_LENGTH, newAdr);
        hasRootRouter = true;
    }

    function cleanRootRouter() external onlyOwner {
        delete rootRouter;
        hasRootRouter = false;
    }


    // ----- ROUTING ---------------------------------------------------------------------------------------------------

    function getRootRouter() public view returns(NodeData memory) {
        return NodeData({
            responseCode: (hasRootRouter ? 200 : 400),
            ttl: ttl,
            mode: CodeMode.Pool,
            sipUri: "",
            router: rootRouter
        });
    }
}
