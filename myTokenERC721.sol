pragma solidity ^0.4.24;

contract ERC721 {
    
    uint256 token_id;
    uint token_data;
    

    mapping (uint256 => address) adreess_user;
    mapping (uint256 => uint) token_list;
    
    event Transfer(address from, address to, uint256 token_id);
    event ChangeData(address from, uint256 token_id, uint token_data);

    function createToken(uint256 _token_id, uint _token_data) public {
        uint new_token_data = _token_data;
        uint256 new_token_id = _token_id;
        token_list[new_token_id] = new_token_data;
        adreess_user[new_token_id] = msg.sender;
    }
    
    
    function transfer(address _to, uint256 _token_id) public {
        require(adreess_user[_token_id] == msg.sender);
        adreess_user[_token_id] = _to;
        
        emit Transfer(msg.sender, _to, _token_id);
    }
    
    function changeData(uint256 _token_id, uint _token_data) public{
        require(adreess_user[_token_id] == msg.sender);
        token_list[_token_id] = _token_data;
        
        emit ChangeData(msg.sender, _token_id, _token_data);
    }
    function demolishToken(uint256 _token_id) public{
        require(adreess_user[_token_id] == msg.sender);
        adreess_user[_token_id] = address (0);
        
    }
}