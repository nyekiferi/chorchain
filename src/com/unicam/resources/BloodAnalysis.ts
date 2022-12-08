import FireFly from '@hyperledger/firefly-sdk';
import express from 'express';

const firefly = new FireFly({ host: 'http://localhost:5000'});

const app = express();

app.use(express.static(__dirname));
app.use(express.urlencoded({ extended: true }));
app.listen(8080);

async function main() {
	app.post('/invoke', function(req, res){
		invokSmartContract('bloodanalysis', 'funcForOk');
	})
}

main().catch(err => {
    console.error(`Failed to run: ${err}`);
});

async function invokSmartContract(contractApiName: string, funcForOk: string){
	await firefly.invokeContractAPI(
		contractApiName,
		funcForOk,
		{
			input: {
				param: true
			}
		}
	)
}

