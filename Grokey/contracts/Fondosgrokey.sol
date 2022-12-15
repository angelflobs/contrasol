// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

import "contracts/Admin.sol";

contract Superfondos is Ownable {
   
    uint almacenamiento;
    // uint inversion = 8 ether;  bloqueado solo para el uso de cambio
 

    function almacendefondos ()  internal {
        owner= msg.sender;
        almacenamiento= msg.value;
    }
    /*
    function Statusfondos () public view returns ( uint){
        return almacenamiento;
    }*/

     //recibir fondos 
    function contribuir () public payable {
        require (msg.value >= 1 ether, "necesitas enviar al menos un ether");

    }

  

    // funcion que nos permite obtener el Balance de cuanto obtuvo el smartcontract
    
    function getBalance () public view returns ( uint ) {
        return address (this).balance;
    }

    function getBalanceInEther () public view returns (uint){
        return getBalance () /1e18;
    }

    //retirar los fondos del contrato.
   //funciones aún no activas
   /* 
   function Retiro ( address payable _to) public payable isOwner {
       _to.transfer (almacenamiento);
   }

  /* function Retiros ( uint _almacenamiento, address _to ) public {
       require (address(this).balance >= _almacenamiento);


   }*/
}