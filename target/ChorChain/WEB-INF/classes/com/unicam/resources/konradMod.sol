 pragma solidity ^0.5.3; 
	pragma experimental ABIEncoderV2;
	contract konradMod{
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
string offer;
bool accepted;
}
	Element[13] elements;
	  StateMemory currentMemory;
	string[2] roleList = [ "Customer", "Seller" ]; 
	mapping(string=>address payable) roles; 
constructor() public{
        elements[9] = Element("StartEvent_0feoz70", State.ENABLED);
         //roles definition
         //mettere address utenti in base ai ruoli
	roles["Customer"] = 0xe47e9B5B5D4C5B0dCab8b7989FD294ecBa124D81;
	roles["Seller"] = 0x9e80eBa685B1831f2718A248b18eA58aFD81864c;
		//enable the start process
		StartEvent_0feoz70();
		emit functionDone("Contract creation");
	}
modifier checkRole(string memory role){ 
	require(msg.sender == roles[role]);
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
function() external payable{
    
} function Message_056a5rn(address customerId) public checkRole(roleList[0]){
	require(elements[1].status==State.ENABLED);  
	done(1);
	enable("Message_0r1c26j",2);
currentMemory.addresscustomerId=addresscustomerId;
}
function Message_0r1c26j(address customerId) public checkRole(roleList[0]){
	require(elements[2].status==State.ENABLED);
	done(2);
currentMemory.addresscustomerId=addresscustomerId;
	enable("Message_1ueoupa",3);
}

function Message_1ueoupa(address sellerId) public checkRole(roleList[0]){
	require(elements[3].status==State.ENABLED);
	done(3);
currentMemory.addresssellerId=addresssellerId;
	enable("Message_0kbobkb",4);
}

function Message_0kbobkb(string memory contract) public checkRole(roleList[1]){
	require(elements[4].status==State.ENABLED);  
	done(4);
	enable("Message_0l5brh3",5);
currentMemory.contract=contract;
}
function Message_0l5brh3(string memory titleDeed) public checkRole(roleList[0]){
	require(elements[5].status==State.ENABLED);
	done(5);
currentMemory.titleDeed=titleDeed;
	enable("Message_1nt0d0i",6);
}

function Message_1nt0d0i() public payable checkRole(roleList[1]) {
	require(elements[6].status==State.ENABLED);
	done(6);
roles["Customer"].transfer(msg.value);
	enable("ExclusiveGateway_0kidybh",7);
ExclusiveGateway_0kidybh(); 
}

function ExclusiveGateway_0kidybh() private {
		require(elements[7].status==State.ENABLED);
		done(7);
	enable("EndEvent_0ex9qn4", 8);  
EndEvent_0ex9qn4(); 
}

function EndEvent_0ex9qn4() private {
	require(elements[8].status==State.ENABLED);
	done(8);  }

function StartEvent_0feoz70() private {
	require(elements[9].status==State.ENABLED);
	done(9);
	enable("Message_1ck6jii",10);

}

function Message_1ck6jii(string memory offer) public checkRole(roleList[1]){
	require(elements[10].status==State.ENABLED);  
	done(10);
	enable("Message_1yps7rz",11);
currentMemory.offer=offer;
}
function Message_1yps7rz(bool accepted) public checkRole(roleList[0]){
	require(elements[11].status==State.ENABLED);
	done(11);
currentMemory.accepted=accepted;
	enable("ExclusiveGateway_0xmw7j9",12);
ExclusiveGateway_0xmw7j9(); 
}

function ExclusiveGateway_0xmw7j9() private {
		require(elements[12].status==State.ENABLED);
		done(12);
if(currentMemory.accepted==true){enable("Message_056a5rn", 1); 
 }
else if(currentMemory.accepted==false){enable("ExclusiveGateway_0kidybh", 7); 
 ExclusiveGateway_0kidybh(); 
}
}

	function enable(string memory _taskID, uint position) internal {
		elements[position] = Element(_taskID, State.ENABLED);
	}
    function disable(uint elementNum) internal {
		elements[elementNum].status=State.DISABLED; }

    function done(uint elementNum) internal {
 		elements[elementNum].status=State.DONE; 			emit functionDone(elements[elementNum].ID);
		 }
   
    function getCurrentState()public view  returns(Element[13] memory, StateMemory memory){
        // emit stateChanged(elements, currentMemory);
        return (elements, currentMemory);
    }
    
    function compareStrings (string memory a, string memory b) internal pure returns (bool) { 
        return keccak256(abi.encode(a)) == keccak256(abi.encode(b)); 
    }
}