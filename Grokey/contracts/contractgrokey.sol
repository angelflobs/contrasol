// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;



contract compraVenta {
    
    // Declarar las variables del estado del contrato
    address public owner;
    mapping (address => uint) public ActionBalances;

    // Cuando se implementa el contrato "compraVenta":
    // 1. configurar la dirección de implantación como el propietario del contrato
    // 2. configurar el saldo de titulos del contrato inteligente implementado en 100
    constructor() {
        owner = msg.sender;
        ActionBalances[address(this)] >= 10; // especificamos en numeros enteros la cantidad esperada.
        
    }
    

    // Permitir que el propietario aumente el saldo de acciones del contrato inteligente
    function refill(uint amount) public {
        require(msg.sender == owner, "Only the owner can refill.");
        ActionBalances[address(this)] += amount;
    }

    // Permitir que cualquier persona compre accion
    function purchase(uint amount) public payable {
        require(msg.value >= amount * 1 ether, "You must pay at least 1 ETH per action");
        require(ActionBalances[address(this)] >= amount, "Not enough actions in stock to complete this purchase");
        ActionBalances[address(this)] -= amount;
        ActionBalances[msg.sender] += amount;
    }
    
    // funcion que nos permite obtener el valance de cuanto obtuvo el smartcontract
    
    function getBalance () public view returns ( uint ) {
        return address (this).balance;
    }

    function getBalanceInEther () public view returns (uint){
        return getBalance () /1e18;
    }


    
     // esta funcion nos permite enviar transfererencias a owner 
   /* function transfer ( uint amount ) public owner {
        require ( address (this).balance >= amount);
        owner.transfer(amount);
    }*/

    function LiberarFondos() public {
        owner.transfer()

    }

}
    
    
    