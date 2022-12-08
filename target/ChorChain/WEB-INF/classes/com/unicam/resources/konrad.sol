 pragma solidity ^0.5.3; 
	pragma experimental ABIEncoderV2;
	contract konrad{
	event functionDone(string);
	enum State {DISABLED, ENABLED, DONE} State s; 
	struct Element{
			string ID;
		State status;
	}
		struct StateMemory{
	address customerId;
address customerId;
address sellerId;
string contract;
string titleDeed;
}
	Element[11] elements;
	  StateMemory currentMemory;
	string[2] roleList = [ "Bank", "Customer" ]; 
	string[1] optionalList = ["Seller" ];
	 mapping(string=>address payable) optionalRoles; 
	mapping(string=>address payable) roles; 
constructor() public{
        elements[1] = Element("StartEvent_0feoz70", State.ENABLED);
         //roles definition
         //mettere address utenti in base ai ruoli
	roles["Bank"] = 0x9e80eBa685B1831f2718A248b18eA58aFD81864c;
	roles["Customer"] = 0xe47e9B5B5D4C5B0dCab8b7989FD294ecBa124D81;
	optionalRoles["Seller"] = 0x0000000000000000000000000000000000000000;		//enable the start process
		StartEvent_0feoz70();
		emit functionDone("Contract creation");
	}
modifier checkRole(string memory role){ 
	require(msg.sender == roles[role] || msg.sender == optionalRoles[role] 
);
_; 

} function getRoles() public view returns( string[] memory, address[] memory){
    uint c = roleList.length;
    string[] memory allRoles = new string[](c);
    address[] memory allAddresses = new address[](c);
    
    for(uint i = 0; i < roleList.length; i ++){
        allRoles[i] = roleList[i];
        allAddresses[i] = roles[roleList[i]];
    }
    return (allRoles, allAddresses);
}
   function getOptionalRoles() public view returns( string[] memory, address[] memory){
       require(optionalList.length > 0);
       uint c = optionalList.length;
       string[] memory allRoles = new string[](c);
       address[] memory allAddresses = new address[](c);
       
       for(uint i = 0; i < optionalList.length; i ++){
           allRoles[i] = optionalList[i];
           allAddresses[i] = optionalRoles[optionalList[i]];
       }
    
       return (allRoles, allAddresses);
   }

function subscribe_as_participant(string memory _role) public {
        if(optionalRoles[_role]==0x0000000000000000000000000000000000000000){
          optionalRoles[_role]=msg.sender;
        }
    }
function() external payable{
    
} function StartEvent_0feoz70() private {
	require(elements[1].status==State.ENABLED);
	done(1);
	enable("ExclusiveGateway_0xmw7j9",2);
ExclusiveGateway_0xmw7j9 (); 
}

function ExclusiveGateway_0xmw7j9() private {
		require(elements[2].status==State.ENABLED);
		done(2);
	enable("Message_056a5rn", 3);  
if(){enable("EndEvent_0rx0b7x", 4); 
 EndEvent_0rx0b7x(); 
}
}

function Message_056a5rn(address customerId) public checkRole(roleList[1]){
	require(elements[3].status==State.ENABLED);  
	done(3);
	enable("Message_0r1c26j",5);
currentMemory.addresscustomerId=addresscustomerId;
}
function Message_0r1c26j(address customerId) public checkRole(roleList[0]){
	require(elements[5].status==State.ENABLED);
	done(5);
currentMemory.addresscustomerId=addresscustomerId;
	enable("Message_1ueoupa",6);
}

function EndEvent_0rx0b7x() private {
	require(elements[4].status==State.ENABLED);
	done(4);  }

function Message_1ueoupa(address sellerId) public checkRole(roleList[0]){
	require(elements[6].status==State.ENABLED);
	done(6);
currentMemory.addresssellerId=addresssellerId;
	enable("Message_0kbobkb",7);
}

function Message_0kbobkb(string memory contract) public checkRole(optionalList[0]){
	require(elements[7].status==State.ENABLED);  
	done(7);
	enable("Message_0l5brh3",8);
currentMemory.contract=contract;
}
function Message_0l5brh3(string memory titleDeed) public checkRole(roleList[0]){
	require(elements[8].status==State.ENABLED);
	done(8);
currentMemory.titleDeed=titleDeed;
	enable("Message_1nt0d0i",9);
}

function Message_1nt0d0i() public payable checkRole(optionalList[0]) {
	require(elements[9].status==State.ENABLED);
	done(9);
roles["Bank"].transfer(msg.value);
	enable("EndEvent_0ex9qn4",10);
EndEvent_0ex9qn4(); 
}

function EndEvent_0ex9qn4() private {
	require(elements[10].status==State.ENABLED);
	done(10);  }

	function enable(string memory _taskID, uint position) internal {
		elements[position] = Element(_taskID, State.ENABLED);
	}
    function disable(uint elementNum) internal {
		elements[elementNum].status=State.DISABLED; }

    function done(uint elementNum) internal {
 		elements[elementNum].status=State.DONE; 			emit functionDone(elements[elementNum].ID);
		 }
   
    function getCurrentState()public view  returns(Element[11] memory, StateMemory memory){
        // emit stateChanged(elements, currentMemory);
        return (elements, currentMemory);
    }
    
    function compareStrings (string memory a, string memory b) internal pure returns (bool) { 
        return keccak256(abi.encode(a)) == keccak256(abi.encode(b)); 
    }
}