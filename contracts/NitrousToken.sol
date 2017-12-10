pragma solidity ^0.4.18;

interface IERC20Token {
    function totalSupply() public constant returns (uint256 totalSup);
    function balanceOf(address _owner) public constant returns (uint256 balance);
    function transfer(address _to, uint256 _value) public returns (bool success);
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
    function approve(address _spender, uint256 _value) public returns (bool success);
    function allowance(address _owner, address _spender) public constant returns (uint256 remaining);
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

contract NitrousToken is IERC20Token {

    uint public constant supply = 100000000;
    string public constant symbol = "NOS";
    string public constant name = "Nitrous Token";
    uint8 public constant decimals = 18;
    string public constant version = "1";

    mapping(address => uint256) balances;
    mapping(address => mapping(address => uint256)) allowed;

    function NitrousToken() public {
        balances[msg.sender] = supply;
        transfer(0x9A7d0E14446EF6abB67cA71AcD5BEb03a5B2dBe7, 55000);
    }

    function totalSupply() public constant returns (uint256) {
        return supply;
    }

    function balanceOf(address _owner) public constant returns (uint256 balance) {
        return balances[_owner];
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        require(
            balances[msg.sender] >= _value &&
            _value > 0
        );

        balances[msg.sender] -= _value;
        balances[_to] += _value;
        Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(
            allowed[_from][msg.sender] >= _value &&
            balances[_from] >= _value && balances[_from] > 0
        );

        balances[_from] -= _value;
        balances[_to] += _value;
        allowed[_from][msg.sender] -= _value;
        Transfer(_from, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) public constant returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}