
pragma solidity ^0.4.11;

/** 
 * @author Ricardo Guilherme Schmidt (Status Research & Development GmbH)
 * @title NameRegistry
 * Interface for Name Registries.
 */
contract NameRegistry {
    function getAddr(uint256 _id) public constant returns(address addr);
    function getAddr(string _name) public constant returns(address addr);
    function getName(address _addr) public constant returns(string name);
    
    mapping (bytes32 => uint256) indexes; 

    function getId(address _addr) public constant returns(uint256 id){
        return indexes[keccak256(_addr)];
    } 

    function getId(string _name) public constant returns(uint256 id) {
        return indexes[keccak256(_name)];
    }
    
    function _updateIndex(bytes32 _old, bytes32 _new) internal {
        indexes[_new] = indexes[_old];   
        delete indexes[_old];
    }
}
