pragma solidity ^0.5.1;

contract FirstERC20Token {
    string  public name = "MyERC20Token";
    string  public symbol = "ERT";
    uint256 public totalAmount;


    //key value pairs 
    mapping(address => uint256) public balances; // balances of token holders
    mapping(address => mapping(address => uint256)) public allowance; // number of token allowed to transfer from one address to another.

function balanceOf(address tokenOwner) public view  returns (uint256 balance) {
        return balances[tokenOwner];
    }
    
      constructor  (uint256 _initialAmount) public {
        balances[msg.sender] = _initialAmount;
        totalAmount = _initialAmount;
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balances[msg.sender] >= _value);

        balances[msg.sender] -= _value;
        balances[_to] += _value;

        emit Transfer(msg.sender, _to, _value);

        return true;
    }


    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);

        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= balances[_from]); // ensure that there's enough amount from sender address
        require(_value <= allowance[_from][msg.sender]); // ensure that the approved amount is enough

        balances[_from] -= _value;
        balances[_to] += _value;

        allowance[_from][msg.sender] -= _value;

        emit Transfer(_from, _to, _value);

        return true;
    }
    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );
    
        event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );


}
