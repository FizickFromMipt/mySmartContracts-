// SPDX-License-Identifer: MIT

pragma solidity ^0.8.0;

contract MyShop {
    // Для характеризования владельца (public - возожность ЧТЕНИЯ из вне контракта)
    address public owner;
    mapping (address => uint) public payments;

    constructor() {
        // Владелец - тот кто развернул контракт
        owner = msg.sender;
    }

    // Функция - чтобы принимать денежные средства; payable - модификатор, что бы функция могла рабоать с деньгами
    function payForItem() public payable {
        // В теле функции не нунжно ничего писать, если происходить зачисление или списание - все делается автоматом

        // Записываем - сколько прислали на данный адрес
        payments[msg.sender] = msg.value;
    }

    function withdrawAll() public {
        address payable _to = payable (owner);
        address _thisContract = address(this);
        _to.transfer(_thisContract.balance);    
    }
}