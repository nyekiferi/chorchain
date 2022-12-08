 pragma solidity ^0.5.3; 
	pragma experimental ABIEncoderV2;
	contract online{
	event functionDone(string);
	enum State {DISABLED, ENABLED, DONE} State s; 
	struct Element{
			string ID;
		State status;
	}
		struct StateMemory{
	string product;
uint price;
bool accepted;
 bool reiterate;
string motivation;
string shipAddress;
string shipInfo;
string invoiceInfo;
}
	Element[20] elements;
	  StateMemory currentMemory;
	string[2] roleList = [ "Buyer", "Seller" ]; 
	mapping(string=>address payable) roles; 
constructor() public{
        elements[1] = Element("sid-0EC70E7E-A42A-4C9E-B120-16B25BDACE7A", State.ENABLED);
         //roles definition
         //mettere address utenti in base ai ruoli
	roles["Buyer"] = 0xe47e9B5B5D4C5B0dCab8b7989FD294ecBa124D81;
	roles["Seller"] = 0x9e80eBa685B1831f2718A248b18eA58aFD81864c;
		//enable the start process
		sid-0EC70E7E-A42A-4C9E-B120-16B25BDACE7A();
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
    
} function sid_0EC70E7E_A42A_4C9E_B120_16B25BDACE7A() private {
	require(elements[1].status==State.ENABLED);
	done(1);
	enable("sid-00e1b46c-e485-4551-a17b-6f0c3f21ec2c",2);

}

function sid_00e1b46c_e485_4551_a17b_6f0c3f21ec2c(string memory product) public checkRole(roleList[0]) {
	require(elements[2].status==State.ENABLED);  
	done(2);
currentMemory.product=product;
	enable("sid-C240C6E9-F55F-46A5-B1F6-5FC4A0F30B04",3);
sid_C240C6E9_F55F_46A5_B1F6_5FC4A0F30B04(); 
}

function sid_C240C6E9_F55F_46A5_B1F6_5FC4A0F30B04() private {
		require(elements[4].status==State.ENABLED);
		done(4);
	enable("sid-624ca53e-cc27-4a74-97be-055cb19cae54", 5);  
}

function sid_624ca53e_cc27_4a74_97be_055cb19cae54(uint price) public checkRole(roleList[1]){
	require(elements[5].status==State.ENABLED);  
	done(5);
	enable("sid-72ee2908-7c6b-4b9e-a80b-4734a6b2cb0b",6);
currentMemory.price=price;
}
function sid_72ee2908_7c6b_4b9e_a80b_4734a6b2cb0b(bool accepted, bool reiterate) public checkRole(roleList[0]){
	require(elements[6].status==State.ENABLED);
	done(6);
currentMemory.accepted=accepted;
currentMemory.reiterate=reiterate;
	enable("sid-E2CFD2E8-7869-4F28-AC83-296ED8FA7D6E",7);
sid_E2CFD2E8_7869_4F28_AC83_296ED8FA7D6E(); 
}

function sid_E2CFD2E8_7869_4F28_AC83_296ED8FA7D6E() private {
		require(elements[8].status==State.ENABLED);
		done(8);
if(currentMemory.accepted==true){enable("sid-94C810EF-69BE-4D67-91B8-4A34DF4D1940", 9); 
 sid_94C810EF_69BE_4D67_91B8_4A34DF4D1940(); 
}
else if(currentMemory.accepted==false){enable("sid-80A4BF32-23C1-4585-A70C-26A40D63DA7F", 10); 
 sid_80A4BF32_23C1_4585_A70C_26A40D63DA7F(); 
}
}

function sid_94C810EF_69BE_4D67_91B8_4A34DF4D1940() private {
	require(elements[9].status==State.ENABLED);
	done(9);
	enable("sid-abba267c-92e3-4944-a98a-d317e035c861",11); 
	enable("sid-e385b492-6b2b-475b-a8dd-8fc09513393b",12); 
}

function sid_abba267c_92e3_4944_a98a_d317e035c861(string memory motivation) public checkRole(roleList[0]) {
	require(elements[11].status==State.ENABLED);  
	done(11);
currentMemory.motivation=motivation;
disable(12);
	enable("sid-859C73C7-F0DD-45ED-AA88-E0DEA0340C91",13);
sid_859C73C7_F0DD_45ED_AA88_E0DEA0340C91(); 
}

function sid_e385b492_6b2b_475b_a8dd_8fc09513393b(string memory shipAddress) public checkRole(roleList[0]) {
	require(elements[12].status==State.ENABLED);  
	done(12);
currentMemory.shipAddress=shipAddress;
disable(11);
	enable("sid-b9828a39-b70d-4470-b5d2-61cda9b2bc64",14);
}

function sid_b9828a39_b70d_4470_b5d2_61cda9b2bc64(uint amount) public payable checkRole(roleList[0]) {
	require(elements[14].status==State.ENABLED);
	done(14);
roles["Seller"].transfer(msg.value);
	enable("sid-0663CB4E-D3BF-4E12-8D81-D68E9318355F",15);
sid_0663CB4E_D3BF_4E12_8D81_D68E9318355F(); 
}

function sid_0663CB4E_D3BF_4E12_8D81_D68E9318355F() private { 
	require(elements[15].status==State.ENABLED);
	done(15);
	enable("sid-2F272EDB-9940-467E-AADC-2B485679AF43", 16); 
	enable("sid-06caa7c5-fba5-4524-8d4d-2f24b1d51468", 17); 
}

function sid_859C73C7_F0DD_45ED_AA88_E0DEA0340C91() private {
	require(elements[13].status==State.ENABLED);
	done(13);  }

function sid_2F272EDB_9940_467E_AADC_2B485679AF43(string memory shipInfo) public checkRole(roleList[1]) {
	require(elements[16].status==State.ENABLED);  
	done(16);
currentMemory.shipInfo=shipInfo;
	enable("sid-CCD2A372-D382-426E-B823-05F778D4EA44",18);
sid_CCD2A372_D382_426E_B823_05F778D4EA44(); 
}

function sid_06caa7c5_fba5_4524_8d4d_2f24b1d51468(string memory invoiceInfo) public checkRole(roleList[1]) {
	require(elements[17].status==State.ENABLED);  
	done(17);
currentMemory.invoiceInfo=invoiceInfo;
	enable("sid-CCD2A372-D382-426E-B823-05F778D4EA44",18);
sid_CCD2A372_D382_426E_B823_05F778D4EA44(); 
}

function sid_CCD2A372_D382_426E_B823_05F778D4EA44() private { 
	require(elements[18].status==State.ENABLED);
	done(18);
	if( elements[16].status==State.DONE && elements[17].status==State.DONE ) { 
	enable("sid-094362A8-CC68-4CB6-AC98-74DCF1163997", 19); 
sid_094362A8_CC68_4CB6_AC98_74DCF1163997(); 
}} 

function sid_094362A8_CC68_4CB6_AC98_74DCF1163997() private {
	require(elements[19].status==State.ENABLED);
	done(19);  }

function sid_80A4BF32_23C1_4585_A70C_26A40D63DA7F() private {
		require(elements[20].status==State.ENABLED);
		done(20);
if(currentMemory.reiterate==true
){enable("sid-C240C6E9-F55F-46A5-B1F6-5FC4A0F30B04", 3); 
 sid_C240C6E9_F55F_46A5_B1F6_5FC4A0F30B04(); 
}
else if(currentMemory.reiterate==false){enable("sid-E761CE7E-ED53-413A-A3C8-3D6569A80525", 21); 
 sid_E761CE7E_ED53_413A_A3C8_3D6569A80525(); 
}
}

function sid_C240C6E9_F55F_46A5_B1F6_5FC4A0F30B04() private {
		require(elements[4].status==State.ENABLED);
		done(4);
	enable("sid-624ca53e-cc27-4a74-97be-055cb19cae54", 5);  
}

function sid_E761CE7E_ED53_413A_A3C8_3D6569A80525() private {
	require(elements[21].status==State.ENABLED);
	done(21);  }

	function enable(string memory _taskID, uint position) internal {
		elements[position] = Element(_taskID, State.ENABLED);
	}
    function disable(uint elementNum) internal {
		elements[elementNum].status=State.DISABLED; }

    function done(uint elementNum) internal {
 		elements[elementNum].status=State.DONE; 			emit functionDone(elements[elementNum].ID);
		 }
   
    function getCurrentState()public view  returns(Element[20] memory, StateMemory memory){
        // emit stateChanged(elements, currentMemory);
        return (elements, currentMemory);
    }
    
    function compareStrings (string memory a, string memory b) internal pure returns (bool) { 
        return keccak256(abi.encode(a)) == keccak256(abi.encode(b)); 
    }
}