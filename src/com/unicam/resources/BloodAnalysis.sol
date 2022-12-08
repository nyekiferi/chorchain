 // SPDX-License-Identifier: Apache-2.0 
pragma solidity ^0.8.10;
// Declares a new contract
contract BloodAnalysis{
	//#region "Events"
	event functionDone(string);
	event messageMustSend(string);
	//#endregion "Events"
	
	enum State {DISABLED, ENABLED, DONE} State s; 
	
	//#region "Structs"
	struct Element{
		string ID;
		State status;
	}
	
	struct StateMemory{
		string sample;
		string patientData;
		string result;
		string bloodResults;
	}
	//#endregion "Structs"
	
	Element[9] elements;
	StateMemory currentMemory;
	bool ok = false;
	string[3] roleList = ["Gynecologist", "Hospital", "Lab" ];
	mapping(string=>address) roles;

	constructor() public {
		elements[1] = Element("StartEvent_0m7hz56", State.ENABLED);
		
		//roles definition
		roles["Gynecologist"] = 0x27D1d03E473da3C94f43c3d0B1622FF6C42BcD08;
		roles["Hospital"] = 0x27D1d03E473da3C94f43c3d0B1622FF6C42BcD08;
		roles["Lab"] = 0x27D1d03E473da3C94f43c3d0B1622FF6C42BcD08;
		
		//enable the start process
		StartEvent_0m7hz56();
		emit functionDone("Contract creation");
	}
	
	//#region "Modifiers"
	modifier checkRole(string memory role){ 
		require(msg.sender == roles[role]);
		_;
	}
	//#endregion "Modifiers"
	
	function getRoles() public view returns( string[] memory, address[] memory){
		uint c = roleList.length;
    	string[] memory allRoles = new string[](c);
    	address[] memory allAddresses = new address[](c);
    	
    	for(uint i = 0; i < roleList.length; i ++){
        	allRoles[i] = roleList[i];
        	allAddresses[i] = roles[roleList[i]];
    	}
    	return (allRoles, allAddresses);
	}
	
 	function StartEvent_0m7hz56() private {
		require(elements[1].status==State.ENABLED);
		done(1);
		enable("ParallelGateway_1pgjqtw",2);
		ParallelGateway_1pgjqtw ();
	}

	function ParallelGateway_1pgjqtw() private {
		require(elements[2].status==State.ENABLED);
		done(2);
		enable("Message_0gswvmq", 3);
		enable("Message_0wq8mc6", 4);
	}

	function Message_0gswvmq(string memory sample) public checkRole(roleList[0]) {
		emit messageMustSend(roleList[0]);
		require(elements[3].status==State.ENABLED);
		done(3);
		currentMemory.sample=sample;
		enable("Message_1vzqd37",5);
	}

	function Message_0wq8mc6(string memory patientData) public checkRole(roleList[0]) {
		emit messageMustSend(roleList[0]);
		require(elements[4].status==State.ENABLED);
		done(4);
		currentMemory.patientData=patientData;
		enable("ParallelGateway_16ab76f",6);
		ParallelGateway_16ab76f(); 
	}

	function Message_1vzqd37(string memory result) public checkRole(roleList[2]) {
		emit messageMustSend(roleList[2]);
		require(elements[5].status==State.ENABLED);
		done(5);
		currentMemory.result=result;
		enable("ParallelGateway_16ab76f",6);
		ParallelGateway_16ab76f(); 
	}

	function ParallelGateway_16ab76f() private {
		require(elements[6].status==State.ENABLED);
		done(6);
		if( elements[5].status==State.DONE && elements[4].status==State.DONE ) {
			enable("Message_1rqbibd", 7);
		}
	}

	function Message_1rqbibd(string memory bloodResults) public checkRole(roleList[0]) {
		emit messageMustSend(roleList[0]);
		require(elements[7].status==State.ENABLED);
		done(7);
		currentMemory.bloodResults=bloodResults;
		enable("EndEvent_110myff",8);
		EndEvent_110myff(); 
	}

	function EndEvent_110myff() private {
		require(elements[8].status==State.ENABLED);
		done(8);
	}

	function enable(string memory _taskID, uint position) internal {
		elements[position] = Element(_taskID, State.ENABLED);
	}
	
	function disable(uint elementNum) internal {
		elements[elementNum].status=State.DISABLED;
	}
	
	function done(uint elementNum) internal {
		if(ok){
			elements[elementNum].status=State.DONE;
			emit functionDone(elements[elementNum].ID);
			ok = false;
		}
	}
   
	function funcForOk(bool param) public {
		ok = param;
	}
	
	function getCurrentState()public view  returns(Element[9] memory, StateMemory memory){
		return (elements, currentMemory);
	}
	
	function compareStrings (string memory a, string memory b) internal pure returns (bool) {
		return keccak256(abi.encode(a)) == keccak256(abi.encode(b));
	}
}