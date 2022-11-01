const Curator = artifacts.require('./Curator');


module.exports = function (deployer) {
    deployer.then(async () => {
        await deployer.deploy(Curator);
    });
};
